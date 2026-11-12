--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
------------------------------------------------------------------

with VSS.Stream_Element_Vectors.Conversions;

package body Demo.Connection is
   use type Ada.Streams.Stream_Element;
   use type Ada.Streams.Stream_Element_Offset;

   ----------
   -- Send --
   ----------

   procedure Send
     (Self    : in out Channel;
      Message : VSS.Stream_Element_Vectors.Stream_Element_Vector)
   is
      Data : VSS.Stream_Element_Vectors.Stream_Element_Vector := Message;
   begin
      Data.Append (10);
      Self.Stream.Write
        (VSS.Stream_Element_Vectors.Conversions.To_Stream_Element_Array
           (Data));
   end Send;

   -------------
   -- Receive --
   -------------

   function Receive
     (Self : in out Channel)
      return VSS.Stream_Element_Vectors.Stream_Element_Vector
   is
      Result : VSS.Stream_Element_Vectors.Stream_Element_Vector;
   begin
      loop
         if Self.First > Self.Last then
            Self.Stream.Read (Self.Buffer, Self.Last);
            Self.First := Self.Buffer'First;
         end if;
         declare
            Item : constant Ada.Streams.Stream_Element :=
              Self.Buffer (Self.First);
         begin
            Self.First := Self.First + 1;
            if Item = 10 then
               return Result;
            end if;
            Result.Append (Item);
         end;
      end loop;
   end Receive;

end Demo.Connection;
