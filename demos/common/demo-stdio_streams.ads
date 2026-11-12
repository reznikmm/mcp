--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
------------------------------------------------------------------

with Ada.Streams;

package Demo.Stdio_Streams is

   type Stdio_Stream is new Ada.Streams.Root_Stream_Type with null record;
   --  Stream that reads and writes standard input/output descriptors

   overriding
   procedure Read
     (Stream : in out Stdio_Stream;
      Item   : out Ada.Streams.Stream_Element_Array;
      Last   : out Ada.Streams.Stream_Element_Offset);

   overriding
   procedure Write
     (Stream : in out Stdio_Stream; Item : Ada.Streams.Stream_Element_Array);

end Demo.Stdio_Streams;
