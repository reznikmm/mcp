--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--
--  Generated from schema/schema.json. See schema/README.md.

pragma Style_Checks ("M99");  --  suppress style warning unitl gnatpp is fixed
with Ada.Unchecked_Deallocation;

package body MCP.Types is
   procedure Free is new
     Ada.Unchecked_Deallocation
       (ResourceTemplate_Array,
        ResourceTemplate_Array_Access);

   overriding
   procedure Adjust (Self : in out ResourceTemplate_Vector) is
   begin
      if Self.Length > 0 then
         Self.Data :=
           new ResourceTemplate_Array'(Self.Data (1 .. Self.Length));
      end if;
   end Adjust;

   overriding
   procedure Finalize (Self : in out ResourceTemplate_Vector) is
   begin
      Free (Self.Data);
      Self.Length := 0;
   end Finalize;

   function Empty return ResourceTemplate_Vector
   is (Ada.Finalization.Controlled with others => <>);

   function Is_Null (Self : ResourceTemplate_Vector) return Boolean
   is (Self.Is_Null);

   function Length (Self : ResourceTemplate_Vector) return Natural
   is (Self.Length);

   procedure Clear
     (Self : in out ResourceTemplate_Vector; Is_Null : Boolean := True) is
   begin
      Self.Length := 0;
      Self.Is_Null := Is_Null;
   end Clear;

   procedure Append
     (Self : in out ResourceTemplate_Vector; Value : ResourceTemplate)
   is
      Init_Length     : constant Positive :=
        Positive'Max (2, 256 / ResourceTemplate'Size);
      Self_Data_Saved : ResourceTemplate_Array_Access := Self.Data;
   begin
      if Self.Length = 0 then
         Self.Is_Null := False;
         Self.Data := new ResourceTemplate_Array (1 .. Init_Length);
      elsif Self.Length = Self.Data'Last then
         Self.Data :=
           new ResourceTemplate_Array (1 .. 3 * Self.Length / 2 + 1);
         Self.Data (1 .. Self.Length) := Self_Data_Saved.all;
         Free (Self_Data_Saved);
      end if;
      Self.Length := Self.Length + 1;
      Self.Data (Self.Length) := Value;
   end Append;

   not overriding
   function Get_ResourceTemplate_Variable_Reference
     (Self : aliased in out ResourceTemplate_Vector; Index : Positive)
      return ResourceTemplate_Variable_Reference
   is (Element => Self.Data (Index)'Access);

   not overriding
   function Get_ResourceTemplate_Constant_Reference
     (Self : aliased ResourceTemplate_Vector; Index : Positive)
      return ResourceTemplate_Constant_Reference
   is (Element => Self.Data (Index)'Access);

   procedure Free is new
     Ada.Unchecked_Deallocation (Role_Array, Role_Array_Access);

   overriding
   procedure Adjust (Self : in out Role_Vector) is
   begin
      if Self.Length > 0 then
         Self.Data := new Role_Array'(Self.Data (1 .. Self.Length));
      end if;
   end Adjust;

   overriding
   procedure Finalize (Self : in out Role_Vector) is
   begin
      Free (Self.Data);
      Self.Length := 0;
   end Finalize;

   function Empty return Role_Vector
   is (Ada.Finalization.Controlled with others => <>);

   function Is_Null (Self : Role_Vector) return Boolean
   is (Self.Is_Null);

   function Length (Self : Role_Vector) return Natural
   is (Self.Length);

   procedure Clear (Self : in out Role_Vector; Is_Null : Boolean := True) is
   begin
      Self.Length := 0;
      Self.Is_Null := Is_Null;
   end Clear;

   procedure Append (Self : in out Role_Vector; Value : Enum.Role) is
      Init_Length     : constant Positive :=
        Positive'Max (2, 256 / Enum.Role'Size);
      Self_Data_Saved : Role_Array_Access := Self.Data;
   begin
      if Self.Length = 0 then
         Self.Is_Null := False;
         Self.Data := new Role_Array (1 .. Init_Length);
      elsif Self.Length = Self.Data'Last then
         Self.Data := new Role_Array (1 .. 3 * Self.Length / 2 + 1);
         Self.Data (1 .. Self.Length) := Self_Data_Saved.all;
         Free (Self_Data_Saved);
      end if;
      Self.Length := Self.Length + 1;
      Self.Data (Self.Length) := Value;
   end Append;

   not overriding
   function Get_Role_Variable_Reference
     (Self : aliased in out Role_Vector; Index : Positive)
      return Role_Variable_Reference
   is (Element => Self.Data (Index)'Access);

   not overriding
   function Get_Role_Constant_Reference
     (Self : aliased Role_Vector; Index : Positive)
      return Role_Constant_Reference
   is (Element => Self.Data (Index)'Access);

   procedure Free is new
     Ada.Unchecked_Deallocation (Tool_Array, Tool_Array_Access);

   overriding
   procedure Adjust (Self : in out Tool_Vector) is
   begin
      if Self.Length > 0 then
         Self.Data := new Tool_Array'(Self.Data (1 .. Self.Length));
      end if;
   end Adjust;

   overriding
   procedure Finalize (Self : in out Tool_Vector) is
   begin
      Free (Self.Data);
      Self.Length := 0;
   end Finalize;

   function Empty return Tool_Vector
   is (Ada.Finalization.Controlled with others => <>);

   function Is_Null (Self : Tool_Vector) return Boolean
   is (Self.Is_Null);

   function Length (Self : Tool_Vector) return Natural
   is (Self.Length);

   procedure Clear (Self : in out Tool_Vector; Is_Null : Boolean := True) is
   begin
      Self.Length := 0;
      Self.Is_Null := Is_Null;
   end Clear;

   procedure Append (Self : in out Tool_Vector; Value : Tool) is
      Init_Length     : constant Positive := Positive'Max (2, 256 / Tool'Size);
      Self_Data_Saved : Tool_Array_Access := Self.Data;
   begin
      if Self.Length = 0 then
         Self.Is_Null := False;
         Self.Data := new Tool_Array (1 .. Init_Length);
      elsif Self.Length = Self.Data'Last then
         Self.Data := new Tool_Array (1 .. 3 * Self.Length / 2 + 1);
         Self.Data (1 .. Self.Length) := Self_Data_Saved.all;
         Free (Self_Data_Saved);
      end if;
      Self.Length := Self.Length + 1;
      Self.Data (Self.Length) := Value;
   end Append;

   not overriding
   function Get_Tool_Variable_Reference
     (Self : aliased in out Tool_Vector; Index : Positive)
      return Tool_Variable_Reference
   is (Element => Self.Data (Index)'Access);

   not overriding
   function Get_Tool_Constant_Reference
     (Self : aliased Tool_Vector; Index : Positive)
      return Tool_Constant_Reference
   is (Element => Self.Data (Index)'Access);

   procedure Free is new
     Ada.Unchecked_Deallocation (Prompt_Array, Prompt_Array_Access);

   overriding
   procedure Adjust (Self : in out Prompt_Vector) is
   begin
      if Self.Length > 0 then
         Self.Data := new Prompt_Array'(Self.Data (1 .. Self.Length));
      end if;
   end Adjust;

   overriding
   procedure Finalize (Self : in out Prompt_Vector) is
   begin
      Free (Self.Data);
      Self.Length := 0;
   end Finalize;

   function Empty return Prompt_Vector
   is (Ada.Finalization.Controlled with others => <>);

   function Is_Null (Self : Prompt_Vector) return Boolean
   is (Self.Is_Null);

   function Length (Self : Prompt_Vector) return Natural
   is (Self.Length);

   procedure Clear (Self : in out Prompt_Vector; Is_Null : Boolean := True) is
   begin
      Self.Length := 0;
      Self.Is_Null := Is_Null;
   end Clear;

   procedure Append (Self : in out Prompt_Vector; Value : Prompt) is
      Init_Length     : constant Positive :=
        Positive'Max (2, 256 / Prompt'Size);
      Self_Data_Saved : Prompt_Array_Access := Self.Data;
   begin
      if Self.Length = 0 then
         Self.Is_Null := False;
         Self.Data := new Prompt_Array (1 .. Init_Length);
      elsif Self.Length = Self.Data'Last then
         Self.Data := new Prompt_Array (1 .. 3 * Self.Length / 2 + 1);
         Self.Data (1 .. Self.Length) := Self_Data_Saved.all;
         Free (Self_Data_Saved);
      end if;
      Self.Length := Self.Length + 1;
      Self.Data (Self.Length) := Value;
   end Append;

   not overriding
   function Get_Prompt_Variable_Reference
     (Self : aliased in out Prompt_Vector; Index : Positive)
      return Prompt_Variable_Reference
   is (Element => Self.Data (Index)'Access);

   not overriding
   function Get_Prompt_Constant_Reference
     (Self : aliased Prompt_Vector; Index : Positive)
      return Prompt_Constant_Reference
   is (Element => Self.Data (Index)'Access);

   procedure Free is new
     Ada.Unchecked_Deallocation
       (ContentBlock_Array,
        ContentBlock_Array_Access);

   overriding
   procedure Adjust (Self : in out ContentBlock_Vector) is
   begin
      if Self.Length > 0 then
         Self.Data := new ContentBlock_Array'(Self.Data (1 .. Self.Length));
      end if;
   end Adjust;

   overriding
   procedure Finalize (Self : in out ContentBlock_Vector) is
   begin
      Free (Self.Data);
      Self.Length := 0;
   end Finalize;

   function Empty return ContentBlock_Vector
   is (Ada.Finalization.Controlled with others => <>);

   function Is_Null (Self : ContentBlock_Vector) return Boolean
   is (Self.Is_Null);

   function Length (Self : ContentBlock_Vector) return Natural
   is (Self.Length);

   procedure Clear
     (Self : in out ContentBlock_Vector; Is_Null : Boolean := True) is
   begin
      Self.Length := 0;
      Self.Is_Null := Is_Null;
   end Clear;

   procedure Append (Self : in out ContentBlock_Vector; Value : ContentBlock)
   is
      Init_Length     : constant Positive :=
        Positive'Max (2, 256 / ContentBlock'Size);
      Self_Data_Saved : ContentBlock_Array_Access := Self.Data;
   begin
      if Self.Length = 0 then
         Self.Is_Null := False;
         Self.Data := new ContentBlock_Array (1 .. Init_Length);
      elsif Self.Length = Self.Data'Last then
         Self.Data := new ContentBlock_Array (1 .. 3 * Self.Length / 2 + 1);
         Self.Data (1 .. Self.Length) := Self_Data_Saved.all;
         Free (Self_Data_Saved);
      end if;
      Self.Length := Self.Length + 1;
      Self.Data (Self.Length) := Value;
   end Append;

   not overriding
   function Get_ContentBlock_Variable_Reference
     (Self : aliased in out ContentBlock_Vector; Index : Positive)
      return ContentBlock_Variable_Reference
   is (Element => Self.Data (Index)'Access);

   not overriding
   function Get_ContentBlock_Constant_Reference
     (Self : aliased ContentBlock_Vector; Index : Positive)
      return ContentBlock_Constant_Reference
   is (Element => Self.Data (Index)'Access);

   procedure Free is new
     Ada.Unchecked_Deallocation
       (PromptMessage_Array,
        PromptMessage_Array_Access);

   overriding
   procedure Adjust (Self : in out PromptMessage_Vector) is
   begin
      if Self.Length > 0 then
         Self.Data := new PromptMessage_Array'(Self.Data (1 .. Self.Length));
      end if;
   end Adjust;

   overriding
   procedure Finalize (Self : in out PromptMessage_Vector) is
   begin
      Free (Self.Data);
      Self.Length := 0;
   end Finalize;

   function Empty return PromptMessage_Vector
   is (Ada.Finalization.Controlled with others => <>);

   function Is_Null (Self : PromptMessage_Vector) return Boolean
   is (Self.Is_Null);

   function Length (Self : PromptMessage_Vector) return Natural
   is (Self.Length);

   procedure Clear
     (Self : in out PromptMessage_Vector; Is_Null : Boolean := True) is
   begin
      Self.Length := 0;
      Self.Is_Null := Is_Null;
   end Clear;

   procedure Append (Self : in out PromptMessage_Vector; Value : PromptMessage)
   is
      Init_Length     : constant Positive :=
        Positive'Max (2, 256 / PromptMessage'Size);
      Self_Data_Saved : PromptMessage_Array_Access := Self.Data;
   begin
      if Self.Length = 0 then
         Self.Is_Null := False;
         Self.Data := new PromptMessage_Array (1 .. Init_Length);
      elsif Self.Length = Self.Data'Last then
         Self.Data := new PromptMessage_Array (1 .. 3 * Self.Length / 2 + 1);
         Self.Data (1 .. Self.Length) := Self_Data_Saved.all;
         Free (Self_Data_Saved);
      end if;
      Self.Length := Self.Length + 1;
      Self.Data (Self.Length) := Value;
   end Append;

   not overriding
   function Get_PromptMessage_Variable_Reference
     (Self : aliased in out PromptMessage_Vector; Index : Positive)
      return PromptMessage_Variable_Reference
   is (Element => Self.Data (Index)'Access);

   not overriding
   function Get_PromptMessage_Constant_Reference
     (Self : aliased PromptMessage_Vector; Index : Positive)
      return PromptMessage_Constant_Reference
   is (Element => Self.Data (Index)'Access);

   procedure Free is new
     Ada.Unchecked_Deallocation (Root_Array, Root_Array_Access);

   overriding
   procedure Adjust (Self : in out Root_Vector) is
   begin
      if Self.Length > 0 then
         Self.Data := new Root_Array'(Self.Data (1 .. Self.Length));
      end if;
   end Adjust;

   overriding
   procedure Finalize (Self : in out Root_Vector) is
   begin
      Free (Self.Data);
      Self.Length := 0;
   end Finalize;

   function Empty return Root_Vector
   is (Ada.Finalization.Controlled with others => <>);

   function Is_Null (Self : Root_Vector) return Boolean
   is (Self.Is_Null);

   function Length (Self : Root_Vector) return Natural
   is (Self.Length);

   procedure Clear (Self : in out Root_Vector; Is_Null : Boolean := True) is
   begin
      Self.Length := 0;
      Self.Is_Null := Is_Null;
   end Clear;

   procedure Append (Self : in out Root_Vector; Value : Root) is
      Init_Length     : constant Positive := Positive'Max (2, 256 / Root'Size);
      Self_Data_Saved : Root_Array_Access := Self.Data;
   begin
      if Self.Length = 0 then
         Self.Is_Null := False;
         Self.Data := new Root_Array (1 .. Init_Length);
      elsif Self.Length = Self.Data'Last then
         Self.Data := new Root_Array (1 .. 3 * Self.Length / 2 + 1);
         Self.Data (1 .. Self.Length) := Self_Data_Saved.all;
         Free (Self_Data_Saved);
      end if;
      Self.Length := Self.Length + 1;
      Self.Data (Self.Length) := Value;
   end Append;

   not overriding
   function Get_Root_Variable_Reference
     (Self : aliased in out Root_Vector; Index : Positive)
      return Root_Variable_Reference
   is (Element => Self.Data (Index)'Access);

   not overriding
   function Get_Root_Constant_Reference
     (Self : aliased Root_Vector; Index : Positive)
      return Root_Constant_Reference
   is (Element => Self.Data (Index)'Access);

   procedure Free is new
     Ada.Unchecked_Deallocation
       (PromptArgument_Array,
        PromptArgument_Array_Access);

   overriding
   procedure Adjust (Self : in out PromptArgument_Vector) is
   begin
      if Self.Length > 0 then
         Self.Data := new PromptArgument_Array'(Self.Data (1 .. Self.Length));
      end if;
   end Adjust;

   overriding
   procedure Finalize (Self : in out PromptArgument_Vector) is
   begin
      Free (Self.Data);
      Self.Length := 0;
   end Finalize;

   function Empty return PromptArgument_Vector
   is (Ada.Finalization.Controlled with others => <>);

   function Is_Null (Self : PromptArgument_Vector) return Boolean
   is (Self.Is_Null);

   function Length (Self : PromptArgument_Vector) return Natural
   is (Self.Length);

   procedure Clear
     (Self : in out PromptArgument_Vector; Is_Null : Boolean := True) is
   begin
      Self.Length := 0;
      Self.Is_Null := Is_Null;
   end Clear;

   procedure Append
     (Self : in out PromptArgument_Vector; Value : PromptArgument)
   is
      Init_Length     : constant Positive :=
        Positive'Max (2, 256 / PromptArgument'Size);
      Self_Data_Saved : PromptArgument_Array_Access := Self.Data;
   begin
      if Self.Length = 0 then
         Self.Is_Null := False;
         Self.Data := new PromptArgument_Array (1 .. Init_Length);
      elsif Self.Length = Self.Data'Last then
         Self.Data := new PromptArgument_Array (1 .. 3 * Self.Length / 2 + 1);
         Self.Data (1 .. Self.Length) := Self_Data_Saved.all;
         Free (Self_Data_Saved);
      end if;
      Self.Length := Self.Length + 1;
      Self.Data (Self.Length) := Value;
   end Append;

   not overriding
   function Get_PromptArgument_Variable_Reference
     (Self : aliased in out PromptArgument_Vector; Index : Positive)
      return PromptArgument_Variable_Reference
   is (Element => Self.Data (Index)'Access);

   not overriding
   function Get_PromptArgument_Constant_Reference
     (Self : aliased PromptArgument_Vector; Index : Positive)
      return PromptArgument_Constant_Reference
   is (Element => Self.Data (Index)'Access);

   procedure Free is new
     Ada.Unchecked_Deallocation (Icon_Array, Icon_Array_Access);

   overriding
   procedure Adjust (Self : in out Icon_Vector) is
   begin
      if Self.Length > 0 then
         Self.Data := new Icon_Array'(Self.Data (1 .. Self.Length));
      end if;
   end Adjust;

   overriding
   procedure Finalize (Self : in out Icon_Vector) is
   begin
      Free (Self.Data);
      Self.Length := 0;
   end Finalize;

   function Empty return Icon_Vector
   is (Ada.Finalization.Controlled with others => <>);

   function Is_Null (Self : Icon_Vector) return Boolean
   is (Self.Is_Null);

   function Length (Self : Icon_Vector) return Natural
   is (Self.Length);

   procedure Clear (Self : in out Icon_Vector; Is_Null : Boolean := True) is
   begin
      Self.Length := 0;
      Self.Is_Null := Is_Null;
   end Clear;

   procedure Append (Self : in out Icon_Vector; Value : Icon) is
      Init_Length     : constant Positive := Positive'Max (2, 256 / Icon'Size);
      Self_Data_Saved : Icon_Array_Access := Self.Data;
   begin
      if Self.Length = 0 then
         Self.Is_Null := False;
         Self.Data := new Icon_Array (1 .. Init_Length);
      elsif Self.Length = Self.Data'Last then
         Self.Data := new Icon_Array (1 .. 3 * Self.Length / 2 + 1);
         Self.Data (1 .. Self.Length) := Self_Data_Saved.all;
         Free (Self_Data_Saved);
      end if;
      Self.Length := Self.Length + 1;
      Self.Data (Self.Length) := Value;
   end Append;

   not overriding
   function Get_Icon_Variable_Reference
     (Self : aliased in out Icon_Vector; Index : Positive)
      return Icon_Variable_Reference
   is (Element => Self.Data (Index)'Access);

   not overriding
   function Get_Icon_Constant_Reference
     (Self : aliased Icon_Vector; Index : Positive)
      return Icon_Constant_Reference
   is (Element => Self.Data (Index)'Access);

   procedure Free is new
     Ada.Unchecked_Deallocation (Resource_Array, Resource_Array_Access);

   overriding
   procedure Adjust (Self : in out Resource_Vector) is
   begin
      if Self.Length > 0 then
         Self.Data := new Resource_Array'(Self.Data (1 .. Self.Length));
      end if;
   end Adjust;

   overriding
   procedure Finalize (Self : in out Resource_Vector) is
   begin
      Free (Self.Data);
      Self.Length := 0;
   end Finalize;

   function Empty return Resource_Vector
   is (Ada.Finalization.Controlled with others => <>);

   function Is_Null (Self : Resource_Vector) return Boolean
   is (Self.Is_Null);

   function Length (Self : Resource_Vector) return Natural
   is (Self.Length);

   procedure Clear (Self : in out Resource_Vector; Is_Null : Boolean := True)
   is
   begin
      Self.Length := 0;
      Self.Is_Null := Is_Null;
   end Clear;

   procedure Append (Self : in out Resource_Vector; Value : Resource) is
      Init_Length     : constant Positive :=
        Positive'Max (2, 256 / Resource'Size);
      Self_Data_Saved : Resource_Array_Access := Self.Data;
   begin
      if Self.Length = 0 then
         Self.Is_Null := False;
         Self.Data := new Resource_Array (1 .. Init_Length);
      elsif Self.Length = Self.Data'Last then
         Self.Data := new Resource_Array (1 .. 3 * Self.Length / 2 + 1);
         Self.Data (1 .. Self.Length) := Self_Data_Saved.all;
         Free (Self_Data_Saved);
      end if;
      Self.Length := Self.Length + 1;
      Self.Data (Self.Length) := Value;
   end Append;

   not overriding
   function Get_Resource_Variable_Reference
     (Self : aliased in out Resource_Vector; Index : Positive)
      return Resource_Variable_Reference
   is (Element => Self.Data (Index)'Access);

   not overriding
   function Get_Resource_Constant_Reference
     (Self : aliased Resource_Vector; Index : Positive)
      return Resource_Constant_Reference
   is (Element => Self.Data (Index)'Access);

   procedure Free is new
     Ada.Unchecked_Deallocation (ModelHint_Array, ModelHint_Array_Access);

   overriding
   procedure Adjust (Self : in out ModelHint_Vector) is
   begin
      if Self.Length > 0 then
         Self.Data := new ModelHint_Array'(Self.Data (1 .. Self.Length));
      end if;
   end Adjust;

   overriding
   procedure Finalize (Self : in out ModelHint_Vector) is
   begin
      Free (Self.Data);
      Self.Length := 0;
   end Finalize;

   function Empty return ModelHint_Vector
   is (Ada.Finalization.Controlled with others => <>);

   function Is_Null (Self : ModelHint_Vector) return Boolean
   is (Self.Is_Null);

   function Length (Self : ModelHint_Vector) return Natural
   is (Self.Length);

   procedure Clear (Self : in out ModelHint_Vector; Is_Null : Boolean := True)
   is
   begin
      Self.Length := 0;
      Self.Is_Null := Is_Null;
   end Clear;

   procedure Append (Self : in out ModelHint_Vector; Value : ModelHint) is
      Init_Length     : constant Positive :=
        Positive'Max (2, 256 / ModelHint'Size);
      Self_Data_Saved : ModelHint_Array_Access := Self.Data;
   begin
      if Self.Length = 0 then
         Self.Is_Null := False;
         Self.Data := new ModelHint_Array (1 .. Init_Length);
      elsif Self.Length = Self.Data'Last then
         Self.Data := new ModelHint_Array (1 .. 3 * Self.Length / 2 + 1);
         Self.Data (1 .. Self.Length) := Self_Data_Saved.all;
         Free (Self_Data_Saved);
      end if;
      Self.Length := Self.Length + 1;
      Self.Data (Self.Length) := Value;
   end Append;

   not overriding
   function Get_ModelHint_Variable_Reference
     (Self : aliased in out ModelHint_Vector; Index : Positive)
      return ModelHint_Variable_Reference
   is (Element => Self.Data (Index)'Access);

   not overriding
   function Get_ModelHint_Constant_Reference
     (Self : aliased ModelHint_Vector; Index : Positive)
      return ModelHint_Constant_Reference
   is (Element => Self.Data (Index)'Access);

   procedure Free is new
     Ada.Unchecked_Deallocation
       (SamplingMessage_Array,
        SamplingMessage_Array_Access);

   overriding
   procedure Adjust (Self : in out SamplingMessage_Vector) is
   begin
      if Self.Length > 0 then
         Self.Data := new SamplingMessage_Array'(Self.Data (1 .. Self.Length));
      end if;
   end Adjust;

   overriding
   procedure Finalize (Self : in out SamplingMessage_Vector) is
   begin
      Free (Self.Data);
      Self.Length := 0;
   end Finalize;

   function Empty return SamplingMessage_Vector
   is (Ada.Finalization.Controlled with others => <>);

   function Is_Null (Self : SamplingMessage_Vector) return Boolean
   is (Self.Is_Null);

   function Length (Self : SamplingMessage_Vector) return Natural
   is (Self.Length);

   procedure Clear
     (Self : in out SamplingMessage_Vector; Is_Null : Boolean := True) is
   begin
      Self.Length := 0;
      Self.Is_Null := Is_Null;
   end Clear;

   procedure Append
     (Self : in out SamplingMessage_Vector; Value : SamplingMessage)
   is
      Init_Length     : constant Positive :=
        Positive'Max (2, 256 / SamplingMessage'Size);
      Self_Data_Saved : SamplingMessage_Array_Access := Self.Data;
   begin
      if Self.Length = 0 then
         Self.Is_Null := False;
         Self.Data := new SamplingMessage_Array (1 .. Init_Length);
      elsif Self.Length = Self.Data'Last then
         Self.Data := new SamplingMessage_Array (1 .. 3 * Self.Length / 2 + 1);
         Self.Data (1 .. Self.Length) := Self_Data_Saved.all;
         Free (Self_Data_Saved);
      end if;
      Self.Length := Self.Length + 1;
      Self.Data (Self.Length) := Value;
   end Append;

   not overriding
   function Get_SamplingMessage_Variable_Reference
     (Self : aliased in out SamplingMessage_Vector; Index : Positive)
      return SamplingMessage_Variable_Reference
   is (Element => Self.Data (Index)'Access);

   not overriding
   function Get_SamplingMessage_Constant_Reference
     (Self : aliased SamplingMessage_Vector; Index : Positive)
      return SamplingMessage_Constant_Reference
   is (Element => Self.Data (Index)'Access);

   procedure Free is new
     Ada.Unchecked_Deallocation (Integer_64_Array, Integer_64_Array_Access);

   overriding
   procedure Adjust (Self : in out Integer_64_Vector) is
   begin
      if Self.Length > 0 then
         Self.Data := new Integer_64_Array'(Self.Data (1 .. Self.Length));
      end if;
   end Adjust;

   overriding
   procedure Finalize (Self : in out Integer_64_Vector) is
   begin
      Free (Self.Data);
      Self.Length := 0;
   end Finalize;

   function Empty return Integer_64_Vector
   is (Ada.Finalization.Controlled with others => <>);

   function Is_Null (Self : Integer_64_Vector) return Boolean
   is (Self.Is_Null);

   function Length (Self : Integer_64_Vector) return Natural
   is (Self.Length);

   procedure Clear (Self : in out Integer_64_Vector; Is_Null : Boolean := True)
   is
   begin
      Self.Length := 0;
      Self.Is_Null := Is_Null;
   end Clear;

   procedure Append (Self : in out Integer_64_Vector; Value : Integer_64) is
      Init_Length     : constant Positive :=
        Positive'Max (2, 256 / Integer_64'Size);
      Self_Data_Saved : Integer_64_Array_Access := Self.Data;
   begin
      if Self.Length = 0 then
         Self.Is_Null := False;
         Self.Data := new Integer_64_Array (1 .. Init_Length);
      elsif Self.Length = Self.Data'Last then
         Self.Data := new Integer_64_Array (1 .. 3 * Self.Length / 2 + 1);
         Self.Data (1 .. Self.Length) := Self_Data_Saved.all;
         Free (Self_Data_Saved);
      end if;
      Self.Length := Self.Length + 1;
      Self.Data (Self.Length) := Value;
   end Append;

   not overriding
   function Get_Integer_64_Variable_Reference
     (Self : aliased in out Integer_64_Vector; Index : Positive)
      return Integer_64_Variable_Reference
   is (Element => Self.Data (Index)'Access);

   not overriding
   function Get_Integer_64_Constant_Reference
     (Self : aliased Integer_64_Vector; Index : Positive)
      return Integer_64_Constant_Reference
   is (Element => Self.Data (Index)'Access);

end MCP.Types;
