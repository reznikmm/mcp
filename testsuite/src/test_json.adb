--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

with Ada.Streams;

with VSS.JSON.Content_Handlers;
with VSS.JSON.Pull_Readers.Simple;
with VSS.JSON.Push_Writers;
with VSS.Stream_Element_Vectors.Conversions;
with VSS.Strings;
with VSS.Text_Streams.Memory_UTF8_Input;
with VSS.Text_Streams.Memory_UTF8_Output;

with MCP.Types.Inputs;
with MCP.Types.Outputs;

package body Test_JSON is

   Request_Metadata : constant String :=
     """_meta"":{""io.modelcontextprotocol/clientCapabilities"":{},"
     & """io.modelcontextprotocol/protocolVersion"":""test-version""}";

   generic
      type Element is private;
      with
        procedure Input
          (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
           Value   : out Element;
           Success : in out Boolean);
      with
        procedure Output
          (Handler :
             in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
           Value   : Element);
   package Codecs is

      function Parse (JSON : String; Value : out Element) return Boolean;
      function To_JSON (Value : Element) return String;
      procedure Round_Trip (JSON : String);

   end Codecs;

   package body Codecs is

      -----------
      -- Parse --
      -----------

      function Parse (JSON : String; Value : out Element) return Boolean is
         Data    : VSS.Stream_Element_Vectors.Stream_Element_Vector;
         Stream  :
           aliased VSS.Text_Streams.Memory_UTF8_Input.Memory_UTF8_Input_Stream;
         Reader  : VSS.JSON.Pull_Readers.Simple.JSON_Simple_Pull_Reader;
         Success : Boolean := True;
      begin
         for Item of JSON loop
            Data.Append (Ada.Streams.Stream_Element (Character'Pos (Item)));
         end loop;

         Stream.Set_Data (Data);
         Reader.Set_Stream (Stream'Unchecked_Access);
         Reader.Read_Next;

         if not Reader.Is_Start_Document then
            return False;
         end if;

         Reader.Read_Next;
         Input (Reader, Value, Success);

         return Success and then Reader.Is_End_Document;
      end Parse;

      -------------
      -- To_JSON --
      -------------

      function To_JSON (Value : Element) return String is
         Stream :
           aliased VSS
                     .Text_Streams
                     .Memory_UTF8_Output
                     .Memory_UTF8_Output_Stream;
         Writer : VSS.JSON.Push_Writers.JSON_Simple_Push_Writer;
      begin
         Writer.Set_Stream (Stream'Unchecked_Access);
         Writer.Start_Document;
         Output (Writer, Value);
         Writer.End_Document;

         if not Writer.Error_Message.Is_Empty then
            raise Program_Error with "JSON writer failed";
         end if;

         return
           VSS.Stream_Element_Vectors.Conversions.Unchecked_To_String
             (Stream.Buffer);
      end To_JSON;

      ----------------
      -- Round_Trip --
      ----------------

      procedure Round_Trip (JSON : String) is
         Value : Element;
      begin
         if not Parse (JSON, Value) then
            raise Program_Error with "Cannot parse: " & JSON;
         end if;

         declare
            Result : constant String := To_JSON (Value);
         begin
            if Result /= JSON then
               raise Program_Error
                 with "Expected: " & JSON & ASCII.LF & "Actual: " & Result;
            end if;
         end;
      end Round_Trip;

   end Codecs;

   package Requests is new
     Codecs
       (MCP.Types.ClientRequest,
        MCP.Types.Inputs.Input_ClientRequest,
        MCP.Types.Outputs.Output_ClientRequest);

   package Content is new
     Codecs
       (MCP.Types.ContentBlock,
        MCP.Types.Inputs.Input_ContentBlock,
        MCP.Types.Outputs.Output_ContentBlock);

   package Results is new
     Codecs
       (MCP.Types.CallToolResult,
        MCP.Types.Inputs.Input_CallToolResult,
        MCP.Types.Outputs.Output_CallToolResult);

   package Capabilities is new
     Codecs
       (MCP.Types.ServerCapabilities,
        MCP.Types.Inputs.Input_ServerCapabilities,
        MCP.Types.Outputs.Output_ServerCapabilities);

   package Resources is new
     Codecs
       (MCP.Types.ReadResourceResult,
        MCP.Types.Inputs.Input_ReadResourceResult,
        MCP.Types.Outputs.Output_ReadResourceResult);

   package Messages is new
     Codecs
       (MCP.Types.JSONRPCMessage,
        MCP.Types.Inputs.Input_JSONRPCMessage,
        MCP.Types.Outputs.Output_JSONRPCMessage);

   package Errors is new
     Codecs
       (MCP.Types.ParseError,
        MCP.Types.Inputs.Input_ParseError,
        MCP.Types.Outputs.Output_ParseError);

   -------------------
   -- Test_Requests --
   -------------------

   procedure Test_Requests (Op : in out Trendy_Test.Operation'Class) is
      use type MCP.Types.Enum.ClientRequest_Variant;
      use type MCP.Types.Integer_64;
      use type VSS.Strings.Virtual_String;

      JSON  : constant String :=
        "{""id"":42,""jsonrpc"":""2.0"",""method"":""tools/call"","
        & """params"":{"
        & Request_Metadata
        & ",""arguments"":{""x"":[1,true,null]},"
        & """name"":""echo""}}";
      Value : MCP.Types.ClientRequest;
   begin
      Op.Register (Parallelize => False);
      Op.Assert (Requests.Parse (JSON, Value));
      Op.Assert (Value.Union.Kind = MCP.Types.Enum.tools_call);
      Op.Assert (Value.Union.tools_call.id.Integer = 42);
      Op.Assert (Value.Union.tools_call.params.name = "echo");
      Requests.Round_Trip (JSON);
      Requests.Round_Trip
        ("{""id"":""request-1"",""jsonrpc"":""2.0"","
         & """method"":""tools/call"",""params"":{"
         & Request_Metadata
         & ","
         & """name"":""echo""}}");
   end Test_Requests;

   ------------------
   -- Test_Content --
   ------------------

   procedure Test_Content (Op : in out Trendy_Test.Operation'Class) is
      use type MCP.Types.Enum.ContentBlock_Variant;
      use type VSS.Strings.Virtual_String;

      Value : MCP.Types.ContentBlock;
   begin
      Op.Register (Parallelize => False);
      --  The discriminator may follow other properties.
      Op.Assert
        (Content.Parse
           ("{""text"":""\u041f\u0440\u0438\u0432\u0456\u0442!"","
            & """type"":""text""}",
            Value));
      Op.Assert (Value.Union.Kind = MCP.Types.Enum.text);
      Op.Assert (Value.Union.text.text = "Привіт!");
      Content.Round_Trip ("{""text"":""Hello!"",""type"":""text""}");
      Content.Round_Trip
        ("{""data"":""aGk="",""mimeType"":""audio/wav"","
         & """type"":""audio""}");
      Content.Round_Trip
        ("{""data"":""aGk="",""mimeType"":""image/png"","
         & """type"":""image""}");
      Results.Round_Trip
        ("{""content"":[{""text"":""Hello!"",""type"":""text""}],"
         & """resultType"":""complete"",""structuredContent"":{""n"":1}}");
   end Test_Content;

   --------------------------------
   -- Test_Additional_Properties --
   --------------------------------

   procedure Test_Additional_Properties
     (Op : in out Trendy_Test.Operation'Class) is
   begin
      Op.Register (Parallelize => False);
      Capabilities.Round_Trip
        ("{""tools"":{""listChanged"":true,"
         & """future"":{""enabled"":true}},""extension"":[null,2]}");
   end Test_Additional_Properties;

   -------------------
   -- Test_Raw_JSON --
   -------------------

   procedure Test_Raw_JSON (Op : in out Trendy_Test.Operation'Class) is
   begin
      Op.Register (Parallelize => False);
      Resources.Round_Trip
        ("{""cacheScope"":""private"",""contents"":["
         & "{""uri"":""file:///a"",""text"":""Hello!""},"
         & "{""uri"":""file:///b"",""blob"":""aGk=""}],"
         & """resultType"":""complete"",""ttlMs"":0}");
      Messages.Round_Trip
        ("{""jsonrpc"":""2.0"",""id"":""r1"","
         & """result"":{""nested"":[null,{},false,3]}}");
      Errors.Round_Trip ("{""code"":-32700,""message"":""Parse error""}");
   end Test_Raw_JSON;

   -------------------------
   -- Test_Invalid_Values --
   -------------------------

   procedure Test_Invalid_Values (Op : in out Trendy_Test.Operation'Class) is
      Value   : MCP.Types.ContentBlock;
      Request : MCP.Types.ClientRequest;
      Error   : MCP.Types.ParseError;
   begin
      Op.Register (Parallelize => False);
      Op.Assert (not Content.Parse ("{""type"":""unknown""}", Value));
      Op.Assert (not Content.Parse ("{""text"":17,""type"":""text""}", Value));
      Op.Assert
        (not Requests.Parse
               ("{""id"":1,""jsonrpc"":""1.0"",""method"":""tools/call"","
                & """params"":{"
                & Request_Metadata
                & ",""name"":""echo""}}",
                Request));
      Op.Assert
        (not Errors.Parse ("{""code"":0,""message"":""Wrong code""}", Error));
   end Test_Invalid_Values;

end Test_JSON;
