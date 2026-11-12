--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
------------------------------------------------------------------

with Ada.Command_Line;
with Ada.Exceptions;
with Ada.IO_Exceptions;
with Ada.Wide_Wide_Text_IO;

with VSS.JSON.Pull_Readers.Simple;
with VSS.JSON.Push_Writers;
with VSS.JSON.Streams;
with VSS.Strings.Conversions;
with VSS.Text_Streams.Memory_UTF8_Input;
with VSS.Text_Streams.Memory_UTF8_Output;

with MCP.Types.Inputs;
with MCP.Types.Outputs;

with Demo.Connection;
with Demo.RPC;

procedure MCP_Client_Demo is
   use type MCP.Types.Enum.ContentBlock_Variant;
   use type VSS.Strings.Virtual_String;

   package Discovery is new
     Demo.RPC
       (MCP.Types.DiscoverRequest,
        MCP.Types.DiscoverResultResponse,
        MCP.Types.Outputs.Output_DiscoverRequest,
        MCP.Types.Inputs.Input_DiscoverResultResponse);

   package Listing is new
     Demo.RPC
       (MCP.Types.ListToolsRequest,
        MCP.Types.ListToolsResultResponse,
        MCP.Types.Outputs.Output_ListToolsRequest,
        MCP.Types.Inputs.Input_ListToolsResultResponse);

   package Calling is new
     Demo.RPC
       (MCP.Types.CallToolRequest,
        MCP.Types.CallToolResultResponse,
        MCP.Types.Outputs.Output_CallToolRequest,
        MCP.Types.Inputs.Input_CallToolResultResponse);

   function Read_Call_Result
     (Value : MCP.Types.Any_Value) return MCP.Types.CallToolResult;
   --  Decode the opaque result field after a successful tools/call response.

   ----------------------
   -- Read_Call_Result --
   ----------------------

   function Read_Call_Result
     (Value : MCP.Types.Any_Value) return MCP.Types.CallToolResult
   is
      Raw     : MCP.Types.JSONRPCMessage;
      Output  :
        aliased VSS.Text_Streams.Memory_UTF8_Output.Memory_UTF8_Output_Stream;
      Input   :
        aliased VSS.Text_Streams.Memory_UTF8_Input.Memory_UTF8_Input_Stream;
      Writer  : VSS.JSON.Push_Writers.JSON_Simple_Push_Writer;
      Reader  : VSS.JSON.Pull_Readers.Simple.JSON_Simple_Pull_Reader;
      Result  : MCP.Types.CallToolResult;
      Success : Boolean := True;
   begin
      --  The schema's result union currently uses JSON event storage.
      for Event of Value loop
         Raw.Append (Event);
      end loop;
      Writer.Set_Stream (Output'Unchecked_Access);
      Writer.Start_Document;
      MCP.Types.Outputs.Output_JSONRPCMessage (Writer, Raw);
      Writer.End_Document;
      if not Writer.Error_Message.Is_Empty then
         raise Ada.IO_Exceptions.Data_Error with "invalid tool result";
      end if;
      Input.Set_Data (Output.Buffer);
      Reader.Set_Stream (Input'Unchecked_Access);
      Reader.Read_Next;
      Reader.Read_Next;
      MCP.Types.Inputs.Input_CallToolResult (Reader, Result, Success);
      if not Success
        or else not Reader.Is_End_Document
        or else Result.resultType /= "complete"
      then
         raise Ada.IO_Exceptions.Data_Error with "unsupported tool result";
      end if;
      return Result;
   end Read_Call_Result;

   Protocol_Version : constant VSS.Strings.Virtual_String := "2026-07-28";
   Metadata         : constant MCP.Types.RequestMetaObject :=
     (io_modelcontextprotocol_protocolVersion => Protocol_Version,
      others                                  => <>);
   Channel          : Demo.Connection.Channel;
   Text             : VSS.Strings.Virtual_String := "Привіт з Ada!";
   Discover         : MCP.Types.DiscoverRequest;
   Discovered       : MCP.Types.DiscoverResultResponse;
   List_Tools       : MCP.Types.ListToolsRequest;
   Listed           : MCP.Types.ListToolsResultResponse;
   Call_Tool        : MCP.Types.CallToolRequest;
   Called           : MCP.Types.CallToolResultResponse;
   Has_Echo         : Boolean := False;
begin
   if Ada.Command_Line.Argument_Count > 1 then
      raise Ada.IO_Exceptions.Use_Error with "usage: mcp_client_demo [TEXT]";
   elsif Ada.Command_Line.Argument_Count = 1 then
      Text :=
        VSS.Strings.Conversions.To_Virtual_String
          (Ada.Command_Line.Argument (1));
   end if;

   Discover.id := (False, 1);
   Discover.params.meta := Metadata;
   Discovery.Call (Channel, Discover.id, Discover, Discovered);
   if not Discovered.result.supportedVersions.Contains (Protocol_Version)
     or else not Discovered.result.capabilities.tools.Is_Set
     or else Discovered.result.resultType /= "complete"
   then
      raise Ada.IO_Exceptions.Data_Error
        with "server lacks required capabilities";
   end if;
   Ada.Wide_Wide_Text_IO.Put_Line
     (Ada.Wide_Wide_Text_IO.Standard_Error,
      "Protocol: "
      & VSS.Strings.Conversions.To_Wide_Wide_String (Protocol_Version));

   List_Tools.id := (True, "tools");
   List_Tools.params.meta := Metadata;
   Listing.Call (Channel, List_Tools.id, List_Tools, Listed);
   if Listed.result.resultType /= "complete" then
      raise Ada.IO_Exceptions.Data_Error with "unsupported tool listing";
   end if;
   for Index in 1 .. Listed.result.tools.Length loop
      if Listed.result.tools (Index).name = "echo" then
         Has_Echo := True;
      end if;
   end loop;
   if not Has_Echo then
      raise Ada.IO_Exceptions.Data_Error with "server did not advertise echo";
   end if;
   Ada.Wide_Wide_Text_IO.Put_Line
     (Ada.Wide_Wide_Text_IO.Standard_Error, "Tool: echo");

   Call_Tool.id := (True, "echo");
   Call_Tool.params.meta := Metadata;
   Call_Tool.params.name := "echo";
   Call_Tool.params.arguments.Append ((Kind => VSS.JSON.Streams.Start_Object));
   Call_Tool.params.arguments.Append ((VSS.JSON.Streams.Key_Name, "text"));
   Call_Tool.params.arguments.Append ((VSS.JSON.Streams.String_Value, Text));
   Call_Tool.params.arguments.Append ((Kind => VSS.JSON.Streams.End_Object));
   Calling.Call (Channel, Call_Tool.id, Call_Tool, Called);
   declare
      Result : constant MCP.Types.CallToolResult :=
        Read_Call_Result (Called.result);
   begin
      if Result.isError
        or else Result.content.Length /= 1
        or else Result.content (1).Union.Kind /= MCP.Types.Enum.text
      then
         raise Ada.IO_Exceptions.Data_Error with "echo did not return text";
      elsif Result.content (1).Union.text.text /= Text then
         raise Ada.IO_Exceptions.Data_Error
           with "echo returned different text";
      end if;
      Ada.Wide_Wide_Text_IO.Put_Line
        (Ada.Wide_Wide_Text_IO.Standard_Error,
         "Echo: "
         & VSS.Strings.Conversions.To_Wide_Wide_String
             (Result.content (1).Union.text.text));
   end;
exception
   when Error : others =>
      Ada.Wide_Wide_Text_IO.Put_Line
        (Ada.Wide_Wide_Text_IO.Standard_Error,
         "mcp_client_demo: "
         & VSS.Strings.Conversions.To_Wide_Wide_String
             (VSS.Strings.Conversions.To_Virtual_String
                (Ada.Exceptions.Exception_Message (Error))));
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
end MCP_Client_Demo;
