--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
------------------------------------------------------------------

with VSS.JSON.Content_Handlers;
with VSS.JSON.Pull_Readers;

with MCP.Types;
with Demo.Connection;

generic
   type Request_Type is private;
   type Response_Type is private;
   with
     procedure Output_Request
       (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
        Value   : Request_Type);
   with
     procedure Input_Response
       (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
        Value   : out Response_Type;
        Success : in out Boolean);
package Demo.RPC is

   procedure Call
     (Channel    : in out Demo.Connection.Channel;
      Identifier : MCP.Types.Integer_Or_String;
      Request    : Request_Type;
      Response   : out Response_Type);
   --  Write a generated request, read its response, check the JSON-RPC
   --  envelope and ID, then decode the generated response type.
   --  Protocol errors and remote errors raise Data_Error.

end Demo.RPC;
