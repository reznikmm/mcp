--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
------------------------------------------------------------------

with Ada.Containers;
with Ada.Streams;

with VSS.JSON.Content_Handlers;
with VSS.JSON.Pull_Readers.Simple;
with VSS.JSON.Push_Writers;
with VSS.JSON.Streams;
with VSS.Strings;
with VSS.Text_Streams.Memory_UTF8_Input;
with VSS.Text_Streams.Memory_UTF8_Output;

with MCP.Types.Inputs;
with MCP.Types.Outputs;

package body Demo.Messages is
   use all type VSS.JSON.Streams.JSON_Stream_Element_Kind;
   use type Ada.Containers.Count_Type;
   use type VSS.JSON.JSON_Number_Kind;
   use type VSS.Strings.Virtual_String;
   use type MCP.Types.Integer_64;

   Protocol_Version : constant VSS.Strings.Virtual_String := "2026-07-28";

   function Member
     (Object : MCP.Types.Any_Value'Class; Name : VSS.Strings.Virtual_String)
      return MCP.Types.Any_Value;

   function String_Value
     (Value : MCP.Types.Any_Value'Class) return VSS.Strings.Virtual_String;

   procedure Write_Identifier
     (Writer     : in out VSS.JSON.Push_Writers.JSON_Simple_Push_Writer;
      Identifier : MCP.Types.Optional_Integer_Or_String);

   function Error_Response
     (Identifier : MCP.Types.Optional_Integer_Or_String;
      Code       : MCP.Types.Integer_64;
      Message    : VSS.Strings.Virtual_String;
      Requested  : VSS.Strings.Virtual_String :=
        VSS.Strings.Empty_Virtual_String)
      return VSS.Stream_Element_Vectors.Stream_Element_Vector;

   function Echo_Schema return MCP.Types.Any_Object;

   generic
      type Value_Type is private;
      with
        procedure Input
          (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
           Value   : out Value_Type;
           Success : in out Boolean);
   function Decode
     (Data  : VSS.Stream_Element_Vectors.Stream_Element_Vector;
      Value : out Value_Type) return Boolean;

   function Decode
     (Data  : VSS.Stream_Element_Vectors.Stream_Element_Vector;
      Value : out Value_Type) return Boolean
   is
      Stream  :
        aliased VSS.Text_Streams.Memory_UTF8_Input.Memory_UTF8_Input_Stream;
      Reader  : VSS.JSON.Pull_Readers.Simple.JSON_Simple_Pull_Reader;
      Success : Boolean := True;
   begin
      Stream.Set_Data (Data);
      Reader.Set_Stream (Stream'Unchecked_Access);
      Reader.Read_Next;
      if not Reader.Is_Start_Document then
         return False;
      end if;
      Reader.Read_Next;
      Input (Reader, Value, Success);
      --  This VSS version also reports Premature_End_Of_Document at normal
      --  EOF. The completed End_Document event confirms successful parsing.
      return Success and then Reader.Is_End_Document;
   end Decode;

   function Read_Message is new
     Decode (MCP.Types.JSONRPCMessage, MCP.Types.Inputs.Input_JSONRPCMessage);
   function Read_Request is new
     Decode (MCP.Types.ClientRequest, MCP.Types.Inputs.Input_ClientRequest);

   ------------
   -- Member --
   ------------

   function Member
     (Object : MCP.Types.Any_Value'Class; Name : VSS.Strings.Virtual_String)
      return MCP.Types.Any_Value
   is
      use MCP.Types.JSON_Event_Lists;
      Position : Cursor := Object.First;
      Result   : MCP.Types.Any_Value;
      Found    : Boolean := False;
   begin
      if Object.Is_Empty or else Object.First_Element.Kind /= Start_Object then
         return Result;
      end if;
      Next (Position);
      while Has_Element (Position) and then Element (Position).Kind = Key_Name
      loop
         declare
            Selected : constant Boolean := Element (Position).Key_Name = Name;
            Depth    : Natural := 0;
         begin
            if Selected and Found then
               Result.Clear;
               return Result;
            end if;
            Found := Found or Selected;
            Next (Position);
            loop
               declare
                  Event : constant VSS.JSON.Streams.JSON_Stream_Element :=
                    Element (Position);
               begin
                  if Selected then
                     Result.Append (Event);
                  end if;
                  case Event.Kind is
                     when Start_Object | Start_Array =>
                        Depth := Depth + 1;

                     when End_Object | End_Array     =>
                        Depth := Depth - 1;

                     when others                     =>
                        null;
                  end case;
               end;
               Next (Position);
               exit when Depth = 0;
            end loop;
         end;
      end loop;
      return Result;
   end Member;

   ------------------
   -- String_Value --
   ------------------

   function String_Value
     (Value : MCP.Types.Any_Value'Class) return VSS.Strings.Virtual_String is
   begin
      if Value.Length = 1
        and then Value.First_Element.Kind = VSS.JSON.Streams.String_Value
      then
         return Value.First_Element.String_Value;
      end if;
      return VSS.Strings.Empty_Virtual_String;
   end String_Value;

   ----------------------
   -- Write_Identifier --
   ----------------------

   procedure Write_Identifier
     (Writer     : in out VSS.JSON.Push_Writers.JSON_Simple_Push_Writer;
      Identifier : MCP.Types.Optional_Integer_Or_String) is
   begin
      Writer.Key_Name ("id");
      if not Identifier.Is_Set then
         Writer.Null_Value;
      elsif Identifier.Value.Is_String then
         Writer.String_Value (Identifier.Value.String);
      else
         Writer.Integer_Value (Identifier.Value.Integer);
      end if;
   end Write_Identifier;

   generic
      type Result_Type is private;
      with
        procedure Output
          (Handler :
             in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
           Value   : Result_Type);
   function Response
     (Identifier : MCP.Types.Optional_Integer_Or_String; Value : Result_Type)
      return VSS.Stream_Element_Vectors.Stream_Element_Vector;

   function Response
     (Identifier : MCP.Types.Optional_Integer_Or_String; Value : Result_Type)
      return VSS.Stream_Element_Vectors.Stream_Element_Vector
   is
      Stream :
        aliased VSS.Text_Streams.Memory_UTF8_Output.Memory_UTF8_Output_Stream;
      Writer : VSS.JSON.Push_Writers.JSON_Simple_Push_Writer;
   begin
      Writer.Set_Stream (Stream'Unchecked_Access);
      Writer.Start_Document;
      Writer.Start_Object;
      Writer.Key_Name ("jsonrpc");
      Writer.String_Value ("2.0");
      Write_Identifier (Writer, Identifier);
      Writer.Key_Name ("result");
      Output (Writer, Value);
      Writer.End_Object;
      Writer.End_Document;
      if not Writer.Error_Message.Is_Empty then
         raise Program_Error with "cannot serialize MCP result";
      end if;
      return Stream.Buffer;
   end Response;

   function Discover_Response is new
     Response
       (MCP.Types.DiscoverResult,
        MCP.Types.Outputs.Output_DiscoverResult);
   function List_Response is new
     Response
       (MCP.Types.ListToolsResult,
        MCP.Types.Outputs.Output_ListToolsResult);
   function Call_Response is new
     Response
       (MCP.Types.CallToolResult,
        MCP.Types.Outputs.Output_CallToolResult);

   --------------------
   -- Error_Response --
   --------------------

   function Error_Response
     (Identifier : MCP.Types.Optional_Integer_Or_String;
      Code       : MCP.Types.Integer_64;
      Message    : VSS.Strings.Virtual_String;
      Requested  : VSS.Strings.Virtual_String :=
        VSS.Strings.Empty_Virtual_String)
      return VSS.Stream_Element_Vectors.Stream_Element_Vector
   is
      Stream :
        aliased VSS.Text_Streams.Memory_UTF8_Output.Memory_UTF8_Output_Stream;
      Writer : VSS.JSON.Push_Writers.JSON_Simple_Push_Writer;
      Error  : MCP.Types.Error;
   begin
      Error.code := Code;
      Error.message := Message;
      if not Requested.Is_Null then
         Error.data.Append ((Kind => Start_Object));
         Error.data.Append ((Key_Name, "requested"));
         Error.data.Append ((VSS.JSON.Streams.String_Value, Requested));
         Error.data.Append ((Key_Name, "supported"));
         Error.data.Append ((Kind => Start_Array));
         Error.data.Append ((VSS.JSON.Streams.String_Value, Protocol_Version));
         Error.data.Append ((Kind => End_Array));
         Error.data.Append ((Kind => End_Object));
      end if;
      Writer.Set_Stream (Stream'Unchecked_Access);
      Writer.Start_Document;
      Writer.Start_Object;
      Writer.Key_Name ("jsonrpc");
      Writer.String_Value ("2.0");
      Write_Identifier (Writer, Identifier);
      Writer.Key_Name ("error");
      MCP.Types.Outputs.Output_Error (Writer, Error);
      Writer.End_Object;
      Writer.End_Document;
      if not Writer.Error_Message.Is_Empty then
         raise Program_Error with "cannot serialize MCP error";
      end if;
      return Stream.Buffer;
   end Error_Response;

   -----------------
   -- Echo_Schema --
   -----------------

   function Echo_Schema return MCP.Types.Any_Object is
      JSON   : constant String :=
        "{""type"":""object"",""properties"":{""text"":{""type"":""string""}},"
        & """required"":[""text""],""additionalProperties"":false}";
      Data   : VSS.Stream_Element_Vectors.Stream_Element_Vector;
      Raw    : MCP.Types.JSONRPCMessage;
      Result : MCP.Types.Any_Object;
   begin
      for Item of JSON loop
         Data.Append (Ada.Streams.Stream_Element (Character'Pos (Item)));
      end loop;
      if not Read_Message (Data, Raw) then
         raise Program_Error with "invalid built-in echo schema";
      end if;
      for Event of Raw loop
         Result.Append (Event);
      end loop;
      return Result;
   end Echo_Schema;

   -------------
   -- Process --
   -------------

   procedure Process
     (Message : VSS.Stream_Element_Vectors.Stream_Element_Vector;
      Reply   : out VSS.Stream_Element_Vectors.Stream_Element_Vector)
   is
      Raw         : MCP.Types.JSONRPCMessage;
      Request     : MCP.Types.ClientRequest;
      Identifier  : MCP.Types.Optional_Integer_Or_String;
      Empty_Reply : VSS.Stream_Element_Vectors.Stream_Element_Vector;
      pragma Unmodified (Empty_Reply);
   begin
      Reply := Empty_Reply;
      if not Read_Message (Message, Raw) then
         Reply := Error_Response (Identifier, -32700, "Parse error");
         return;
      end if;

      declare
         Method       : constant VSS.Strings.Virtual_String :=
           String_Value (Member (Raw, "method"));
         Version      : constant VSS.Strings.Virtual_String :=
           String_Value (Member (Raw, "jsonrpc"));
         Id           : constant MCP.Types.Any_Value := Member (Raw, "id");
         Params       : constant MCP.Types.Any_Value := Member (Raw, "params");
         Metadata     : constant MCP.Types.Any_Value :=
           Member (Params, "_meta");
         Capabilities : constant MCP.Types.Any_Value :=
           Member (Metadata, "io.modelcontextprotocol/clientCapabilities");
         Requested    : constant VSS.Strings.Virtual_String :=
           String_Value
             (Member (Metadata, "io.modelcontextprotocol/protocolVersion"));
      begin
         if Method.Is_Null or Version /= "2.0" then
            Reply := Error_Response (Identifier, -32600, "Invalid request");
            return;
         elsif Id.Is_Empty then
            --  Notifications never receive a response in this demo.
            return;
         elsif Id.Length = 1
           and then Id.First_Element.Kind = VSS.JSON.Streams.String_Value
         then
            Identifier := (True, (True, Id.First_Element.String_Value));
         elsif Id.Length = 1
           and then Id.First_Element.Kind = Number_Value
           and then Id.First_Element.Number_Value.Kind = VSS.JSON.JSON_Integer
         then
            Identifier :=
              (True, (False, Id.First_Element.Number_Value.Integer_Value));
         else
            Reply := Error_Response (Identifier, -32600, "Invalid request ID");
            return;
         end if;

         if Method /= "server/discover"
           and Method /= "tools/list"
           and Method /= "tools/call"
         then
            Reply := Error_Response (Identifier, -32601, "Method not found");
         elsif Requested.Is_Null
           or else Capabilities.Is_Empty
           or else Capabilities.First_Element.Kind /= Start_Object
         then
            Reply :=
              Error_Response
                (Identifier, -32602, "Missing or invalid request metadata");
         elsif Requested /= Protocol_Version then
            Reply :=
              Error_Response
                (Identifier,
                 -32022,
                 "Unsupported protocol version",
                 Requested);
         elsif not Read_Request (Message, Request) then
            Reply := Error_Response (Identifier, -32602, "Invalid parameters");
         else
            case Request.Union.Kind is
               when MCP.Types.Enum.server_discover =>
                  declare
                     Result : MCP.Types.DiscoverResult;
                  begin
                     Result.cacheScope := MCP.Types.Enum.a_private;
                     Result.capabilities.tools :=
                       (Is_Set => True, Value => <>);
                     Result.instructions := "Ada demo: call echo with text.";
                     Result.resultType := "complete";
                     Result.supportedVersions.Append (Protocol_Version);
                     Result.ttlMs := 0;
                     Reply := Discover_Response (Identifier, Result);
                  end;

               when MCP.Types.Enum.tools_list      =>
                  declare
                     Result : MCP.Types.ListToolsResult;
                     Tool   : MCP.Types.Tool;
                  begin
                     Tool.name := "echo";
                     Tool.description := "Return the supplied text unchanged.";
                     Tool.inputSchema := Echo_Schema;
                     Result.cacheScope := MCP.Types.Enum.a_private;
                     Result.resultType := "complete";
                     Result.ttlMs := 0;
                     Result.tools.Append (Tool);
                     Reply := List_Response (Identifier, Result);
                  end;

               when MCP.Types.Enum.tools_call      =>
                  declare
                     Result : MCP.Types.CallToolResult;
                     Block  : MCP.Types.ContentBlock;
                     Text   : constant MCP.Types.Any_Value :=
                       Member
                         (Request.Union.tools_call.params.arguments, "text");
                  begin
                     if Request.Union.tools_call.params.name /= "echo" then
                        Reply :=
                          Error_Response
                            (Identifier,
                             -32602,
                             "Unknown tool (expected echo)");
                     elsif Text.Length /= 1
                       or else Text.First_Element.Kind
                               /= VSS.JSON.Streams.String_Value
                       or else Request.Union.tools_call.params.arguments.Length
                               /= 4
                     then
                        Reply :=
                          Error_Response
                            (Identifier,
                             -32602,
                             "echo expects one string field: text");
                     else
                        Block.Union :=
                          (Kind => MCP.Types.Enum.text, others => <>);
                        Block.Union.text.text :=
                          Text.First_Element.String_Value;
                        Result.content.Append (Block);
                        Result.resultType := "complete";
                        Reply := Call_Response (Identifier, Result);
                     end if;
                  end;

               when others                         =>
                  Reply :=
                    Error_Response (Identifier, -32601, "Method not found");
            end case;
         end if;
      end;
   end Process;

end Demo.Messages;
