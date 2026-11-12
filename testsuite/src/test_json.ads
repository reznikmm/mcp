--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

with Trendy_Test;

package Test_JSON is

   procedure Test_Requests (Op : in out Trendy_Test.Operation'Class);
   procedure Test_Content (Op : in out Trendy_Test.Operation'Class);
   procedure Test_Additional_Properties
     (Op : in out Trendy_Test.Operation'Class);
   procedure Test_Raw_JSON (Op : in out Trendy_Test.Operation'Class);
   procedure Test_Invalid_Values (Op : in out Trendy_Test.Operation'Class);

end Test_JSON;
