--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--
--  Generated from schema/schema.json. See schema/README.md.

pragma Ada_2022;
with MCP.Key_Lookups;
with VSS.JSON.Pull_Readers.Buffered;

package body MCP.Types.Inputs is
   pragma Style_Checks (Off);
   use type VSS.JSON.JSON_Number_Kind;
   use type VSS.Strings.Virtual_String;

   procedure Input_Any_Value
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Any_Value'Class;
      Success : in out Boolean)
   is
      use type VSS.JSON.Streams.JSON_Stream_Element_Kind;
   begin
      case Reader.Element_Kind is
         when VSS.JSON.Streams.Start_Array  =>
            Value.Append ((Kind => VSS.JSON.Streams.Start_Array));
            Reader.Read_Next;
            while Success and Reader.Element_Kind /= VSS.JSON.Streams.End_Array
            loop
               Input_Any_Value (Reader, Value, Success);
            end loop;
            Value.Append ((Kind => VSS.JSON.Streams.End_Array));

         when VSS.JSON.Streams.Start_Object =>
            Value.Append ((Kind => VSS.JSON.Streams.Start_Object));
            Reader.Read_Next;
            while Success and Reader.Element_Kind = VSS.JSON.Streams.Key_Name
            loop
               Value.Append (Reader.Element);
               Reader.Read_Next;
               Input_Any_Value (Reader, Value, Success);
            end loop;
            Value.Append ((Kind => VSS.JSON.Streams.End_Object));

         when VSS.JSON.Streams.String_Value
            | VSS.JSON.Streams.Number_Value
            | VSS.JSON.Streams.Boolean_Value
            | VSS.JSON.Streams.Null_Value   =>
            Value.Append (Reader.Element);

         when others                        =>
            Success := False;
      end case;
      if Success then
         Reader.Read_Next;
      end if;
   end Input_Any_Value;

   package StringSchema_format_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["date", "date-time", "email", "uri"]);

   procedure Input_StringSchema_format
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.StringSchema_format;
      Success : in out Boolean)
   is
      Index : constant Integer :=
        (if Reader.Is_String_Value
         then
           StringSchema_format_Minimal_Perfect_Hash.Get_Index
             (Reader.String_Value)
         else -1);
   begin
      if Index > 0 then
         Value := Enum.StringSchema_format'Val (Index - 1);
         Reader.Read_Next;
      else
         Success := False;
      end if;
   end Input_StringSchema_format;

   package NumberSchema_type_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["integer", "number"]);

   procedure Input_NumberSchema_type
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.NumberSchema_type;
      Success : in out Boolean)
   is
      Index : constant Integer :=
        (if Reader.Is_String_Value
         then
           NumberSchema_type_Minimal_Perfect_Hash.Get_Index
             (Reader.String_Value)
         else -1);
   begin
      if Index > 0 then
         Value := Enum.NumberSchema_type'Val (Index - 1);
         Reader.Read_Next;
      else
         Success := False;
      end if;
   end Input_NumberSchema_type;

   package ListResourceTemplatesResult_cacheScope_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["private", "public"]);

   procedure Input_ListResourceTemplatesResult_cacheScope
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.ListResourceTemplatesResult_cacheScope;
      Success : in out Boolean)
   is
      Index : constant Integer :=
        (if Reader.Is_String_Value
         then
           ListResourceTemplatesResult_cacheScope_Minimal_Perfect_Hash
             .Get_Index (Reader.String_Value)
         else -1);
   begin
      if Index > 0 then
         Value := Enum.ListResourceTemplatesResult_cacheScope'Val (Index - 1);
         Reader.Read_Next;
      else
         Success := False;
      end if;
   end Input_ListResourceTemplatesResult_cacheScope;

   package Role_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["assistant", "user"]);

   procedure Input_Role
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.Role;
      Success : in out Boolean)
   is
      Index : constant Integer :=
        (if Reader.Is_String_Value
         then Role_Minimal_Perfect_Hash.Get_Index (Reader.String_Value)
         else -1);
   begin
      if Index > 0 then
         Value := Enum.Role'Val (Index - 1);
         Reader.Read_Next;
      else
         Success := False;
      end if;
   end Input_Role;

   package ReadResourceResult_cacheScope_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["private", "public"]);

   procedure Input_ReadResourceResult_cacheScope
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.ReadResourceResult_cacheScope;
      Success : in out Boolean)
   is
      Index : constant Integer :=
        (if Reader.Is_String_Value
         then
           ReadResourceResult_cacheScope_Minimal_Perfect_Hash.Get_Index
             (Reader.String_Value)
         else -1);
   begin
      if Index > 0 then
         Value := Enum.ReadResourceResult_cacheScope'Val (Index - 1);
         Reader.Read_Next;
      else
         Success := False;
      end if;
   end Input_ReadResourceResult_cacheScope;

   package DiscoverResult_cacheScope_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["private", "public"]);

   procedure Input_DiscoverResult_cacheScope
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.DiscoverResult_cacheScope;
      Success : in out Boolean)
   is
      Index : constant Integer :=
        (if Reader.Is_String_Value
         then
           DiscoverResult_cacheScope_Minimal_Perfect_Hash.Get_Index
             (Reader.String_Value)
         else -1);
   begin
      if Index > 0 then
         Value := Enum.DiscoverResult_cacheScope'Val (Index - 1);
         Reader.Read_Next;
      else
         Success := False;
      end if;
   end Input_DiscoverResult_cacheScope;

   package Icon_theme_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["dark", "light"]);

   procedure Input_Icon_theme
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.Icon_theme;
      Success : in out Boolean)
   is
      Index : constant Integer :=
        (if Reader.Is_String_Value
         then Icon_theme_Minimal_Perfect_Hash.Get_Index (Reader.String_Value)
         else -1);
   begin
      if Index > 0 then
         Value := Enum.Icon_theme'Val (Index - 1);
         Reader.Read_Next;
      else
         Success := False;
      end if;
   end Input_Icon_theme;

   package ListResourcesResult_cacheScope_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["private", "public"]);

   procedure Input_ListResourcesResult_cacheScope
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.ListResourcesResult_cacheScope;
      Success : in out Boolean)
   is
      Index : constant Integer :=
        (if Reader.Is_String_Value
         then
           ListResourcesResult_cacheScope_Minimal_Perfect_Hash.Get_Index
             (Reader.String_Value)
         else -1);
   begin
      if Index > 0 then
         Value := Enum.ListResourcesResult_cacheScope'Val (Index - 1);
         Reader.Read_Next;
      else
         Success := False;
      end if;
   end Input_ListResourcesResult_cacheScope;

   package ElicitResult_action_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["accept", "cancel", "decline"]);

   procedure Input_ElicitResult_action
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.ElicitResult_action;
      Success : in out Boolean)
   is
      Index : constant Integer :=
        (if Reader.Is_String_Value
         then
           ElicitResult_action_Minimal_Perfect_Hash.Get_Index
             (Reader.String_Value)
         else -1);
   begin
      if Index > 0 then
         Value := Enum.ElicitResult_action'Val (Index - 1);
         Reader.Read_Next;
      else
         Success := False;
      end if;
   end Input_ElicitResult_action;

   package ToolChoice_mode_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["auto", "none", "required"]);

   procedure Input_ToolChoice_mode
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.ToolChoice_mode;
      Success : in out Boolean)
   is
      Index : constant Integer :=
        (if Reader.Is_String_Value
         then
           ToolChoice_mode_Minimal_Perfect_Hash.Get_Index (Reader.String_Value)
         else -1);
   begin
      if Index > 0 then
         Value := Enum.ToolChoice_mode'Val (Index - 1);
         Reader.Read_Next;
      else
         Success := False;
      end if;
   end Input_ToolChoice_mode;

   package CreateMessageRequestParams_includeContext_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["allServers", "none", "thisServer"]);

   procedure Input_CreateMessageRequestParams_includeContext
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.CreateMessageRequestParams_includeContext;
      Success : in out Boolean)
   is
      Index : constant Integer :=
        (if Reader.Is_String_Value
         then
           CreateMessageRequestParams_includeContext_Minimal_Perfect_Hash
             .Get_Index (Reader.String_Value)
         else -1);
   begin
      if Index > 0 then
         Value :=
           Enum.CreateMessageRequestParams_includeContext'Val (Index - 1);
         Reader.Read_Next;
      else
         Success := False;
      end if;
   end Input_CreateMessageRequestParams_includeContext;

   package LoggingLevel_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["alert",
         "critical",
         "debug",
         "emergency",
         "error",
         "info",
         "notice",
         "warning"]);

   procedure Input_LoggingLevel
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.LoggingLevel;
      Success : in out Boolean)
   is
      Index : constant Integer :=
        (if Reader.Is_String_Value
         then LoggingLevel_Minimal_Perfect_Hash.Get_Index (Reader.String_Value)
         else -1);
   begin
      if Index > 0 then
         Value := Enum.LoggingLevel'Val (Index - 1);
         Reader.Read_Next;
      else
         Success := False;
      end if;
   end Input_LoggingLevel;

   package CacheableResult_cacheScope_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["private", "public"]);

   procedure Input_CacheableResult_cacheScope
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.CacheableResult_cacheScope;
      Success : in out Boolean)
   is
      Index : constant Integer :=
        (if Reader.Is_String_Value
         then
           CacheableResult_cacheScope_Minimal_Perfect_Hash.Get_Index
             (Reader.String_Value)
         else -1);
   begin
      if Index > 0 then
         Value := Enum.CacheableResult_cacheScope'Val (Index - 1);
         Reader.Read_Next;
      else
         Success := False;
      end if;
   end Input_CacheableResult_cacheScope;

   package ListPromptsResult_cacheScope_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["private", "public"]);

   procedure Input_ListPromptsResult_cacheScope
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.ListPromptsResult_cacheScope;
      Success : in out Boolean)
   is
      Index : constant Integer :=
        (if Reader.Is_String_Value
         then
           ListPromptsResult_cacheScope_Minimal_Perfect_Hash.Get_Index
             (Reader.String_Value)
         else -1);
   begin
      if Index > 0 then
         Value := Enum.ListPromptsResult_cacheScope'Val (Index - 1);
         Reader.Read_Next;
      else
         Success := False;
      end if;
   end Input_ListPromptsResult_cacheScope;

   package ListToolsResult_cacheScope_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["private", "public"]);

   procedure Input_ListToolsResult_cacheScope
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.ListToolsResult_cacheScope;
      Success : in out Boolean)
   is
      Index : constant Integer :=
        (if Reader.Is_String_Value
         then
           ListToolsResult_cacheScope_Minimal_Perfect_Hash.Get_Index
             (Reader.String_Value)
         else -1);
   begin
      if Index > 0 then
         Value := Enum.ListToolsResult_cacheScope'Val (Index - 1);
         Reader.Read_Next;
      else
         Success := False;
      end if;
   end Input_ListToolsResult_cacheScope;

   package ElicitRequestParams_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["form", "url"]);

   package SamplingMessageContentBlock_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["text", "image", "audio", "tool_use", "tool_result"]);

   package InputRequest_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["sampling/createMessage", "roots/list", "elicitation/create"]);

   package CompleteRequestParams_ref_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["ref/prompt", "ref/resource"]);

   package ServerNotification_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["notifications/cancelled",
         "notifications/progress",
         "notifications/resources/list_changed",
         "notifications/subscriptions/acknowledged",
         "notifications/resources/updated",
         "notifications/prompts/list_changed",
         "notifications/tools/list_changed",
         "notifications/message"]);

   package ContentBlock_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["text", "image", "audio", "resource_link", "resource"]);

   package ClientRequest_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["server/discover",
         "resources/list",
         "resources/templates/list",
         "resources/read",
         "subscriptions/listen",
         "prompts/list",
         "prompts/get",
         "tools/list",
         "tools/call",
         "completion/complete"]);

   package Error_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["code", "data", "message"]);

   procedure Input_Error
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Error;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 Error_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  code
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Number_Value
                          and then Reader.Number_Value.Kind
                                   = VSS.JSON.JSON_Integer
                        then
                           Value.code := Reader.Number_Value.Integer_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  data
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.data, Success);
                     end if;

                  when 3      =>
                     --  message
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.message := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_Error;

   package BaseMetadata_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["name", "title"]);

   procedure Input_BaseMetadata
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out BaseMetadata;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 BaseMetadata_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_BaseMetadata;

   package ResourceRequestParams_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "uri"]);

   procedure Input_ResourceRequestParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResourceRequestParams;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ResourceRequestParams_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_RequestMetaObject (Reader, Value.meta, Success);
                     end if;

                  when 2      =>
                     --  uri
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.uri := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ResourceRequestParams;

   procedure Input_ElicitRequestParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitRequestParams;
      Success : in out Boolean)
   is
      use all type VSS.JSON.Streams.JSON_Stream_Element_Kind;

      Look_Ahead :
        VSS.JSON.Pull_Readers.Buffered.JSON_Buffered_Pull_Reader
          (Reader'Access);

      Variant_Key : constant VSS.Strings.Virtual_String := "mode";
   begin
      Look_Ahead.Mark;
      if Success and Look_Ahead.Is_Start_Object then
         Look_Ahead.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Look_Ahead.Is_End_Object loop
         if not Look_Ahead.Is_Key_Name then
            Success := False;
         elsif Look_Ahead.Key_Name /= Variant_Key then
            Look_Ahead.Read_Next;  --  skip the key
            Look_Ahead.Skip_Current_Value;
            Success := not Look_Ahead.Is_End_Object;
         elsif Look_Ahead.Read_Next = String_Value then
            declare
               Index : constant Natural :=
                 ElicitRequestParams_Minimal_Perfect_Hash.Get_Index
                   (Look_Ahead.String_Value);
            begin
               Look_Ahead.Reset;
               Look_Ahead.Unmark;

               case Index is
                  when 1      =>
                     --  form
                     Value.Union := (Kind => Enum.form, others => <>);
                     Input_ElicitRequestFormParams
                       (Look_Ahead, Value.Union.form, Success);

                  when 2      =>
                     --  url
                     Value.Union := (Kind => Enum.url, others => <>);
                     Input_ElicitRequestURLParams
                       (Look_Ahead, Value.Union.url, Success);

                  when others =>
                     Success := False;
               end case;

               return;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Look_Ahead.Read_Next;  --  skip End_Object
         Success := False;
      end if;
   end Input_ElicitRequestParams;

   package InputResponseRequestParams_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "inputResponses", "requestState"]);

   procedure Input_InputResponseRequestParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out InputResponseRequestParams;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 InputResponseRequestParams_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_RequestMetaObject (Reader, Value.meta, Success);
                     end if;

                  when 2      =>
                     --  inputResponses
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.inputResponses := (Is_Set => True, Value => <>);
                        Input_InputResponses
                          (Reader, Value.inputResponses.Value, Success);
                     end if;

                  when 3      =>
                     --  requestState
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.requestState := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_InputResponseRequestParams;

   package ToolListChangedNotification_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["jsonrpc", "method", "params"]);

   procedure Input_ToolListChangedNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolListChangedNotification;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ToolListChangedNotification_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 2      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value
                                = "notifications/tools/list_changed"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.params := (Is_Set => True, Value => <>);
                        Input_NotificationParams
                          (Reader, Value.params.Value, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ToolListChangedNotification;

   package ResourceLink_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["_meta",
         "annotations",
         "description",
         "icons",
         "mimeType",
         "name",
         "size",
         "title",
         "type",
         "uri"]);

   procedure Input_ResourceLink
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResourceLink;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ResourceLink_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_MetaObject (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  annotations
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.annotations := (Is_Set => True, Value => <>);
                        Input_Annotations
                          (Reader, Value.annotations.Value, Success);
                     end if;

                  when 3      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  icons
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.icons.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : Icon;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_Icon (Reader, Item, Success);
                                 end if;
                                 Value.icons.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  mimeType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.mimeType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 6      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 7      =>
                     --  size
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.size := (Is_Set => True, Value => <>);
                        if Reader.Is_Number_Value
                          and then Reader.Number_Value.Kind
                                   = VSS.JSON.JSON_Integer
                        then
                           Value.size.Value :=
                             Reader.Number_Value.Integer_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 8      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 9      =>
                     --  type
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "resource_link"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 10     =>
                     --  uri
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.uri := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ResourceLink;

   package PaginatedRequest_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["id", "jsonrpc", "method", "params"]);

   procedure Input_PaginatedRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PaginatedRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 PaginatedRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.method := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_PaginatedRequestParams
                          (Reader, Value.params, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_PaginatedRequest;

   package ImageContent_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "annotations", "data", "mimeType", "type"]);

   procedure Input_ImageContent
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ImageContent;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ImageContent_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_MetaObject (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  annotations
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.annotations := (Is_Set => True, Value => <>);
                        Input_Annotations
                          (Reader, Value.annotations.Value, Success);
                     end if;

                  when 3      =>
                     --  data
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.data := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  mimeType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.mimeType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  type
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "image"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ImageContent;

   package ParseError_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["code", "data", "message"]);

   procedure Input_ParseError
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ParseError;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ParseError_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  code
                     Reader.Read_Next;
                     if Reader.Is_Number_Value
                       and then Reader.Number_Value.String_Value = "-32700"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 2      =>
                     --  data
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.data, Success);
                     end if;

                  when 3      =>
                     --  message
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.message := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ParseError;

   package ListResourcesResultResponse_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["id", "jsonrpc", "result"]);

   procedure Input_ListResourcesResultResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListResourcesResultResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ListResourcesResultResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  result
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ListResourcesResult
                          (Reader, Value.result, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ListResourcesResultResponse;

   package GetPromptRequestParams_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["_meta", "arguments", "inputResponses", "name", "requestState"]);

   procedure Input_GetPromptRequestParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out GetPromptRequestParams;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 GetPromptRequestParams_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_RequestMetaObject (Reader, Value.meta, Success);
                     end if;

                  when 2      =>
                     --  arguments
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.arguments, Success);
                        end if;
                     end if;

                  when 3      =>
                     --  inputResponses
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.inputResponses := (Is_Set => True, Value => <>);
                        Input_InputResponses
                          (Reader, Value.inputResponses.Value, Success);
                     end if;

                  when 4      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  requestState
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.requestState := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_GetPromptRequestParams;

   procedure Input_InputResponses
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out InputResponses;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_InputResponses;

   package SubscriptionsAcknowledgedNotificationParams_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "notifications"]);

   procedure Input_SubscriptionsAcknowledgedNotificationParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SubscriptionsAcknowledgedNotificationParams;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SubscriptionsAcknowledgedNotificationParams_Minimal_Perfect_Hash
                   .Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_NotificationMetaObject
                          (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  notifications
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_SubscriptionFilter
                          (Reader, Value.notifications, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SubscriptionsAcknowledgedNotificationParams;

   package Prompt_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["_meta", "arguments", "description", "icons", "name", "title"]);

   procedure Input_Prompt
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Prompt;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 Prompt_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_MetaObject (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  arguments
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.arguments.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : PromptArgument;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_PromptArgument
                                      (Reader, Item, Success);
                                 end if;
                                 Value.arguments.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  icons
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.icons.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : Icon;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_Icon (Reader, Item, Success);
                                 end if;
                                 Value.icons.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 6      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_Prompt;

   package RequestParams_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta"]);

   procedure Input_RequestParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out RequestParams;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 RequestParams_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_RequestMetaObject (Reader, Value.meta, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_RequestParams;

   package JSONRPCRequest_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["id", "jsonrpc", "method", "params"]);

   procedure Input_JSONRPCRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out JSONRPCRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 JSONRPCRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.method := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.params, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_JSONRPCRequest;

   package InputRequiredResult_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["_meta", "inputRequests", "requestState", "resultType"]);

   procedure Input_InputRequiredResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out InputRequiredResult;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 InputRequiredResult_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_ResultMetaObject
                          (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  inputRequests
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.inputRequests := (Is_Set => True, Value => <>);
                        Input_InputRequests
                          (Reader, Value.inputRequests.Value, Success);
                     end if;

                  when 3      =>
                     --  requestState
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.requestState := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  resultType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.resultType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_InputRequiredResult;

   procedure Input_PrimitiveSchemaDefinition
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PrimitiveSchemaDefinition;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_PrimitiveSchemaDefinition;

   procedure Input_SamplingMessageContentBlock
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SamplingMessageContentBlock;
      Success : in out Boolean)
   is
      use all type VSS.JSON.Streams.JSON_Stream_Element_Kind;

      Look_Ahead :
        VSS.JSON.Pull_Readers.Buffered.JSON_Buffered_Pull_Reader
          (Reader'Access);

      Variant_Key : constant VSS.Strings.Virtual_String := "type";
   begin
      Look_Ahead.Mark;
      if Success and Look_Ahead.Is_Start_Object then
         Look_Ahead.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Look_Ahead.Is_End_Object loop
         if not Look_Ahead.Is_Key_Name then
            Success := False;
         elsif Look_Ahead.Key_Name /= Variant_Key then
            Look_Ahead.Read_Next;  --  skip the key
            Look_Ahead.Skip_Current_Value;
            Success := not Look_Ahead.Is_End_Object;
         elsif Look_Ahead.Read_Next = String_Value then
            declare
               Index : constant Natural :=
                 SamplingMessageContentBlock_Minimal_Perfect_Hash.Get_Index
                   (Look_Ahead.String_Value);
            begin
               Look_Ahead.Reset;
               Look_Ahead.Unmark;

               case Index is
                  when 1      =>
                     --  text
                     Value.Union := (Kind => Enum.text, others => <>);
                     Input_TextContent (Look_Ahead, Value.Union.text, Success);

                  when 2      =>
                     --  image
                     Value.Union := (Kind => Enum.image, others => <>);
                     Input_ImageContent
                       (Look_Ahead, Value.Union.image, Success);

                  when 3      =>
                     --  audio
                     Value.Union := (Kind => Enum.audio, others => <>);
                     Input_AudioContent
                       (Look_Ahead, Value.Union.audio, Success);

                  when 4      =>
                     --  tool_use
                     Value.Union := (Kind => Enum.tool_use, others => <>);
                     Input_ToolUseContent
                       (Look_Ahead, Value.Union.tool_use, Success);

                  when 5      =>
                     --  tool_result
                     Value.Union := (Kind => Enum.tool_result, others => <>);
                     Input_ToolResultContent
                       (Look_Ahead, Value.Union.tool_result, Success);

                  when others =>
                     Success := False;
               end case;

               return;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Look_Ahead.Read_Next;  --  skip End_Object
         Success := False;
      end if;
   end Input_SamplingMessageContentBlock;

   package RequestMetaObject_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["io.modelcontextprotocol/clientCapabilities",
         "io.modelcontextprotocol/clientInfo",
         "io.modelcontextprotocol/logLevel",
         "io.modelcontextprotocol/protocolVersion",
         "progressToken"]);

   procedure Input_RequestMetaObject
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out RequestMetaObject;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 RequestMetaObject_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  io.modelcontextprotocol/clientCapabilities
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ClientCapabilities
                          (Reader,
                           Value.io_modelcontextprotocol_clientCapabilities,
                           Success);
                     end if;

                  when 2      =>
                     --  io.modelcontextprotocol/clientInfo
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.io_modelcontextprotocol_clientInfo :=
                          (Is_Set => True, Value => <>);
                        Input_Implementation
                          (Reader,
                           Value.io_modelcontextprotocol_clientInfo.Value,
                           Success);
                     end if;

                  when 3      =>
                     --  io.modelcontextprotocol/logLevel
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.io_modelcontextprotocol_logLevel :=
                          (Is_Set => True, Value => <>);
                        Input_LoggingLevel
                          (Reader,
                           Value.io_modelcontextprotocol_logLevel.Value,
                           Success);
                     end if;

                  when 4      =>
                     --  io.modelcontextprotocol/protocolVersion
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.io_modelcontextprotocol_protocolVersion :=
                             Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  progressToken
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.progressToken := (Is_Set => True, Value => <>);
                        Value.progressToken.Value := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.progressToken.Value :=
                             (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.progressToken.Value.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_RequestMetaObject;

   package TextContent_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "annotations", "text", "type"]);

   procedure Input_TextContent
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TextContent;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 TextContent_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_MetaObject (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  annotations
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.annotations := (Is_Set => True, Value => <>);
                        Input_Annotations
                          (Reader, Value.annotations.Value, Success);
                     end if;

                  when 3      =>
                     --  text
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.text := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  type
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "text"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_TextContent;

   procedure Input_JSONObject
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out JSONObject;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_JSONObject;

   package SubscriptionsListenRequest_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["id", "jsonrpc", "method", "params"]);

   procedure Input_SubscriptionsListenRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SubscriptionsListenRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SubscriptionsListenRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "subscriptions/listen"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 4      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_SubscriptionsListenRequestParams
                          (Reader, Value.params, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SubscriptionsListenRequest;

   package LoggingMessageNotificationParams_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "data", "level", "logger"]);

   procedure Input_LoggingMessageNotificationParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out LoggingMessageNotificationParams;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 LoggingMessageNotificationParams_Minimal_Perfect_Hash
                   .Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_NotificationMetaObject
                          (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  data
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.data, Success);
                     end if;

                  when 3      =>
                     --  level
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_LoggingLevel (Reader, Value.level, Success);
                     end if;

                  when 4      =>
                     --  logger
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.logger := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_LoggingMessageNotificationParams;

   package SubscriptionsListenResult_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "resultType"]);

   procedure Input_SubscriptionsListenResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SubscriptionsListenResult;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SubscriptionsListenResult_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_SubscriptionsListenResultMetaObject
                          (Reader, Value.meta, Success);
                     end if;

                  when 2      =>
                     --  resultType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.resultType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SubscriptionsListenResult;

   package PromptReference_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["name", "title", "type"]);

   procedure Input_PromptReference
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PromptReference;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 PromptReference_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  type
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "ref/prompt"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_PromptReference;

   package ListResourceTemplatesRequest_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["id", "jsonrpc", "method", "params"]);

   procedure Input_ListResourceTemplatesRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListResourceTemplatesRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ListResourceTemplatesRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value
                                = "resources/templates/list"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 4      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_PaginatedRequestParams
                          (Reader, Value.params, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ListResourceTemplatesRequest;

   procedure Input_InputResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out InputResponse;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_InputResponse;

   package InternalError_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["code", "data", "message"]);

   procedure Input_InternalError
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out InternalError;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 InternalError_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  code
                     Reader.Read_Next;
                     if Reader.Is_Number_Value
                       and then Reader.Number_Value.String_Value = "-32603"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 2      =>
                     --  data
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.data, Success);
                     end if;

                  when 3      =>
                     --  message
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.message := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_InternalError;

   procedure Input_ServerResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ServerResult;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_ServerResult;

   package TextResourceContents_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "mimeType", "text", "uri"]);

   procedure Input_TextResourceContents
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TextResourceContents;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 TextResourceContents_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_MetaObject (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  mimeType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.mimeType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  text
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.text := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  uri
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.uri := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_TextResourceContents;

   package ToolUseContent_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "id", "input", "name", "type"]);

   procedure Input_ToolUseContent
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolUseContent;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ToolUseContent_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_MetaObject (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.id := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  input
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.input, Success);
                        end if;
                     end if;

                  when 4      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  type
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "tool_use"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ToolUseContent;

   package ReadResourceRequestParams_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "inputResponses", "requestState", "uri"]);

   procedure Input_ReadResourceRequestParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ReadResourceRequestParams;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ReadResourceRequestParams_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_RequestMetaObject (Reader, Value.meta, Success);
                     end if;

                  when 2      =>
                     --  inputResponses
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.inputResponses := (Is_Set => True, Value => <>);
                        Input_InputResponses
                          (Reader, Value.inputResponses.Value, Success);
                     end if;

                  when 3      =>
                     --  requestState
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.requestState := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  uri
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.uri := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ReadResourceRequestParams;

   package StringSchema_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["default",
         "description",
         "format",
         "maxLength",
         "minLength",
         "title",
         "type"]);

   procedure Input_StringSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out StringSchema;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 StringSchema_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  default
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.default := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  format
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.format := (Is_Set => True, Value => <>);
                        Input_StringSchema_format
                          (Reader, Value.format.Value, Success);
                     end if;

                  when 4      =>
                     --  maxLength
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.maxLength := (Is_Set => True, Value => <>);
                        if Reader.Is_Number_Value
                          and then Reader.Number_Value.Kind
                                   = VSS.JSON.JSON_Integer
                        then
                           Value.maxLength.Value :=
                             Reader.Number_Value.Integer_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  minLength
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.minLength := (Is_Set => True, Value => <>);
                        if Reader.Is_Number_Value
                          and then Reader.Number_Value.Kind
                                   = VSS.JSON.JSON_Integer
                        then
                           Value.minLength.Value :=
                             Reader.Number_Value.Integer_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 6      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 7      =>
                     --  type
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "string"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_StringSchema;

   package ServerCapabilities_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["completions",
         "experimental",
         "extensions",
         "logging",
         "prompts",
         "resources",
         "tools"]);

   package ServerCapabilities_prompts_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["listChanged"]);

   package ServerCapabilities_resources_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["listChanged", "subscribe"]);

   package ServerCapabilities_tools_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["listChanged"]);

   procedure Input_ServerCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ServerCapabilities;
      Success : in out Boolean)
   is
      procedure Input_ServerCapabilities_prompts
        (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
         Value   : out ServerCapabilities_prompts;
         Success : in out Boolean) is
      begin
         if Success and Reader.Is_Start_Object then
            Reader.Read_Next;
         else
            Success := False;
         end if;

         while Success and not Reader.Is_End_Object loop
            if Reader.Is_Key_Name then
               declare
                  Index : constant Natural :=
                    ServerCapabilities_prompts_Minimal_Perfect_Hash.Get_Index
                      (Reader.Key_Name);
               begin

                  case Index is
                     when 1      =>
                        --  listChanged
                        Reader.Read_Next;
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Boolean_Value then
                              Value.listChanged := Reader.Boolean_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;

                     when others =>
                        Value.Additional_Properties.Append
                          ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                        Reader.Read_Next;
                        Input_Any_Value
                          (Reader, Value.Additional_Properties, Success);
                  end case;
               end;
            else
               Success := False;
            end if;
         end loop;

         if Success then
            Reader.Read_Next;  --  skip End_Object

         end if;
      end Input_ServerCapabilities_prompts;

      procedure Input_ServerCapabilities_resources
        (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
         Value   : out ServerCapabilities_resources;
         Success : in out Boolean) is
      begin
         if Success and Reader.Is_Start_Object then
            Reader.Read_Next;
         else
            Success := False;
         end if;

         while Success and not Reader.Is_End_Object loop
            if Reader.Is_Key_Name then
               declare
                  Index : constant Natural :=
                    ServerCapabilities_resources_Minimal_Perfect_Hash.Get_Index
                      (Reader.Key_Name);
               begin

                  case Index is
                     when 1      =>
                        --  listChanged
                        Reader.Read_Next;
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Boolean_Value then
                              Value.listChanged := Reader.Boolean_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;

                     when 2      =>
                        --  subscribe
                        Reader.Read_Next;
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Boolean_Value then
                              Value.subscribe := Reader.Boolean_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;

                     when others =>
                        Value.Additional_Properties.Append
                          ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                        Reader.Read_Next;
                        Input_Any_Value
                          (Reader, Value.Additional_Properties, Success);
                  end case;
               end;
            else
               Success := False;
            end if;
         end loop;

         if Success then
            Reader.Read_Next;  --  skip End_Object

         end if;
      end Input_ServerCapabilities_resources;

      procedure Input_ServerCapabilities_tools
        (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
         Value   : out ServerCapabilities_tools;
         Success : in out Boolean) is
      begin
         if Success and Reader.Is_Start_Object then
            Reader.Read_Next;
         else
            Success := False;
         end if;

         while Success and not Reader.Is_End_Object loop
            if Reader.Is_Key_Name then
               declare
                  Index : constant Natural :=
                    ServerCapabilities_tools_Minimal_Perfect_Hash.Get_Index
                      (Reader.Key_Name);
               begin

                  case Index is
                     when 1      =>
                        --  listChanged
                        Reader.Read_Next;
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Boolean_Value then
                              Value.listChanged := Reader.Boolean_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;

                     when others =>
                        Value.Additional_Properties.Append
                          ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                        Reader.Read_Next;
                        Input_Any_Value
                          (Reader, Value.Additional_Properties, Success);
                  end case;
               end;
            else
               Success := False;
            end if;
         end loop;

         if Success then
            Reader.Read_Next;  --  skip End_Object

         end if;
      end Input_ServerCapabilities_tools;

   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ServerCapabilities_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  completions
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.completions := (Is_Set => True, Value => <>);
                        Input_JSONObject
                          (Reader, Value.completions.Value, Success);
                     end if;

                  when 2      =>
                     --  experimental
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value
                             (Reader, Value.experimental, Success);
                        end if;
                     end if;

                  when 3      =>
                     --  extensions
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.extensions, Success);
                        end if;
                     end if;

                  when 4      =>
                     --  logging
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.logging := (Is_Set => True, Value => <>);
                        Input_JSONObject
                          (Reader, Value.logging.Value, Success);
                     end if;

                  when 5      =>
                     --  prompts
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.prompts := (Is_Set => True, Value => <>);
                        Input_ServerCapabilities_prompts
                          (Reader, Value.prompts.Value, Success);
                     end if;

                  when 6      =>
                     --  resources
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.resources := (Is_Set => True, Value => <>);
                        Input_ServerCapabilities_resources
                          (Reader, Value.resources.Value, Success);
                     end if;

                  when 7      =>
                     --  tools
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.tools := (Is_Set => True, Value => <>);
                        Input_ServerCapabilities_tools
                          (Reader, Value.tools.Value, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ServerCapabilities;

   procedure Input_InputRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out InputRequest;
      Success : in out Boolean)
   is
      use all type VSS.JSON.Streams.JSON_Stream_Element_Kind;

      Look_Ahead :
        VSS.JSON.Pull_Readers.Buffered.JSON_Buffered_Pull_Reader
          (Reader'Access);

      Variant_Key : constant VSS.Strings.Virtual_String := "method";
   begin
      Look_Ahead.Mark;
      if Success and Look_Ahead.Is_Start_Object then
         Look_Ahead.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Look_Ahead.Is_End_Object loop
         if not Look_Ahead.Is_Key_Name then
            Success := False;
         elsif Look_Ahead.Key_Name /= Variant_Key then
            Look_Ahead.Read_Next;  --  skip the key
            Look_Ahead.Skip_Current_Value;
            Success := not Look_Ahead.Is_End_Object;
         elsif Look_Ahead.Read_Next = String_Value then
            declare
               Index : constant Natural :=
                 InputRequest_Minimal_Perfect_Hash.Get_Index
                   (Look_Ahead.String_Value);
            begin
               Look_Ahead.Reset;
               Look_Ahead.Unmark;

               case Index is
                  when 1      =>
                     --  sampling_createMessage
                     Value.Union :=
                       (Kind => Enum.sampling_createMessage, others => <>);
                     Input_CreateMessageRequest
                       (Look_Ahead,
                        Value.Union.sampling_createMessage,
                        Success);

                  when 2      =>
                     --  roots_list
                     Value.Union := (Kind => Enum.roots_list, others => <>);
                     Input_ListRootsRequest
                       (Look_Ahead, Value.Union.roots_list, Success);

                  when 3      =>
                     --  elicitation_create
                     Value.Union :=
                       (Kind => Enum.elicitation_create, others => <>);
                     Input_ElicitRequest
                       (Look_Ahead, Value.Union.elicitation_create, Success);

                  when others =>
                     Success := False;
               end case;

               return;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Look_Ahead.Read_Next;  --  skip End_Object
         Success := False;
      end if;
   end Input_InputRequest;

   package SubscriptionFilter_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["promptsListChanged",
         "resourceSubscriptions",
         "resourcesListChanged",
         "toolsListChanged"]);

   procedure Input_SubscriptionFilter
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SubscriptionFilter;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SubscriptionFilter_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  promptsListChanged
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Boolean_Value then
                           Value.promptsListChanged := Reader.Boolean_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  resourceSubscriptions
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.resourceSubscriptions.Clear;
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : VSS.Strings.Virtual_String;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    if Reader.Is_String_Value then
                                       Item := Reader.String_Value;
                                       Reader.Read_Next;
                                    else
                                       Success := False;
                                    end if;
                                 end if;
                                 Value.resourceSubscriptions.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  resourcesListChanged
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Boolean_Value then
                           Value.resourcesListChanged := Reader.Boolean_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  toolsListChanged
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Boolean_Value then
                           Value.toolsListChanged := Reader.Boolean_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SubscriptionFilter;

   package Result_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "resultType"]);

   procedure Input_Result
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Result;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 Result_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_ResultMetaObject
                          (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  resultType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.resultType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_Result;

   package CallToolRequestParams_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["_meta", "arguments", "inputResponses", "name", "requestState"]);

   procedure Input_CallToolRequestParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CallToolRequestParams;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CallToolRequestParams_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_RequestMetaObject (Reader, Value.meta, Success);
                     end if;

                  when 2      =>
                     --  arguments
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.arguments, Success);
                        end if;
                     end if;

                  when 3      =>
                     --  inputResponses
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.inputResponses := (Is_Set => True, Value => <>);
                        Input_InputResponses
                          (Reader, Value.inputResponses.Value, Success);
                     end if;

                  when 4      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  requestState
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.requestState := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CallToolRequestParams;

   package ResourceTemplate_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["_meta",
         "annotations",
         "description",
         "icons",
         "mimeType",
         "name",
         "title",
         "uriTemplate"]);

   procedure Input_ResourceTemplate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResourceTemplate;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ResourceTemplate_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_MetaObject (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  annotations
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.annotations := (Is_Set => True, Value => <>);
                        Input_Annotations
                          (Reader, Value.annotations.Value, Success);
                     end if;

                  when 3      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  icons
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.icons.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : Icon;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_Icon (Reader, Item, Success);
                                 end if;
                                 Value.icons.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  mimeType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.mimeType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 6      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 7      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 8      =>
                     --  uriTemplate
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.uriTemplate := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ResourceTemplate;

   package ReadResourceRequest_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["id", "jsonrpc", "method", "params"]);

   procedure Input_ReadResourceRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ReadResourceRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ReadResourceRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "resources/read"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 4      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ReadResourceRequestParams
                          (Reader, Value.params, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ReadResourceRequest;

   package SubscriptionsListenResultMetaObject_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["io.modelcontextprotocol/serverInfo",
         "io.modelcontextprotocol/subscriptionId"]);

   procedure Input_SubscriptionsListenResultMetaObject
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SubscriptionsListenResultMetaObject;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SubscriptionsListenResultMetaObject_Minimal_Perfect_Hash
                   .Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  io.modelcontextprotocol/serverInfo
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.io_modelcontextprotocol_serverInfo :=
                          (Is_Set => True, Value => <>);
                        Input_Implementation
                          (Reader,
                           Value.io_modelcontextprotocol_serverInfo.Value,
                           Success);
                     end if;

                  when 2      =>
                     --  io.modelcontextprotocol/subscriptionId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.io_modelcontextprotocol_subscriptionId :=
                          (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.io_modelcontextprotocol_subscriptionId :=
                             (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value
                                .io_modelcontextprotocol_subscriptionId
                                .Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SubscriptionsListenResultMetaObject;

   package NumberSchema_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["default", "description", "maximum", "minimum", "title", "type"]);

   procedure Input_NumberSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out NumberSchema;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 NumberSchema_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  default
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.default := (Is_Set => True, Value => <>);
                        if Reader.Is_Number_Value then
                           if Reader.Number_Value.Kind = VSS.JSON.JSON_Integer
                           then
                              Value.default.Value :=
                                Float_64 (Reader.Number_Value.Integer_Value);
                           elsif Reader.Number_Value.Kind = VSS.JSON.JSON_Float
                           then
                              Value.default.Value :=
                                Reader.Number_Value.Float_Value;
                           else
                              Success := False;
                           end if;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  maximum
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.maximum := (Is_Set => True, Value => <>);
                        if Reader.Is_Number_Value then
                           if Reader.Number_Value.Kind = VSS.JSON.JSON_Integer
                           then
                              Value.maximum.Value :=
                                Float_64 (Reader.Number_Value.Integer_Value);
                           elsif Reader.Number_Value.Kind = VSS.JSON.JSON_Float
                           then
                              Value.maximum.Value :=
                                Reader.Number_Value.Float_Value;
                           else
                              Success := False;
                           end if;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  minimum
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.minimum := (Is_Set => True, Value => <>);
                        if Reader.Is_Number_Value then
                           if Reader.Number_Value.Kind = VSS.JSON.JSON_Integer
                           then
                              Value.minimum.Value :=
                                Float_64 (Reader.Number_Value.Integer_Value);
                           elsif Reader.Number_Value.Kind = VSS.JSON.JSON_Float
                           then
                              Value.minimum.Value :=
                                Reader.Number_Value.Float_Value;
                           else
                              Success := False;
                           end if;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 6      =>
                     --  type
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_NumberSchema_type
                          (Reader, Value.a_type, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_NumberSchema;

   package Annotations_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["audience", "lastModified", "priority"]);

   procedure Input_Annotations
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Annotations;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 Annotations_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  audience
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.audience.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : Enum.Role;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_Role (Reader, Item, Success);
                                 end if;
                                 Value.audience.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  lastModified
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.lastModified := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  priority
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.priority := (Is_Set => True, Value => <>);
                        if Reader.Is_Number_Value then
                           if Reader.Number_Value.Kind = VSS.JSON.JSON_Integer
                           then
                              Value.priority.Value :=
                                Float_64 (Reader.Number_Value.Integer_Value);
                           elsif Reader.Number_Value.Kind = VSS.JSON.JSON_Float
                           then
                              Value.priority.Value :=
                                Reader.Number_Value.Float_Value;
                           else
                              Success := False;
                           end if;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_Annotations;

   package SamplingMessage_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "content", "role"]);

   procedure Input_SamplingMessage
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SamplingMessage;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SamplingMessage_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_MetaObject (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  content
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.content, Success);
                     end if;

                  when 3      =>
                     --  role
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Role (Reader, Value.role, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SamplingMessage;

   package PaginatedResult_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "nextCursor", "resultType"]);

   procedure Input_PaginatedResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PaginatedResult;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 PaginatedResult_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_ResultMetaObject
                          (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  nextCursor
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.nextCursor := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  resultType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.resultType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_PaginatedResult;

   package PromptListChangedNotification_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["jsonrpc", "method", "params"]);

   procedure Input_PromptListChangedNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PromptListChangedNotification;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 PromptListChangedNotification_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 2      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value
                                = "notifications/prompts/list_changed"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.params := (Is_Set => True, Value => <>);
                        Input_NotificationParams
                          (Reader, Value.params.Value, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_PromptListChangedNotification;

   package CompleteRequestParams_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "argument", "context", "ref"]);

   package CompleteRequestParams_argument_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["name", "value"]);

   package CompleteRequestParams_context_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["arguments"]);

   procedure Input_CompleteRequestParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CompleteRequestParams;
      Success : in out Boolean)
   is
      procedure Input_CompleteRequestParams_argument
        (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
         Value   : out CompleteRequestParams_argument;
         Success : in out Boolean) is
      begin
         if Success and Reader.Is_Start_Object then
            Reader.Read_Next;
         else
            Success := False;
         end if;

         while Success and not Reader.Is_End_Object loop
            if Reader.Is_Key_Name then
               declare
                  Index : constant Natural :=
                    CompleteRequestParams_argument_Minimal_Perfect_Hash
                      .Get_Index (Reader.Key_Name);
               begin

                  case Index is
                     when 1      =>
                        --  name
                        Reader.Read_Next;
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_String_Value then
                              Value.name := Reader.String_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;

                     when 2      =>
                        --  value
                        Reader.Read_Next;
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_String_Value then
                              Value.value := Reader.String_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;

                     when others =>
                        Value.Additional_Properties.Append
                          ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                        Reader.Read_Next;
                        Input_Any_Value
                          (Reader, Value.Additional_Properties, Success);
                  end case;
               end;
            else
               Success := False;
            end if;
         end loop;

         if Success then
            Reader.Read_Next;  --  skip End_Object

         end if;
      end Input_CompleteRequestParams_argument;

      procedure Input_CompleteRequestParams_context
        (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
         Value   : out CompleteRequestParams_context;
         Success : in out Boolean) is
      begin
         if Success and Reader.Is_Start_Object then
            Reader.Read_Next;
         else
            Success := False;
         end if;

         while Success and not Reader.Is_End_Object loop
            if Reader.Is_Key_Name then
               declare
                  Index : constant Natural :=
                    CompleteRequestParams_context_Minimal_Perfect_Hash
                      .Get_Index (Reader.Key_Name);
               begin

                  case Index is
                     when 1      =>
                        --  arguments
                        Reader.Read_Next;
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Null_Value then
                              Reader.Read_Next;
                           else
                              Input_Any_Value
                                (Reader, Value.arguments, Success);
                           end if;
                        end if;

                     when others =>
                        Value.Additional_Properties.Append
                          ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                        Reader.Read_Next;
                        Input_Any_Value
                          (Reader, Value.Additional_Properties, Success);
                  end case;
               end;
            else
               Success := False;
            end if;
         end loop;

         if Success then
            Reader.Read_Next;  --  skip End_Object

         end if;
      end Input_CompleteRequestParams_context;

   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CompleteRequestParams_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_RequestMetaObject (Reader, Value.meta, Success);
                     end if;

                  when 2      =>
                     --  argument
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_CompleteRequestParams_argument
                          (Reader, Value.argument, Success);
                     end if;

                  when 3      =>
                     --  context
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.context := (Is_Set => True, Value => <>);
                        Input_CompleteRequestParams_context
                          (Reader, Value.context.Value, Success);
                     end if;

                  when 4      =>
                     --  ref
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.ref, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CompleteRequestParams;

   package ListResourceTemplatesResult_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["_meta",
         "cacheScope",
         "nextCursor",
         "resourceTemplates",
         "resultType",
         "ttlMs"]);

   procedure Input_ListResourceTemplatesResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListResourceTemplatesResult;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ListResourceTemplatesResult_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_ResultMetaObject
                          (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  cacheScope
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ListResourceTemplatesResult_cacheScope
                          (Reader, Value.cacheScope, Success);
                     end if;

                  when 3      =>
                     --  nextCursor
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.nextCursor := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  resourceTemplates
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.resourceTemplates.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : ResourceTemplate;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_ResourceTemplate
                                      (Reader, Item, Success);
                                 end if;
                                 Value.resourceTemplates.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  resultType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.resultType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 6      =>
                     --  ttlMs
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Number_Value
                          and then Reader.Number_Value.Kind
                                   = VSS.JSON.JSON_Integer
                        then
                           Value.ttlMs := Reader.Number_Value.Integer_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ListResourceTemplatesResult;

   procedure Input_MultiSelectEnumSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out MultiSelectEnumSchema;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_MultiSelectEnumSchema;

   package ListToolsResultResponse_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["id", "jsonrpc", "result"]);

   procedure Input_ListToolsResultResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListToolsResultResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ListToolsResultResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  result
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ListToolsResult (Reader, Value.result, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ListToolsResultResponse;

   package ToolResultContent_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["_meta",
         "content",
         "isError",
         "structuredContent",
         "toolUseId",
         "type"]);

   procedure Input_ToolResultContent
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolResultContent;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ToolResultContent_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_MetaObject (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  content
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.content.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : ContentBlock;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_ContentBlock (Reader, Item, Success);
                                 end if;
                                 Value.content.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  isError
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Boolean_Value then
                           Value.isError := Reader.Boolean_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  structuredContent
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value
                          (Reader, Value.structuredContent, Success);
                     end if;

                  when 5      =>
                     --  toolUseId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.toolUseId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 6      =>
                     --  type
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "tool_result"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ToolResultContent;

   package CallToolRequest_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["id", "jsonrpc", "method", "params"]);

   procedure Input_CallToolRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CallToolRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CallToolRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "tools/call"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 4      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_CallToolRequestParams
                          (Reader, Value.params, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CallToolRequest;

   package ResourceContents_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "mimeType", "uri"]);

   procedure Input_ResourceContents
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResourceContents;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ResourceContents_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_MetaObject (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  mimeType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.mimeType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  uri
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.uri := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ResourceContents;

   package CallToolResultResponse_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["id", "jsonrpc", "result"]);

   procedure Input_CallToolResultResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CallToolResultResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CallToolResultResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  result
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.result, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CallToolResultResponse;

   package ClientNotification_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["jsonrpc", "method", "params"]);

   procedure Input_ClientNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ClientNotification;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ClientNotification_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 2      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "notifications/cancelled"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_CancelledNotificationParams
                          (Reader, Value.params, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ClientNotification;

   package ModelHint_Minimal_Perfect_Hash is new MCP.Key_Lookups (["name"]);

   procedure Input_ModelHint
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ModelHint;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ModelHint_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ModelHint;

   package ReadResourceResult_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["_meta", "cacheScope", "contents", "resultType", "ttlMs"]);

   procedure Input_ReadResourceResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ReadResourceResult;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ReadResourceResult_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_ResultMetaObject
                          (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  cacheScope
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ReadResourceResult_cacheScope
                          (Reader, Value.cacheScope, Success);
                     end if;

                  when 3      =>
                     --  contents
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.contents, Success);
                     end if;

                  when 4      =>
                     --  resultType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.resultType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  ttlMs
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Number_Value
                          and then Reader.Number_Value.Kind
                                   = VSS.JSON.JSON_Integer
                        then
                           Value.ttlMs := Reader.Number_Value.Integer_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ReadResourceResult;

   package ElicitRequestURLParams_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["message", "mode", "url"]);

   procedure Input_ElicitRequestURLParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitRequestURLParams;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ElicitRequestURLParams_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  message
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.message := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  mode
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "url"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  url
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.url := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ElicitRequestURLParams;

   package SubscriptionsListenRequestParams_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "notifications"]);

   procedure Input_SubscriptionsListenRequestParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SubscriptionsListenRequestParams;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SubscriptionsListenRequestParams_Minimal_Perfect_Hash
                   .Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_RequestMetaObject (Reader, Value.meta, Success);
                     end if;

                  when 2      =>
                     --  notifications
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_SubscriptionFilter
                          (Reader, Value.notifications, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SubscriptionsListenRequestParams;

   procedure Input_EnumSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out EnumSchema;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_EnumSchema;

   package DiscoverRequest_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["id", "jsonrpc", "method", "params"]);

   procedure Input_DiscoverRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out DiscoverRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 DiscoverRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "server/discover"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 4      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_RequestParams (Reader, Value.params, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_DiscoverRequest;

   package CreateMessageRequest_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["method", "params"]);

   procedure Input_CreateMessageRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CreateMessageRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CreateMessageRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "sampling/createMessage"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 2      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_CreateMessageRequestParams
                          (Reader, Value.params, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CreateMessageRequest;

   package ProgressNotification_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["jsonrpc", "method", "params"]);

   procedure Input_ProgressNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ProgressNotification;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ProgressNotification_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 2      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "notifications/progress"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ProgressNotificationParams
                          (Reader, Value.params, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ProgressNotification;

   package ListPromptsResultResponse_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["id", "jsonrpc", "result"]);

   procedure Input_ListPromptsResultResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListPromptsResultResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ListPromptsResultResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  result
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ListPromptsResult
                          (Reader, Value.result, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ListPromptsResultResponse;

   procedure Input_SingleSelectEnumSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SingleSelectEnumSchema;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_SingleSelectEnumSchema;

   package PromptMessage_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["content", "role"]);

   procedure Input_PromptMessage
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PromptMessage;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 PromptMessage_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  content
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ContentBlock (Reader, Value.content, Success);
                     end if;

                  when 2      =>
                     --  role
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Role (Reader, Value.role, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_PromptMessage;

   procedure Input_MetaObject
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out MetaObject;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_MetaObject;

   procedure Input_ServerNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ServerNotification;
      Success : in out Boolean)
   is
      use all type VSS.JSON.Streams.JSON_Stream_Element_Kind;

      Look_Ahead :
        VSS.JSON.Pull_Readers.Buffered.JSON_Buffered_Pull_Reader
          (Reader'Access);

      Variant_Key : constant VSS.Strings.Virtual_String := "method";
   begin
      Look_Ahead.Mark;
      if Success and Look_Ahead.Is_Start_Object then
         Look_Ahead.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Look_Ahead.Is_End_Object loop
         if not Look_Ahead.Is_Key_Name then
            Success := False;
         elsif Look_Ahead.Key_Name /= Variant_Key then
            Look_Ahead.Read_Next;  --  skip the key
            Look_Ahead.Skip_Current_Value;
            Success := not Look_Ahead.Is_End_Object;
         elsif Look_Ahead.Read_Next = String_Value then
            declare
               Index : constant Natural :=
                 ServerNotification_Minimal_Perfect_Hash.Get_Index
                   (Look_Ahead.String_Value);
            begin
               Look_Ahead.Reset;
               Look_Ahead.Unmark;

               case Index is
                  when 1      =>
                     --  notifications_cancelled
                     Value.Union :=
                       (Kind => Enum.notifications_cancelled, others => <>);
                     Input_CancelledNotification
                       (Look_Ahead,
                        Value.Union.notifications_cancelled,
                        Success);

                  when 2      =>
                     --  notifications_progress
                     Value.Union :=
                       (Kind => Enum.notifications_progress, others => <>);
                     Input_ProgressNotification
                       (Look_Ahead,
                        Value.Union.notifications_progress,
                        Success);

                  when 3      =>
                     --  notifications_resources_list_changed
                     Value.Union :=
                       (Kind   => Enum.notifications_resources_list_changed,
                        others => <>);
                     Input_ResourceListChangedNotification
                       (Look_Ahead,
                        Value.Union.notifications_resources_list_changed,
                        Success);

                  when 4      =>
                     --  notifications_subscriptions_acknowledged
                     Value.Union :=
                       (Kind   =>
                          Enum.notifications_subscriptions_acknowledged,
                        others => <>);
                     Input_SubscriptionsAcknowledgedNotification
                       (Look_Ahead,
                        Value.Union.notifications_subscriptions_acknowledged,
                        Success);

                  when 5      =>
                     --  notifications_resources_updated
                     Value.Union :=
                       (Kind   => Enum.notifications_resources_updated,
                        others => <>);
                     Input_ResourceUpdatedNotification
                       (Look_Ahead,
                        Value.Union.notifications_resources_updated,
                        Success);

                  when 6      =>
                     --  notifications_prompts_list_changed
                     Value.Union :=
                       (Kind   => Enum.notifications_prompts_list_changed,
                        others => <>);
                     Input_PromptListChangedNotification
                       (Look_Ahead,
                        Value.Union.notifications_prompts_list_changed,
                        Success);

                  when 7      =>
                     --  notifications_tools_list_changed
                     Value.Union :=
                       (Kind   => Enum.notifications_tools_list_changed,
                        others => <>);
                     Input_ToolListChangedNotification
                       (Look_Ahead,
                        Value.Union.notifications_tools_list_changed,
                        Success);

                  when 8      =>
                     --  notifications_message
                     Value.Union :=
                       (Kind => Enum.notifications_message, others => <>);
                     Input_LoggingMessageNotification
                       (Look_Ahead,
                        Value.Union.notifications_message,
                        Success);

                  when others =>
                     Success := False;
               end case;

               return;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Look_Ahead.Read_Next;  --  skip End_Object
         Success := False;
      end if;
   end Input_ServerNotification;

   package JSONRPCNotification_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["jsonrpc", "method", "params"]);

   procedure Input_JSONRPCNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out JSONRPCNotification;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 JSONRPCNotification_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 2      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.method := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.params, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_JSONRPCNotification;

   procedure Input_InputRequests
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out InputRequests;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_InputRequests;

   package ListPromptsRequest_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["id", "jsonrpc", "method", "params"]);

   procedure Input_ListPromptsRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListPromptsRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ListPromptsRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "prompts/list"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 4      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_PaginatedRequestParams
                          (Reader, Value.params, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ListPromptsRequest;

   package DiscoverResultResponse_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["id", "jsonrpc", "result"]);

   procedure Input_DiscoverResultResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out DiscoverResultResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 DiscoverResultResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  result
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_DiscoverResult (Reader, Value.result, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_DiscoverResultResponse;

   package ElicitRequest_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["method", "params"]);

   procedure Input_ElicitRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ElicitRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "elicitation/create"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 2      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ElicitRequestParams
                          (Reader, Value.params, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ElicitRequest;

   package ClientCapabilities_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["elicitation", "experimental", "extensions", "roots", "sampling"]);

   package ClientCapabilities_elicitation_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["form", "url"]);

   package ClientCapabilities_sampling_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["context", "tools"]);

   procedure Input_ClientCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ClientCapabilities;
      Success : in out Boolean)
   is
      procedure Input_ClientCapabilities_elicitation
        (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
         Value   : out ClientCapabilities_elicitation;
         Success : in out Boolean) is
      begin
         if Success and Reader.Is_Start_Object then
            Reader.Read_Next;
         else
            Success := False;
         end if;

         while Success and not Reader.Is_End_Object loop
            if Reader.Is_Key_Name then
               declare
                  Index : constant Natural :=
                    ClientCapabilities_elicitation_Minimal_Perfect_Hash
                      .Get_Index (Reader.Key_Name);
               begin

                  case Index is
                     when 1      =>
                        --  form
                        Reader.Read_Next;
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Value.form := (Is_Set => True, Value => <>);
                           Input_JSONObject
                             (Reader, Value.form.Value, Success);
                        end if;

                     when 2      =>
                        --  url
                        Reader.Read_Next;
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Value.url := (Is_Set => True, Value => <>);
                           Input_JSONObject (Reader, Value.url.Value, Success);
                        end if;

                     when others =>
                        Value.Additional_Properties.Append
                          ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                        Reader.Read_Next;
                        Input_Any_Value
                          (Reader, Value.Additional_Properties, Success);
                  end case;
               end;
            else
               Success := False;
            end if;
         end loop;

         if Success then
            Reader.Read_Next;  --  skip End_Object

         end if;
      end Input_ClientCapabilities_elicitation;

      procedure Input_ClientCapabilities_sampling
        (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
         Value   : out ClientCapabilities_sampling;
         Success : in out Boolean) is
      begin
         if Success and Reader.Is_Start_Object then
            Reader.Read_Next;
         else
            Success := False;
         end if;

         while Success and not Reader.Is_End_Object loop
            if Reader.Is_Key_Name then
               declare
                  Index : constant Natural :=
                    ClientCapabilities_sampling_Minimal_Perfect_Hash.Get_Index
                      (Reader.Key_Name);
               begin

                  case Index is
                     when 1      =>
                        --  context
                        Reader.Read_Next;
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Value.context := (Is_Set => True, Value => <>);
                           Input_JSONObject
                             (Reader, Value.context.Value, Success);
                        end if;

                     when 2      =>
                        --  tools
                        Reader.Read_Next;
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Value.tools := (Is_Set => True, Value => <>);
                           Input_JSONObject
                             (Reader, Value.tools.Value, Success);
                        end if;

                     when others =>
                        Value.Additional_Properties.Append
                          ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                        Reader.Read_Next;
                        Input_Any_Value
                          (Reader, Value.Additional_Properties, Success);
                  end case;
               end;
            else
               Success := False;
            end if;
         end loop;

         if Success then
            Reader.Read_Next;  --  skip End_Object

         end if;
      end Input_ClientCapabilities_sampling;

   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ClientCapabilities_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  elicitation
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.elicitation := (Is_Set => True, Value => <>);
                        Input_ClientCapabilities_elicitation
                          (Reader, Value.elicitation.Value, Success);
                     end if;

                  when 2      =>
                     --  experimental
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value
                             (Reader, Value.experimental, Success);
                        end if;
                     end if;

                  when 3      =>
                     --  extensions
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.extensions, Success);
                        end if;
                     end if;

                  when 4      =>
                     --  roots
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.roots, Success);
                        end if;
                     end if;

                  when 5      =>
                     --  sampling
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.sampling := (Is_Set => True, Value => <>);
                        Input_ClientCapabilities_sampling
                          (Reader, Value.sampling.Value, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ClientCapabilities;

   package DiscoverResult_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["_meta",
         "cacheScope",
         "capabilities",
         "instructions",
         "resultType",
         "supportedVersions",
         "ttlMs"]);

   procedure Input_DiscoverResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out DiscoverResult;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 DiscoverResult_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_ResultMetaObject
                          (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  cacheScope
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_DiscoverResult_cacheScope
                          (Reader, Value.cacheScope, Success);
                     end if;

                  when 3      =>
                     --  capabilities
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ServerCapabilities
                          (Reader, Value.capabilities, Success);
                     end if;

                  when 4      =>
                     --  instructions
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.instructions := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  resultType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.resultType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 6      =>
                     --  supportedVersions
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.supportedVersions.Clear;
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : VSS.Strings.Virtual_String;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    if Reader.Is_String_Value then
                                       Item := Reader.String_Value;
                                       Reader.Read_Next;
                                    else
                                       Success := False;
                                    end if;
                                 end if;
                                 Value.supportedVersions.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 7      =>
                     --  ttlMs
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Number_Value
                          and then Reader.Number_Value.Kind
                                   = VSS.JSON.JSON_Integer
                        then
                           Value.ttlMs := Reader.Number_Value.Integer_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_DiscoverResult;

   package Request_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["method", "params"]);

   procedure Input_Request
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Request;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 Request_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.method := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.params, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_Request;

   package AudioContent_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "annotations", "data", "mimeType", "type"]);

   procedure Input_AudioContent
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AudioContent;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 AudioContent_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_MetaObject (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  annotations
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.annotations := (Is_Set => True, Value => <>);
                        Input_Annotations
                          (Reader, Value.annotations.Value, Success);
                     end if;

                  when 3      =>
                     --  data
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.data := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  mimeType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.mimeType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  type
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "audio"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_AudioContent;

   package JSONRPCErrorResponse_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["error", "id", "jsonrpc"]);

   procedure Input_JSONRPCErrorResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out JSONRPCErrorResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 JSONRPCErrorResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  error
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Error (Reader, Value.error, Success);
                     end if;

                  when 2      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (Is_Set => True, Value => <>);
                        Value.id.Value := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id.Value := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Value.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 3      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_JSONRPCErrorResponse;

   package Implementation_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["description", "icons", "name", "title", "version", "websiteUrl"]);

   procedure Input_Implementation
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Implementation;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 Implementation_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  icons
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.icons.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : Icon;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_Icon (Reader, Item, Success);
                                 end if;
                                 Value.icons.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  version
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.version := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 6      =>
                     --  websiteUrl
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.websiteUrl := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_Implementation;

   package Tool_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["_meta",
         "annotations",
         "description",
         "icons",
         "inputSchema",
         "name",
         "outputSchema",
         "title"]);

   procedure Input_Tool
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Tool;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 Tool_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_MetaObject (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  annotations
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.annotations := (Is_Set => True, Value => <>);
                        Input_ToolAnnotations
                          (Reader, Value.annotations.Value, Success);
                     end if;

                  when 3      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  icons
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.icons.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : Icon;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_Icon (Reader, Item, Success);
                                 end if;
                                 Value.icons.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  inputSchema
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value
                             (Reader, Value.inputSchema, Success);
                        end if;
                     end if;

                  when 6      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 7      =>
                     --  outputSchema
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value
                             (Reader, Value.outputSchema, Success);
                        end if;
                     end if;

                  when 8      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_Tool;

   package NotificationMetaObject_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["io.modelcontextprotocol/subscriptionId"]);

   procedure Input_NotificationMetaObject
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out NotificationMetaObject;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 NotificationMetaObject_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  io.modelcontextprotocol/subscriptionId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.io_modelcontextprotocol_subscriptionId :=
                          (Is_Set => True, Value => <>);
                        Value.io_modelcontextprotocol_subscriptionId.Value :=
                          (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value
                             .io_modelcontextprotocol_subscriptionId
                             .Value :=
                             (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value
                                .io_modelcontextprotocol_subscriptionId
                                .Value
                                .Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_NotificationMetaObject;

   package Icons_Minimal_Perfect_Hash is new MCP.Key_Lookups (["icons"]);

   procedure Input_Icons
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Icons;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 Icons_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  icons
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.icons.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : Icon;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_Icon (Reader, Item, Success);
                                 end if;
                                 Value.icons.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_Icons;

   package UntitledSingleSelectEnumSchema_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["default", "description", "enum", "title", "type"]);

   procedure Input_UntitledSingleSelectEnumSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out UntitledSingleSelectEnumSchema;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 UntitledSingleSelectEnumSchema_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  default
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.default := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  enum
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.enum.Clear;
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : VSS.Strings.Virtual_String;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    if Reader.Is_String_Value then
                                       Item := Reader.String_Value;
                                       Reader.Read_Next;
                                    else
                                       Success := False;
                                    end if;
                                 end if;
                                 Value.enum.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  type
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "string"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_UntitledSingleSelectEnumSchema;

   package Icon_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["mimeType", "sizes", "src", "theme"]);

   procedure Input_Icon
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Icon;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 Icon_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  mimeType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.mimeType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  sizes
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.sizes.Clear;
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : VSS.Strings.Virtual_String;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    if Reader.Is_String_Value then
                                       Item := Reader.String_Value;
                                       Reader.Read_Next;
                                    else
                                       Success := False;
                                    end if;
                                 end if;
                                 Value.sizes.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  src
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.src := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  theme
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.theme := (Is_Set => True, Value => <>);
                        Input_Icon_theme (Reader, Value.theme.Value, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_Icon;

   package CancelledNotification_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["jsonrpc", "method", "params"]);

   procedure Input_CancelledNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CancelledNotification;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CancelledNotification_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 2      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "notifications/cancelled"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_CancelledNotificationParams
                          (Reader, Value.params, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CancelledNotification;

   package CompleteResultResponse_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["id", "jsonrpc", "result"]);

   procedure Input_CompleteResultResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CompleteResultResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CompleteResultResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  result
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_CompleteResult (Reader, Value.result, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CompleteResultResponse;

   package GetPromptResultResponse_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["id", "jsonrpc", "result"]);

   procedure Input_GetPromptResultResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out GetPromptResultResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 GetPromptResultResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  result
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.result, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_GetPromptResultResponse;

   package ResourceUpdatedNotification_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["jsonrpc", "method", "params"]);

   procedure Input_ResourceUpdatedNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResourceUpdatedNotification;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ResourceUpdatedNotification_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 2      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value
                                = "notifications/resources/updated"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ResourceUpdatedNotificationParams
                          (Reader, Value.params, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ResourceUpdatedNotification;

   package BlobResourceContents_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "blob", "mimeType", "uri"]);

   procedure Input_BlobResourceContents
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out BlobResourceContents;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 BlobResourceContents_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_MetaObject (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  blob
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.blob := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  mimeType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.mimeType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  uri
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.uri := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_BlobResourceContents;

   package LegacyTitledEnumSchema_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["default", "description", "enum", "enumNames", "title", "type"]);

   procedure Input_LegacyTitledEnumSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out LegacyTitledEnumSchema;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 LegacyTitledEnumSchema_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  default
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.default := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  enum
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.enum.Clear;
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : VSS.Strings.Virtual_String;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    if Reader.Is_String_Value then
                                       Item := Reader.String_Value;
                                       Reader.Read_Next;
                                    else
                                       Success := False;
                                    end if;
                                 end if;
                                 Value.enum.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  enumNames
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.enumNames.Clear;
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : VSS.Strings.Virtual_String;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    if Reader.Is_String_Value then
                                       Item := Reader.String_Value;
                                       Reader.Read_Next;
                                    else
                                       Success := False;
                                    end if;
                                 end if;
                                 Value.enumNames.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 6      =>
                     --  type
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "string"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_LegacyTitledEnumSchema;

   procedure Input_JSONRPCMessage
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out JSONRPCMessage;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_JSONRPCMessage;

   package ListRootsResult_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["roots"]);

   procedure Input_ListRootsResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListRootsResult;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ListRootsResult_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  roots
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.roots.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : Root;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_Root (Reader, Item, Success);
                                 end if;
                                 Value.roots.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ListRootsResult;

   package ListResourcesRequest_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["id", "jsonrpc", "method", "params"]);

   procedure Input_ListResourcesRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListResourcesRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ListResourcesRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "resources/list"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 4      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_PaginatedRequestParams
                          (Reader, Value.params, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ListResourcesRequest;

   package CreateMessageResult_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "content", "model", "role", "stopReason"]);

   procedure Input_CreateMessageResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CreateMessageResult;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CreateMessageResult_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_MetaObject (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  content
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.content, Success);
                     end if;

                  when 3      =>
                     --  model
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.model := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  role
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Role (Reader, Value.role, Success);
                     end if;

                  when 5      =>
                     --  stopReason
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.stopReason := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CreateMessageResult;

   procedure Input_JSONValue
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out JSONValue;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_JSONValue;

   package CompleteResult_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "completion", "resultType"]);

   package CompleteResult_completion_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["hasMore", "total", "values"]);

   procedure Input_CompleteResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CompleteResult;
      Success : in out Boolean)
   is
      procedure Input_CompleteResult_completion
        (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
         Value   : out CompleteResult_completion;
         Success : in out Boolean) is
      begin
         if Success and Reader.Is_Start_Object then
            Reader.Read_Next;
         else
            Success := False;
         end if;

         while Success and not Reader.Is_End_Object loop
            if Reader.Is_Key_Name then
               declare
                  Index : constant Natural :=
                    CompleteResult_completion_Minimal_Perfect_Hash.Get_Index
                      (Reader.Key_Name);
               begin

                  case Index is
                     when 1      =>
                        --  hasMore
                        Reader.Read_Next;
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Boolean_Value then
                              Value.hasMore := Reader.Boolean_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;

                     when 2      =>
                        --  total
                        Reader.Read_Next;
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Value.total := (Is_Set => True, Value => <>);
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.total.Value :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;

                     when 3      =>
                        --  values
                        Reader.Read_Next;
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Success and Reader.Is_Start_Array then
                              Reader.Read_Next;
                              Value.values.Clear;
                              while Success and not Reader.Is_End_Array loop
                                 declare
                                    Item : VSS.Strings.Virtual_String;
                                 begin
                                    if Reader.Is_Null_Value then
                                       Reader.Read_Next;
                                    else
                                       if Reader.Is_String_Value then
                                          Item := Reader.String_Value;
                                          Reader.Read_Next;
                                       else
                                          Success := False;
                                       end if;
                                    end if;
                                    Value.values.Append (Item);
                                 end;
                              end loop;
                              if Success then
                                 Reader.Read_Next;  --  skip End_Array

                              end if;
                           else
                              Success := False;
                           end if;
                        end if;

                     when others =>
                        Value.Additional_Properties.Append
                          ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                        Reader.Read_Next;
                        Input_Any_Value
                          (Reader, Value.Additional_Properties, Success);
                  end case;
               end;
            else
               Success := False;
            end if;
         end loop;

         if Success then
            Reader.Read_Next;  --  skip End_Object

         end if;
      end Input_CompleteResult_completion;

   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CompleteResult_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_ResultMetaObject
                          (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  completion
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_CompleteResult_completion
                          (Reader, Value.completion, Success);
                     end if;

                  when 3      =>
                     --  resultType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.resultType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CompleteResult;

   package EmbeddedResource_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "annotations", "resource", "type"]);

   procedure Input_EmbeddedResource
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out EmbeddedResource;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 EmbeddedResource_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_MetaObject (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  annotations
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.annotations := (Is_Set => True, Value => <>);
                        Input_Annotations
                          (Reader, Value.annotations.Value, Success);
                     end if;

                  when 3      =>
                     --  resource
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.resource, Success);
                     end if;

                  when 4      =>
                     --  type
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "resource"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_EmbeddedResource;

   package ListResourcesResult_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["_meta",
         "cacheScope",
         "nextCursor",
         "resources",
         "resultType",
         "ttlMs"]);

   procedure Input_ListResourcesResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListResourcesResult;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ListResourcesResult_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_ResultMetaObject
                          (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  cacheScope
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ListResourcesResult_cacheScope
                          (Reader, Value.cacheScope, Success);
                     end if;

                  when 3      =>
                     --  nextCursor
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.nextCursor := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  resources
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.resources.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : Resource;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_Resource (Reader, Item, Success);
                                 end if;
                                 Value.resources.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  resultType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.resultType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 6      =>
                     --  ttlMs
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Number_Value
                          and then Reader.Number_Value.Kind
                                   = VSS.JSON.JSON_Integer
                        then
                           Value.ttlMs := Reader.Number_Value.Integer_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ListResourcesResult;

   package CallToolResult_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["_meta", "content", "isError", "resultType", "structuredContent"]);

   procedure Input_CallToolResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CallToolResult;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CallToolResult_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_ResultMetaObject
                          (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  content
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.content.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : ContentBlock;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_ContentBlock (Reader, Item, Success);
                                 end if;
                                 Value.content.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  isError
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Boolean_Value then
                           Value.isError := Reader.Boolean_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  resultType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.resultType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  structuredContent
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value
                          (Reader, Value.structuredContent, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CallToolResult;

   package ProgressNotificationParams_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["_meta", "message", "progress", "progressToken", "total"]);

   procedure Input_ProgressNotificationParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ProgressNotificationParams;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ProgressNotificationParams_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_NotificationMetaObject
                          (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  message
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.message := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  progress
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Number_Value then
                           if Reader.Number_Value.Kind = VSS.JSON.JSON_Integer
                           then
                              Value.progress :=
                                Float_64 (Reader.Number_Value.Integer_Value);
                           elsif Reader.Number_Value.Kind = VSS.JSON.JSON_Float
                           then
                              Value.progress :=
                                Reader.Number_Value.Float_Value;
                           else
                              Success := False;
                           end if;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  progressToken
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.progressToken := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.progressToken := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.progressToken.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 5      =>
                     --  total
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.total := (Is_Set => True, Value => <>);
                        if Reader.Is_Number_Value then
                           if Reader.Number_Value.Kind = VSS.JSON.JSON_Integer
                           then
                              Value.total.Value :=
                                Float_64 (Reader.Number_Value.Integer_Value);
                           elsif Reader.Number_Value.Kind = VSS.JSON.JSON_Float
                           then
                              Value.total.Value :=
                                Reader.Number_Value.Float_Value;
                           else
                              Success := False;
                           end if;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ProgressNotificationParams;

   package TitledMultiSelectEnumSchema_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["default",
         "description",
         "items",
         "maxItems",
         "minItems",
         "title",
         "type"]);

   package TitledMultiSelectEnumSchema_items_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["anyOf"]);

   procedure Input_TitledMultiSelectEnumSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TitledMultiSelectEnumSchema;
      Success : in out Boolean)
   is
      procedure Input_TitledMultiSelectEnumSchema_items
        (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
         Value   : out TitledMultiSelectEnumSchema_items;
         Success : in out Boolean) is
      begin
         if Success and Reader.Is_Start_Object then
            Reader.Read_Next;
         else
            Success := False;
         end if;

         while Success and not Reader.Is_End_Object loop
            if Reader.Is_Key_Name then
               declare
                  Index : constant Natural :=
                    TitledMultiSelectEnumSchema_items_Minimal_Perfect_Hash
                      .Get_Index (Reader.Key_Name);
               begin

                  case Index is
                     when 1      =>
                        --  anyOf
                        Reader.Read_Next;
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.anyOf, Success);
                        end if;

                     when others =>
                        Value.Additional_Properties.Append
                          ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                        Reader.Read_Next;
                        Input_Any_Value
                          (Reader, Value.Additional_Properties, Success);
                  end case;
               end;
            else
               Success := False;
            end if;
         end loop;

         if Success then
            Reader.Read_Next;  --  skip End_Object

         end if;
      end Input_TitledMultiSelectEnumSchema_items;

   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 TitledMultiSelectEnumSchema_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  default
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.default.Clear;
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : VSS.Strings.Virtual_String;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    if Reader.Is_String_Value then
                                       Item := Reader.String_Value;
                                       Reader.Read_Next;
                                    else
                                       Success := False;
                                    end if;
                                 end if;
                                 Value.default.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  items
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_TitledMultiSelectEnumSchema_items
                          (Reader, Value.items, Success);
                     end if;

                  when 4      =>
                     --  maxItems
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.maxItems := (Is_Set => True, Value => <>);
                        if Reader.Is_Number_Value
                          and then Reader.Number_Value.Kind
                                   = VSS.JSON.JSON_Integer
                        then
                           Value.maxItems.Value :=
                             Reader.Number_Value.Integer_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  minItems
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.minItems := (Is_Set => True, Value => <>);
                        if Reader.Is_Number_Value
                          and then Reader.Number_Value.Kind
                                   = VSS.JSON.JSON_Integer
                        then
                           Value.minItems.Value :=
                             Reader.Number_Value.Integer_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 6      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 7      =>
                     --  type
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "array"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_TitledMultiSelectEnumSchema;

   procedure Input_ContentBlock
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ContentBlock;
      Success : in out Boolean)
   is
      use all type VSS.JSON.Streams.JSON_Stream_Element_Kind;

      Look_Ahead :
        VSS.JSON.Pull_Readers.Buffered.JSON_Buffered_Pull_Reader
          (Reader'Access);

      Variant_Key : constant VSS.Strings.Virtual_String := "type";
   begin
      Look_Ahead.Mark;
      if Success and Look_Ahead.Is_Start_Object then
         Look_Ahead.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Look_Ahead.Is_End_Object loop
         if not Look_Ahead.Is_Key_Name then
            Success := False;
         elsif Look_Ahead.Key_Name /= Variant_Key then
            Look_Ahead.Read_Next;  --  skip the key
            Look_Ahead.Skip_Current_Value;
            Success := not Look_Ahead.Is_End_Object;
         elsif Look_Ahead.Read_Next = String_Value then
            declare
               Index : constant Natural :=
                 ContentBlock_Minimal_Perfect_Hash.Get_Index
                   (Look_Ahead.String_Value);
            begin
               Look_Ahead.Reset;
               Look_Ahead.Unmark;

               case Index is
                  when 1      =>
                     --  text
                     Value.Union := (Kind => Enum.text, others => <>);
                     Input_TextContent (Look_Ahead, Value.Union.text, Success);

                  when 2      =>
                     --  image
                     Value.Union := (Kind => Enum.image, others => <>);
                     Input_ImageContent
                       (Look_Ahead, Value.Union.image, Success);

                  when 3      =>
                     --  audio
                     Value.Union := (Kind => Enum.audio, others => <>);
                     Input_AudioContent
                       (Look_Ahead, Value.Union.audio, Success);

                  when 4      =>
                     --  resource_link
                     Value.Union := (Kind => Enum.resource_link, others => <>);
                     Input_ResourceLink
                       (Look_Ahead, Value.Union.resource_link, Success);

                  when 5      =>
                     --  resource
                     Value.Union := (Kind => Enum.resource, others => <>);
                     Input_EmbeddedResource
                       (Look_Ahead, Value.Union.resource, Success);

                  when others =>
                     Success := False;
               end case;

               return;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Look_Ahead.Read_Next;  --  skip End_Object
         Success := False;
      end if;
   end Input_ContentBlock;

   procedure Input_ClientRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ClientRequest;
      Success : in out Boolean)
   is
      use all type VSS.JSON.Streams.JSON_Stream_Element_Kind;

      Look_Ahead :
        VSS.JSON.Pull_Readers.Buffered.JSON_Buffered_Pull_Reader
          (Reader'Access);

      Variant_Key : constant VSS.Strings.Virtual_String := "method";
   begin
      Look_Ahead.Mark;
      if Success and Look_Ahead.Is_Start_Object then
         Look_Ahead.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Look_Ahead.Is_End_Object loop
         if not Look_Ahead.Is_Key_Name then
            Success := False;
         elsif Look_Ahead.Key_Name /= Variant_Key then
            Look_Ahead.Read_Next;  --  skip the key
            Look_Ahead.Skip_Current_Value;
            Success := not Look_Ahead.Is_End_Object;
         elsif Look_Ahead.Read_Next = String_Value then
            declare
               Index : constant Natural :=
                 ClientRequest_Minimal_Perfect_Hash.Get_Index
                   (Look_Ahead.String_Value);
            begin
               Look_Ahead.Reset;
               Look_Ahead.Unmark;

               case Index is
                  when 1      =>
                     --  server_discover
                     Value.Union :=
                       (Kind => Enum.server_discover, others => <>);
                     Input_DiscoverRequest
                       (Look_Ahead, Value.Union.server_discover, Success);

                  when 2      =>
                     --  resources_list
                     Value.Union :=
                       (Kind => Enum.resources_list, others => <>);
                     Input_ListResourcesRequest
                       (Look_Ahead, Value.Union.resources_list, Success);

                  when 3      =>
                     --  resources_templates_list
                     Value.Union :=
                       (Kind => Enum.resources_templates_list, others => <>);
                     Input_ListResourceTemplatesRequest
                       (Look_Ahead,
                        Value.Union.resources_templates_list,
                        Success);

                  when 4      =>
                     --  resources_read
                     Value.Union :=
                       (Kind => Enum.resources_read, others => <>);
                     Input_ReadResourceRequest
                       (Look_Ahead, Value.Union.resources_read, Success);

                  when 5      =>
                     --  subscriptions_listen
                     Value.Union :=
                       (Kind => Enum.subscriptions_listen, others => <>);
                     Input_SubscriptionsListenRequest
                       (Look_Ahead, Value.Union.subscriptions_listen, Success);

                  when 6      =>
                     --  prompts_list
                     Value.Union := (Kind => Enum.prompts_list, others => <>);
                     Input_ListPromptsRequest
                       (Look_Ahead, Value.Union.prompts_list, Success);

                  when 7      =>
                     --  prompts_get
                     Value.Union := (Kind => Enum.prompts_get, others => <>);
                     Input_GetPromptRequest
                       (Look_Ahead, Value.Union.prompts_get, Success);

                  when 8      =>
                     --  tools_list
                     Value.Union := (Kind => Enum.tools_list, others => <>);
                     Input_ListToolsRequest
                       (Look_Ahead, Value.Union.tools_list, Success);

                  when 9      =>
                     --  tools_call
                     Value.Union := (Kind => Enum.tools_call, others => <>);
                     Input_CallToolRequest
                       (Look_Ahead, Value.Union.tools_call, Success);

                  when 10     =>
                     --  completion_complete
                     Value.Union :=
                       (Kind => Enum.completion_complete, others => <>);
                     Input_CompleteRequest
                       (Look_Ahead, Value.Union.completion_complete, Success);

                  when others =>
                     Success := False;
               end case;

               return;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Look_Ahead.Read_Next;  --  skip End_Object
         Success := False;
      end if;
   end Input_ClientRequest;

   package GetPromptRequest_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["id", "jsonrpc", "method", "params"]);

   procedure Input_GetPromptRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out GetPromptRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 GetPromptRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "prompts/get"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 4      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_GetPromptRequestParams
                          (Reader, Value.params, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_GetPromptRequest;

   package InvalidRequestError_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["code", "data", "message"]);

   procedure Input_InvalidRequestError
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out InvalidRequestError;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 InvalidRequestError_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  code
                     Reader.Read_Next;
                     if Reader.Is_Number_Value
                       and then Reader.Number_Value.String_Value = "-32600"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 2      =>
                     --  data
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.data, Success);
                     end if;

                  when 3      =>
                     --  message
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.message := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_InvalidRequestError;

   package CompleteRequest_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["id", "jsonrpc", "method", "params"]);

   procedure Input_CompleteRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CompleteRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CompleteRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "completion/complete"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 4      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_CompleteRequestParams
                          (Reader, Value.params, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CompleteRequest;

   package ElicitResult_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["action", "content"]);

   procedure Input_ElicitResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitResult;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ElicitResult_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  action
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ElicitResult_action
                          (Reader, Value.action, Success);
                     end if;

                  when 2      =>
                     --  content
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.content, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ElicitResult;

   package InvalidParamsError_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["code", "data", "message"]);

   procedure Input_InvalidParamsError
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out InvalidParamsError;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 InvalidParamsError_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  code
                     Reader.Read_Next;
                     if Reader.Is_Number_Value
                       and then Reader.Number_Value.String_Value = "-32602"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 2      =>
                     --  data
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.data, Success);
                     end if;

                  when 3      =>
                     --  message
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.message := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_InvalidParamsError;

   package Notification_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["method", "params"]);

   procedure Input_Notification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Notification;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 Notification_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.method := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.params, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_Notification;

   package JSONRPCResultResponse_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["id", "jsonrpc", "result"]);

   procedure Input_JSONRPCResultResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out JSONRPCResultResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 JSONRPCResultResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  result
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Result (Reader, Value.result, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_JSONRPCResultResponse;

   package HeaderMismatchError_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["error", "id", "jsonrpc"]);

   procedure Input_HeaderMismatchError
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out HeaderMismatchError;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 HeaderMismatchError_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  error
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.error, Success);
                     end if;

                  when 2      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (Is_Set => True, Value => <>);
                        Value.id.Value := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id.Value := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Value.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 3      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_HeaderMismatchError;

   package TitledSingleSelectEnumSchema_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["default", "description", "oneOf", "title", "type"]);

   procedure Input_TitledSingleSelectEnumSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TitledSingleSelectEnumSchema;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 TitledSingleSelectEnumSchema_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  default
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.default := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  oneOf
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.oneOf, Success);
                     end if;

                  when 4      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  type
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "string"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_TitledSingleSelectEnumSchema;

   package ResourceListChangedNotification_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["jsonrpc", "method", "params"]);

   procedure Input_ResourceListChangedNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResourceListChangedNotification;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ResourceListChangedNotification_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 2      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value
                                = "notifications/resources/list_changed"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.params := (Is_Set => True, Value => <>);
                        Input_NotificationParams
                          (Reader, Value.params.Value, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ResourceListChangedNotification;

   package ToolChoice_Minimal_Perfect_Hash is new MCP.Key_Lookups (["mode"]);

   procedure Input_ToolChoice
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolChoice;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ToolChoice_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  mode
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.mode := (Is_Set => True, Value => <>);
                        Input_ToolChoice_mode
                          (Reader, Value.mode.Value, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ToolChoice;

   package BooleanSchema_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["default", "description", "title", "type"]);

   procedure Input_BooleanSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out BooleanSchema;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 BooleanSchema_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  default
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Boolean_Value then
                           Value.default := Reader.Boolean_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  type
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "boolean"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_BooleanSchema;

   package ToolAnnotations_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["destructiveHint",
         "idempotentHint",
         "openWorldHint",
         "readOnlyHint",
         "title"]);

   procedure Input_ToolAnnotations
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolAnnotations;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ToolAnnotations_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  destructiveHint
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Boolean_Value then
                           Value.destructiveHint := Reader.Boolean_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  idempotentHint
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Boolean_Value then
                           Value.idempotentHint := Reader.Boolean_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  openWorldHint
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Boolean_Value then
                           Value.openWorldHint := Reader.Boolean_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  readOnlyHint
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Boolean_Value then
                           Value.readOnlyHint := Reader.Boolean_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ToolAnnotations;

   package ResourceUpdatedNotificationParams_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "uri"]);

   procedure Input_ResourceUpdatedNotificationParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResourceUpdatedNotificationParams;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ResourceUpdatedNotificationParams_Minimal_Perfect_Hash
                   .Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_NotificationMetaObject
                          (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  uri
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.uri := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ResourceUpdatedNotificationParams;

   package NotificationParams_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta"]);

   procedure Input_NotificationParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out NotificationParams;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 NotificationParams_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_NotificationMetaObject
                          (Reader, Value.meta.Value, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_NotificationParams;

   package SubscriptionsListenResultResponse_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["id", "jsonrpc", "result"]);

   procedure Input_SubscriptionsListenResultResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SubscriptionsListenResultResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SubscriptionsListenResultResponse_Minimal_Perfect_Hash
                   .Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  result
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_SubscriptionsListenResult
                          (Reader, Value.result, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SubscriptionsListenResultResponse;

   package Root_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "name", "uri"]);

   procedure Input_Root
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Root;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 Root_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_MetaObject (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  uri
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.uri := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_Root;

   package CreateMessageRequestParams_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["includeContext",
         "maxTokens",
         "messages",
         "metadata",
         "modelPreferences",
         "stopSequences",
         "systemPrompt",
         "temperature",
         "toolChoice",
         "tools"]);

   procedure Input_CreateMessageRequestParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CreateMessageRequestParams;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CreateMessageRequestParams_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  includeContext
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.includeContext := (Is_Set => True, Value => <>);
                        Input_CreateMessageRequestParams_includeContext
                          (Reader, Value.includeContext.Value, Success);
                     end if;

                  when 2      =>
                     --  maxTokens
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Number_Value
                          and then Reader.Number_Value.Kind
                                   = VSS.JSON.JSON_Integer
                        then
                           Value.maxTokens :=
                             Reader.Number_Value.Integer_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  messages
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.messages.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : SamplingMessage;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_SamplingMessage
                                      (Reader, Item, Success);
                                 end if;
                                 Value.messages.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  metadata
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.metadata := (Is_Set => True, Value => <>);
                        Input_JSONObject
                          (Reader, Value.metadata.Value, Success);
                     end if;

                  when 5      =>
                     --  modelPreferences
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.modelPreferences :=
                          (Is_Set => True, Value => <>);
                        Input_ModelPreferences
                          (Reader, Value.modelPreferences.Value, Success);
                     end if;

                  when 6      =>
                     --  stopSequences
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.stopSequences.Clear;
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : VSS.Strings.Virtual_String;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    if Reader.Is_String_Value then
                                       Item := Reader.String_Value;
                                       Reader.Read_Next;
                                    else
                                       Success := False;
                                    end if;
                                 end if;
                                 Value.stopSequences.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 7      =>
                     --  systemPrompt
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.systemPrompt := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 8      =>
                     --  temperature
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.temperature := (Is_Set => True, Value => <>);
                        if Reader.Is_Number_Value then
                           if Reader.Number_Value.Kind = VSS.JSON.JSON_Integer
                           then
                              Value.temperature.Value :=
                                Float_64 (Reader.Number_Value.Integer_Value);
                           elsif Reader.Number_Value.Kind = VSS.JSON.JSON_Float
                           then
                              Value.temperature.Value :=
                                Reader.Number_Value.Float_Value;
                           else
                              Success := False;
                           end if;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 9      =>
                     --  toolChoice
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.toolChoice := (Is_Set => True, Value => <>);
                        Input_ToolChoice
                          (Reader, Value.toolChoice.Value, Success);
                     end if;

                  when 10     =>
                     --  tools
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.tools.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : Tool;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_Tool (Reader, Item, Success);
                                 end if;
                                 Value.tools.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CreateMessageRequestParams;

   package ElicitRequestFormParams_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["message", "mode", "requestedSchema"]);

   package ElicitRequestFormParams_requestedSchema_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["$schema", "properties", "required", "type"]);

   procedure Input_ElicitRequestFormParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitRequestFormParams;
      Success : in out Boolean)
   is
      procedure Input_ElicitRequestFormParams_requestedSchema
        (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
         Value   : out ElicitRequestFormParams_requestedSchema;
         Success : in out Boolean) is
      begin
         if Success and Reader.Is_Start_Object then
            Reader.Read_Next;
         else
            Success := False;
         end if;

         while Success and not Reader.Is_End_Object loop
            if Reader.Is_Key_Name then
               declare
                  Index : constant Natural :=
                    ElicitRequestFormParams_requestedSchema_Minimal_Perfect_Hash
                      .Get_Index (Reader.Key_Name);
               begin

                  case Index is
                     when 1      =>
                        --  $schema
                        Reader.Read_Next;
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_String_Value then
                              Value.schema := Reader.String_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;

                     when 2      =>
                        --  properties
                        Reader.Read_Next;
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Null_Value then
                              Reader.Read_Next;
                           else
                              Input_Any_Value
                                (Reader, Value.properties, Success);
                           end if;
                        end if;

                     when 3      =>
                        --  required
                        Reader.Read_Next;
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Success and Reader.Is_Start_Array then
                              Reader.Read_Next;
                              Value.required.Clear;
                              while Success and not Reader.Is_End_Array loop
                                 declare
                                    Item : VSS.Strings.Virtual_String;
                                 begin
                                    if Reader.Is_Null_Value then
                                       Reader.Read_Next;
                                    else
                                       if Reader.Is_String_Value then
                                          Item := Reader.String_Value;
                                          Reader.Read_Next;
                                       else
                                          Success := False;
                                       end if;
                                    end if;
                                    Value.required.Append (Item);
                                 end;
                              end loop;
                              if Success then
                                 Reader.Read_Next;  --  skip End_Array

                              end if;
                           else
                              Success := False;
                           end if;
                        end if;

                     when 4      =>
                        --  type
                        Reader.Read_Next;
                        if Reader.Is_String_Value
                          and then Reader.String_Value = "object"
                        then
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;

                     when others =>
                        Value.Additional_Properties.Append
                          ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                        Reader.Read_Next;
                        Input_Any_Value
                          (Reader, Value.Additional_Properties, Success);
                  end case;
               end;
            else
               Success := False;
            end if;
         end loop;

         if Success then
            Reader.Read_Next;  --  skip End_Object

         end if;
      end Input_ElicitRequestFormParams_requestedSchema;

   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ElicitRequestFormParams_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  message
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.message := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  mode
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "form"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  requestedSchema
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ElicitRequestFormParams_requestedSchema
                          (Reader, Value.requestedSchema, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ElicitRequestFormParams;

   package UntitledMultiSelectEnumSchema_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["default",
         "description",
         "items",
         "maxItems",
         "minItems",
         "title",
         "type"]);

   package UntitledMultiSelectEnumSchema_items_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["enum", "type"]);

   procedure Input_UntitledMultiSelectEnumSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out UntitledMultiSelectEnumSchema;
      Success : in out Boolean)
   is
      procedure Input_UntitledMultiSelectEnumSchema_items
        (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
         Value   : out UntitledMultiSelectEnumSchema_items;
         Success : in out Boolean) is
      begin
         if Success and Reader.Is_Start_Object then
            Reader.Read_Next;
         else
            Success := False;
         end if;

         while Success and not Reader.Is_End_Object loop
            if Reader.Is_Key_Name then
               declare
                  Index : constant Natural :=
                    UntitledMultiSelectEnumSchema_items_Minimal_Perfect_Hash
                      .Get_Index (Reader.Key_Name);
               begin

                  case Index is
                     when 1      =>
                        --  enum
                        Reader.Read_Next;
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Success and Reader.Is_Start_Array then
                              Reader.Read_Next;
                              Value.enum.Clear;
                              while Success and not Reader.Is_End_Array loop
                                 declare
                                    Item : VSS.Strings.Virtual_String;
                                 begin
                                    if Reader.Is_Null_Value then
                                       Reader.Read_Next;
                                    else
                                       if Reader.Is_String_Value then
                                          Item := Reader.String_Value;
                                          Reader.Read_Next;
                                       else
                                          Success := False;
                                       end if;
                                    end if;
                                    Value.enum.Append (Item);
                                 end;
                              end loop;
                              if Success then
                                 Reader.Read_Next;  --  skip End_Array

                              end if;
                           else
                              Success := False;
                           end if;
                        end if;

                     when 2      =>
                        --  type
                        Reader.Read_Next;
                        if Reader.Is_String_Value
                          and then Reader.String_Value = "string"
                        then
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;

                     when others =>
                        Value.Additional_Properties.Append
                          ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                        Reader.Read_Next;
                        Input_Any_Value
                          (Reader, Value.Additional_Properties, Success);
                  end case;
               end;
            else
               Success := False;
            end if;
         end loop;

         if Success then
            Reader.Read_Next;  --  skip End_Object

         end if;
      end Input_UntitledMultiSelectEnumSchema_items;

   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 UntitledMultiSelectEnumSchema_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  default
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.default.Clear;
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : VSS.Strings.Virtual_String;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    if Reader.Is_String_Value then
                                       Item := Reader.String_Value;
                                       Reader.Read_Next;
                                    else
                                       Success := False;
                                    end if;
                                 end if;
                                 Value.default.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  items
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_UntitledMultiSelectEnumSchema_items
                          (Reader, Value.items, Success);
                     end if;

                  when 4      =>
                     --  maxItems
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.maxItems := (Is_Set => True, Value => <>);
                        if Reader.Is_Number_Value
                          and then Reader.Number_Value.Kind
                                   = VSS.JSON.JSON_Integer
                        then
                           Value.maxItems.Value :=
                             Reader.Number_Value.Integer_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  minItems
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.minItems := (Is_Set => True, Value => <>);
                        if Reader.Is_Number_Value
                          and then Reader.Number_Value.Kind
                                   = VSS.JSON.JSON_Integer
                        then
                           Value.minItems.Value :=
                             Reader.Number_Value.Integer_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 6      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 7      =>
                     --  type
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "array"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_UntitledMultiSelectEnumSchema;

   package LoggingMessageNotification_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["jsonrpc", "method", "params"]);

   procedure Input_LoggingMessageNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out LoggingMessageNotification;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 LoggingMessageNotification_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 2      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "notifications/message"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_LoggingMessageNotificationParams
                          (Reader, Value.params, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_LoggingMessageNotification;

   package PromptArgument_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["description", "name", "required", "title"]);

   procedure Input_PromptArgument
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PromptArgument;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 PromptArgument_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  required
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Boolean_Value then
                           Value.required := Reader.Boolean_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_PromptArgument;

   package ReadResourceResultResponse_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["id", "jsonrpc", "result"]);

   procedure Input_ReadResourceResultResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ReadResourceResultResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ReadResourceResultResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  result
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.result, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ReadResourceResultResponse;

   package ResourceTemplateReference_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["type", "uri"]);

   procedure Input_ResourceTemplateReference
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResourceTemplateReference;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ResourceTemplateReference_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  type
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "ref/resource"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 2      =>
                     --  uri
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.uri := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ResourceTemplateReference;

   package MethodNotFoundError_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["code", "data", "message"]);

   procedure Input_MethodNotFoundError
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out MethodNotFoundError;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 MethodNotFoundError_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  code
                     Reader.Read_Next;
                     if Reader.Is_Number_Value
                       and then Reader.Number_Value.String_Value = "-32601"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 2      =>
                     --  data
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.data, Success);
                     end if;

                  when 3      =>
                     --  message
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.message := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_MethodNotFoundError;

   package Resource_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["_meta",
         "annotations",
         "description",
         "icons",
         "mimeType",
         "name",
         "size",
         "title",
         "uri"]);

   procedure Input_Resource
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Resource;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 Resource_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_MetaObject (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  annotations
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.annotations := (Is_Set => True, Value => <>);
                        Input_Annotations
                          (Reader, Value.annotations.Value, Success);
                     end if;

                  when 3      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  icons
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.icons.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : Icon;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_Icon (Reader, Item, Success);
                                 end if;
                                 Value.icons.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  mimeType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.mimeType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 6      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 7      =>
                     --  size
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.size := (Is_Set => True, Value => <>);
                        if Reader.Is_Number_Value
                          and then Reader.Number_Value.Kind
                                   = VSS.JSON.JSON_Integer
                        then
                           Value.size.Value :=
                             Reader.Number_Value.Integer_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 8      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 9      =>
                     --  uri
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.uri := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_Resource;

   package ModelPreferences_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["costPriority", "hints", "intelligencePriority", "speedPriority"]);

   procedure Input_ModelPreferences
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ModelPreferences;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ModelPreferences_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  costPriority
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.costPriority := (Is_Set => True, Value => <>);
                        if Reader.Is_Number_Value then
                           if Reader.Number_Value.Kind = VSS.JSON.JSON_Integer
                           then
                              Value.costPriority.Value :=
                                Float_64 (Reader.Number_Value.Integer_Value);
                           elsif Reader.Number_Value.Kind = VSS.JSON.JSON_Float
                           then
                              Value.costPriority.Value :=
                                Reader.Number_Value.Float_Value;
                           else
                              Success := False;
                           end if;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  hints
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.hints.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : ModelHint;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_ModelHint (Reader, Item, Success);
                                 end if;
                                 Value.hints.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  intelligencePriority
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.intelligencePriority :=
                          (Is_Set => True, Value => <>);
                        if Reader.Is_Number_Value then
                           if Reader.Number_Value.Kind = VSS.JSON.JSON_Integer
                           then
                              Value.intelligencePriority.Value :=
                                Float_64 (Reader.Number_Value.Integer_Value);
                           elsif Reader.Number_Value.Kind = VSS.JSON.JSON_Float
                           then
                              Value.intelligencePriority.Value :=
                                Reader.Number_Value.Float_Value;
                           else
                              Success := False;
                           end if;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  speedPriority
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.speedPriority := (Is_Set => True, Value => <>);
                        if Reader.Is_Number_Value then
                           if Reader.Number_Value.Kind = VSS.JSON.JSON_Integer
                           then
                              Value.speedPriority.Value :=
                                Float_64 (Reader.Number_Value.Integer_Value);
                           elsif Reader.Number_Value.Kind = VSS.JSON.JSON_Float
                           then
                              Value.speedPriority.Value :=
                                Reader.Number_Value.Float_Value;
                           else
                              Success := False;
                           end if;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ModelPreferences;

   package ListResourceTemplatesResultResponse_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["id", "jsonrpc", "result"]);

   procedure Input_ListResourceTemplatesResultResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListResourceTemplatesResultResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ListResourceTemplatesResultResponse_Minimal_Perfect_Hash
                   .Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  result
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ListResourceTemplatesResult
                          (Reader, Value.result, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ListResourceTemplatesResultResponse;

   package SubscriptionsAcknowledgedNotification_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["jsonrpc", "method", "params"]);

   procedure Input_SubscriptionsAcknowledgedNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SubscriptionsAcknowledgedNotification;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SubscriptionsAcknowledgedNotification_Minimal_Perfect_Hash
                   .Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 2      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value
                                = "notifications/subscriptions/acknowledged"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_SubscriptionsAcknowledgedNotificationParams
                          (Reader, Value.params, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SubscriptionsAcknowledgedNotification;

   package ListRootsRequest_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["method", "params"]);

   package ListRootsRequest_params_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta"]);

   procedure Input_ListRootsRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListRootsRequest;
      Success : in out Boolean)
   is
      procedure Input_ListRootsRequest_params
        (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
         Value   : out ListRootsRequest_params;
         Success : in out Boolean) is
      begin
         if Success and Reader.Is_Start_Object then
            Reader.Read_Next;
         else
            Success := False;
         end if;

         while Success and not Reader.Is_End_Object loop
            if Reader.Is_Key_Name then
               declare
                  Index : constant Natural :=
                    ListRootsRequest_params_Minimal_Perfect_Hash.Get_Index
                      (Reader.Key_Name);
               begin

                  case Index is
                     when 1      =>
                        --  _meta
                        Reader.Read_Next;
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Value.meta := (Is_Set => True, Value => <>);
                           Input_MetaObject
                             (Reader, Value.meta.Value, Success);
                        end if;

                     when others =>
                        Value.Additional_Properties.Append
                          ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                        Reader.Read_Next;
                        Input_Any_Value
                          (Reader, Value.Additional_Properties, Success);
                  end case;
               end;
            else
               Success := False;
            end if;
         end loop;

         if Success then
            Reader.Read_Next;  --  skip End_Object

         end if;
      end Input_ListRootsRequest_params;

   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ListRootsRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "roots/list"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 2      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.params := (Is_Set => True, Value => <>);
                        Input_ListRootsRequest_params
                          (Reader, Value.params.Value, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ListRootsRequest;

   procedure Input_JSONRPCResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out JSONRPCResponse;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_JSONRPCResponse;

   package GetPromptResult_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "description", "messages", "resultType"]);

   procedure Input_GetPromptResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out GetPromptResult;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 GetPromptResult_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_ResultMetaObject
                          (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  messages
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.messages.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : PromptMessage;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_PromptMessage
                                      (Reader, Item, Success);
                                 end if;
                                 Value.messages.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  resultType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.resultType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_GetPromptResult;

   package UnsupportedProtocolVersionError_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["error", "id", "jsonrpc"]);

   procedure Input_UnsupportedProtocolVersionError
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out UnsupportedProtocolVersionError;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 UnsupportedProtocolVersionError_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  error
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.error, Success);
                     end if;

                  when 2      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (Is_Set => True, Value => <>);
                        Value.id.Value := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id.Value := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Value.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 3      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_UnsupportedProtocolVersionError;

   package CancelledNotificationParams_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "reason", "requestId"]);

   procedure Input_CancelledNotificationParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CancelledNotificationParams;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CancelledNotificationParams_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_NotificationMetaObject
                          (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  reason
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.reason := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  requestId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.requestId := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.requestId := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.requestId.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CancelledNotificationParams;

   package CacheableResult_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "cacheScope", "resultType", "ttlMs"]);

   procedure Input_CacheableResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CacheableResult;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CacheableResult_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_ResultMetaObject
                          (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  cacheScope
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_CacheableResult_cacheScope
                          (Reader, Value.cacheScope, Success);
                     end if;

                  when 3      =>
                     --  resultType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.resultType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  ttlMs
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Number_Value
                          and then Reader.Number_Value.Kind
                                   = VSS.JSON.JSON_Integer
                        then
                           Value.ttlMs := Reader.Number_Value.Integer_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CacheableResult;

   package ResultMetaObject_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["io.modelcontextprotocol/serverInfo"]);

   procedure Input_ResultMetaObject
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResultMetaObject;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ResultMetaObject_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  io.modelcontextprotocol/serverInfo
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.io_modelcontextprotocol_serverInfo :=
                          (Is_Set => True, Value => <>);
                        Input_Implementation
                          (Reader,
                           Value.io_modelcontextprotocol_serverInfo.Value,
                           Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ResultMetaObject;

   package ListPromptsResult_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["_meta",
         "cacheScope",
         "nextCursor",
         "prompts",
         "resultType",
         "ttlMs"]);

   procedure Input_ListPromptsResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListPromptsResult;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ListPromptsResult_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_ResultMetaObject
                          (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  cacheScope
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ListPromptsResult_cacheScope
                          (Reader, Value.cacheScope, Success);
                     end if;

                  when 3      =>
                     --  nextCursor
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.nextCursor := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  prompts
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.prompts.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : Prompt;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_Prompt (Reader, Item, Success);
                                 end if;
                                 Value.prompts.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  resultType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.resultType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 6      =>
                     --  ttlMs
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Number_Value
                          and then Reader.Number_Value.Kind
                                   = VSS.JSON.JSON_Integer
                        then
                           Value.ttlMs := Reader.Number_Value.Integer_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ListPromptsResult;

   package MissingRequiredClientCapabilityError_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["error", "id", "jsonrpc"]);

   procedure Input_MissingRequiredClientCapabilityError
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out MissingRequiredClientCapabilityError;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 MissingRequiredClientCapabilityError_Minimal_Perfect_Hash
                   .Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  error
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.error, Success);
                     end if;

                  when 2      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (Is_Set => True, Value => <>);
                        Value.id.Value := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id.Value := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Value.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 3      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_MissingRequiredClientCapabilityError;

   package PaginatedRequestParams_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["_meta", "cursor"]);

   procedure Input_PaginatedRequestParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PaginatedRequestParams;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 PaginatedRequestParams_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_RequestMetaObject (Reader, Value.meta, Success);
                     end if;

                  when 2      =>
                     --  cursor
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.cursor := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_PaginatedRequestParams;

   package ListToolsResult_Minimal_Perfect_Hash is new
     MCP.Key_Lookups
       (["_meta", "cacheScope", "nextCursor", "resultType", "tools", "ttlMs"]);

   procedure Input_ListToolsResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListToolsResult;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ListToolsResult_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.meta := (Is_Set => True, Value => <>);
                        Input_ResultMetaObject
                          (Reader, Value.meta.Value, Success);
                     end if;

                  when 2      =>
                     --  cacheScope
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ListToolsResult_cacheScope
                          (Reader, Value.cacheScope, Success);
                     end if;

                  when 3      =>
                     --  nextCursor
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.nextCursor := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  resultType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.resultType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  tools
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.tools.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : Tool;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_Tool (Reader, Item, Success);
                                 end if;
                                 Value.tools.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 6      =>
                     --  ttlMs
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Number_Value
                          and then Reader.Number_Value.Kind
                                   = VSS.JSON.JSON_Integer
                        then
                           Value.ttlMs := Reader.Number_Value.Integer_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ListToolsResult;

   package ListToolsRequest_Minimal_Perfect_Hash is new
     MCP.Key_Lookups (["id", "jsonrpc", "method", "params"]);

   procedure Input_ListToolsRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListToolsRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ListToolsRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  jsonrpc
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "2.0"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 3      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_String_Value
                       and then Reader.String_Value = "tools/list"
                     then
                        Reader.Read_Next;
                     else
                        Success := False;
                     end if;

                  when 4      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_PaginatedRequestParams
                          (Reader, Value.params, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ListToolsRequest;

end MCP.Types.Inputs;
