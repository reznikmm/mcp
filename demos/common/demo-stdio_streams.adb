--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
------------------------------------------------------------------

with Interfaces.C;
with Ada.IO_Exceptions;

package body Demo.Stdio_Streams is

   package C renames Interfaces.C;

   ----------
   -- Read --
   ----------

   overriding
   procedure Read
     (Stream : in out Stdio_Stream;
      Item   : out Ada.Streams.Stream_Element_Array;
      Last   : out Ada.Streams.Stream_Element_Offset)
   is
      pragma Unreferenced (Stream);
      use type Ada.Streams.Stream_Element_Offset;

      function Read_Descriptor
        (fildes : C.int;
         buf    : out Ada.Streams.Stream_Element_Array;
         nbyte  : C.size_t) return C.ptrdiff_t
      with Import => True, Convention => C, External_Name => "read";
      use type C.ptrdiff_t;
      Done : C.ptrdiff_t;
   begin
      Done := Read_Descriptor (0, Item, Item'Length);
      if Done < 0 then
         raise Ada.IO_Exceptions.Device_Error with "cannot read stdin";
      elsif Done = 0 then
         raise Ada.IO_Exceptions.End_Error with "end of file";
      end if;

      Last := Item'First + Ada.Streams.Stream_Element_Offset (Done) - 1;
   end Read;

   -----------
   -- Write --
   -----------

   overriding
   procedure Write
     (Stream : in out Stdio_Stream; Item : Ada.Streams.Stream_Element_Array)
   is
      function Write_Descriptor
        (fildes : C.int;
         buf    : Ada.Streams.Stream_Element_Array;
         nbyte  : C.size_t) return C.ptrdiff_t
      with Import => True, Convention => C, External_Name => "write";
      pragma Unreferenced (Stream);

      use type Ada.Streams.Stream_Element_Offset;
      use type C.ptrdiff_t;

      First : Ada.Streams.Stream_Element_Offset := Item'First;
      Done  : C.ptrdiff_t;
   begin
      while First <= Item'Last loop
         Done :=
           Write_Descriptor
             (1, Item (First .. Item'Last), C.size_t (Item'Last - First + 1));
         if Done <= 0 then
            raise Ada.IO_Exceptions.Device_Error with "cannot write stdout";
         end if;

         First := First + Ada.Streams.Stream_Element_Offset (Done);
      end loop;
   end Write;

end Demo.Stdio_Streams;
