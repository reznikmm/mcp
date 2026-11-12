--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
------------------------------------------------------------------

with Ada.IO_Exceptions;

with VSS.JSON.Pull_Readers.Simple;
with VSS.JSON.Push_Writers;
with VSS.JSON.Streams;
with VSS.Stream_Element_Vectors.Conversions;
with VSS.Strings;
with VSS.Text_Streams.Memory_UTF8_Input;
with VSS.Text_Streams.Memory_UTF8_Output;

with MCP.Types.Inputs;

package body Demo.RPC is
   use all type VSS.JSON.Streams.JSON_Stream_Element_Kind;
   use type VSS.JSON.JSON_Number_Kind;
   use type VSS.Strings.Virtual_String;
   use type MCP.Types.Integer_64;

   procedure Check_Envelope
     (Data       : VSS.Stream_Element_Vectors.Stream_Element_Vector;
      Identifier : MCP.Types.Integer_Or_String);

   --------------------
   -- Check_Envelope --
   --------------------

   procedure Check_Envelope
     (Data       : VSS.Stream_Element_Vectors.Stream_Element_Vector;
      Identifier : MCP.Types.Integer_Or_String)
   is
      Stream         :
        aliased VSS.Text_Streams.Memory_UTF8_Input.Memory_UTF8_Input_Stream;
      Reader         : VSS.JSON.Pull_Readers.Simple.JSON_Simple_Pull_Reader;
      Raw            : MCP.Types.JSONRPCMessage;
      Success        : Boolean := True;
      Depth          : Natural := 0;
      Key            : VSS.Strings.Virtual_String;
      Has_Identifier : Boolean := False;
      Has_Version    : Boolean := False;
      Has_Result     : Boolean := False;
      Has_Error      : Boolean := False;
   begin
      Stream.Set_Data (Data);
      Reader.Set_Stream (Stream'Unchecked_Access);
      Reader.Read_Next;
      if not Reader.Is_Start_Document then
         raise Ada.IO_Exceptions.Data_Error with "invalid JSON response";
      end if;
      Reader.Read_Next;
      MCP.Types.Inputs.Input_JSONRPCMessage (Reader, Raw, Success);
      if not Success
        or else not Reader.Is_End_Document
        or else Raw.Is_Empty
        or else Raw.First_Element.Kind /= Start_Object
      then
         raise Ada.IO_Exceptions.Data_Error with "invalid JSON response";
      end if;

      for Event of Raw loop
         if Depth = 1 and Event.Kind /= End_Object then
            if Event.Kind = Key_Name then
               Key := Event.Key_Name;
            elsif Key = "jsonrpc" then
               if Has_Version
                 or else Event.Kind /= String_Value
                 or else Event.String_Value /= "2.0"
               then
                  raise Ada.IO_Exceptions.Data_Error
                    with "invalid jsonrpc version";
               end if;
               Has_Version := True;
            elsif Key = "id" then
               if Has_Identifier then
                  raise Ada.IO_Exceptions.Data_Error
                    with "duplicate response ID";
               elsif Identifier.Is_String then
                  if Event.Kind /= String_Value
                    or else Event.String_Value /= Identifier.String
                  then
                     raise Ada.IO_Exceptions.Data_Error
                       with "mismatched response ID";
                  end if;
               elsif Event.Kind /= Number_Value
                 or else Event.Number_Value.Kind /= VSS.JSON.JSON_Integer
                 or else Event.Number_Value.Integer_Value /= Identifier.Integer
               then
                  raise Ada.IO_Exceptions.Data_Error
                    with "mismatched response ID";
               end if;
               Has_Identifier := True;
            elsif Key = "result" then
               if Has_Result or else Event.Kind /= Start_Object then
                  raise Ada.IO_Exceptions.Data_Error
                    with "invalid response result";
               end if;
               Has_Result := True;
            elsif Key = "error" then
               if Has_Error or else Event.Kind /= Start_Object then
                  raise Ada.IO_Exceptions.Data_Error
                    with "invalid response error";
               end if;
               Has_Error := True;
            end if;
         end if;

         case Event.Kind is
            when Start_Object | Start_Array =>
               Depth := Depth + 1;

            when End_Object | End_Array     =>
               Depth := Depth - 1;

            when others                     =>
               null;
         end case;
      end loop;

      if not Has_Identifier or not Has_Version or Has_Result = Has_Error then
         raise Ada.IO_Exceptions.Data_Error with "invalid JSON-RPC response";
      elsif Has_Error then
         raise Ada.IO_Exceptions.Data_Error
           with
             "server returned an error: "
             & VSS.Stream_Element_Vectors.Conversions.Unchecked_To_String
                 (Data);
      end if;
   end Check_Envelope;

   ----------
   -- Call --
   ----------

   procedure Call
     (Channel    : in out Demo.Connection.Channel;
      Identifier : MCP.Types.Integer_Or_String;
      Request    : Request_Type;
      Response   : out Response_Type)
   is
      Output  :
        aliased VSS.Text_Streams.Memory_UTF8_Output.Memory_UTF8_Output_Stream;
      Input   :
        aliased VSS.Text_Streams.Memory_UTF8_Input.Memory_UTF8_Input_Stream;
      Writer  : VSS.JSON.Push_Writers.JSON_Simple_Push_Writer;
      Reader  : VSS.JSON.Pull_Readers.Simple.JSON_Simple_Pull_Reader;
      Success : Boolean := True;
   begin
      Writer.Set_Stream (Output'Unchecked_Access);
      Writer.Start_Document;
      Output_Request (Writer, Request);
      Writer.End_Document;
      if not Writer.Error_Message.Is_Empty then
         raise Ada.IO_Exceptions.Data_Error with "cannot serialize request";
      end if;
      Demo.Connection.Send (Channel, Output.Buffer);

      declare
         Data : constant VSS.Stream_Element_Vectors.Stream_Element_Vector :=
           Demo.Connection.Receive (Channel);
      begin
         Check_Envelope (Data, Identifier);
         Input.Set_Data (Data);
      end;
      Reader.Set_Stream (Input'Unchecked_Access);
      Reader.Read_Next;
      Reader.Read_Next;
      Input_Response (Reader, Response, Success);
      --  As in the server demo, End_Document is the completion check for
      --  this VSS version, which also reports a reader error at normal EOF.
      if not Success or else not Reader.Is_End_Document then
         raise Ada.IO_Exceptions.Data_Error with "invalid response payload";
      end if;
   end Call;

end Demo.RPC;
