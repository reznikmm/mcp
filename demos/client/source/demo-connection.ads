--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
------------------------------------------------------------------

with Ada.Streams;
with VSS.Stream_Element_Vectors;

with Demo.Stdio_Streams;

package Demo.Connection is

   type Channel is limited private;

   procedure Send
     (Self    : in out Channel;
      Message : VSS.Stream_Element_Vectors.Stream_Element_Vector);
   --  Write one complete JSON message and its newline delimiter to stdout.

   function Receive
     (Self : in out Channel)
      return VSS.Stream_Element_Vectors.Stream_Element_Vector;
   --  Read a complete newline-delimited JSON message from stdin.
   --  Raises End_Error if the peer closes its output before a full message.

private

   type Channel is limited record
      Stream : Demo.Stdio_Streams.Stdio_Stream;
      Buffer : Ada.Streams.Stream_Element_Array (1 .. 4096);
      First  : Ada.Streams.Stream_Element_Offset := 1;
      Last   : Ada.Streams.Stream_Element_Offset := 0;
   end record;

end Demo.Connection;
