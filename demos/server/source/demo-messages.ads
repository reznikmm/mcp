--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
------------------------------------------------------------------

with VSS.Stream_Element_Vectors;

package Demo.Messages is

   procedure Process
     (Message : VSS.Stream_Element_Vectors.Stream_Element_Vector;
      Reply   : out VSS.Stream_Element_Vectors.Stream_Element_Vector);
   --  Process one JSON-RPC message, without its newline delimiter.
   --  Notifications produce an empty Reply.

end Demo.Messages;
