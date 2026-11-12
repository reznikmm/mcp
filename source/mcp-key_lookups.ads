--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

with VSS.Strings;
with VSS.String_Vectors;

generic
   Variants : VSS.String_Vectors.Virtual_String_Vector;
package MCP.Key_Lookups is

   function Get_Index (Text : VSS.Strings.Virtual_String) return Natural;
   --  Return the one-based position of Text in Variants, or zero if absent.

end MCP.Key_Lookups;
