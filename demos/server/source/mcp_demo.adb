--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
------------------------------------------------------------------

with Ada.Command_Line;
with Ada.Exceptions;
with Ada.IO_Exceptions;
with Ada.Streams;
with Ada.Text_IO;

with VSS.Stream_Element_Vectors.Conversions;

with Demo.Messages;
with Demo.Stdio_Streams;

procedure MCP_Demo is
   use type Ada.Streams.Stream_Element;

   Stream        : Demo.Stdio_Streams.Stdio_Stream;
   Buffer        : Ada.Streams.Stream_Element_Array (1 .. 4096);
   Last          : Ada.Streams.Stream_Element_Offset;
   Message       : VSS.Stream_Element_Vectors.Stream_Element_Vector;
   Reply         : VSS.Stream_Element_Vectors.Stream_Element_Vector;
   Empty_Message : VSS.Stream_Element_Vectors.Stream_Element_Vector;
   pragma Unmodified (Empty_Message);
begin
   loop
      begin
         Stream.Read (Buffer, Last);
      exception
         when Ada.IO_Exceptions.End_Error =>
            if not Message.Is_Empty then
               Ada.Text_IO.Put_Line
                 (Ada.Text_IO.Standard_Error,
                  "mcp_demo: incomplete message at EOF (missing newline)");
               Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
            end if;
            exit;
      end;

      for Item of Buffer (1 .. Last) loop
         if Item = 10 then
            Demo.Messages.Process (Message, Reply);
            if not Reply.Is_Empty then
               Reply.Append (10);
               Stream.Write
                 (VSS
                    .Stream_Element_Vectors
                    .Conversions
                    .To_Stream_Element_Array (Reply));
            end if;
            Message := Empty_Message;
         else
            Message.Append (Item);
         end if;
      end loop;
   end loop;
exception
   when Error : others =>
      Ada.Text_IO.Put_Line
        (Ada.Text_IO.Standard_Error,
         "mcp_demo: " & Ada.Exceptions.Exception_Message (Error));
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
end MCP_Demo;
