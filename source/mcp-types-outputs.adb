--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--
--  Generated from schema/schema.json. See schema/README.md.

package body MCP.Types.Outputs is
   pragma Style_Checks (Off);
   use type Integer_64;
   procedure Output_Any_Value
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Any_Value'Class) is
   begin
      for Item of Value loop
         case Item.Kind is
            when VSS.JSON.Streams.Start_Array    =>
               Handler.Start_Array;

            when VSS.JSON.Streams.End_Array      =>
               Handler.End_Array;

            when VSS.JSON.Streams.Start_Object   =>
               Handler.Start_Object;

            when VSS.JSON.Streams.End_Object     =>
               Handler.End_Object;

            when VSS.JSON.Streams.Key_Name       =>
               Handler.Key_Name (Item.Key_Name);

            when VSS.JSON.Streams.String_Value   =>
               Handler.String_Value (Item.String_Value);

            when VSS.JSON.Streams.Number_Value   =>
               Handler.Number_Value (Item.Number_Value);

            when VSS.JSON.Streams.Boolean_Value  =>
               Handler.Boolean_Value (Item.Boolean_Value);

            when VSS.JSON.Streams.Null_Value     =>
               Handler.Null_Value;

            when VSS.JSON.Streams.None           =>
               null;

            when VSS.JSON.Streams.Invalid        =>
               raise Program_Error;

            when VSS.JSON.Streams.Start_Document =>
               raise Program_Error;

            when VSS.JSON.Streams.End_Document   =>
               raise Program_Error;

            when VSS.JSON.Streams.Comment        =>
               raise Program_Error;
         end case;
      end loop;
   end Output_Any_Value;

   procedure Output_StringSchema_format
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.StringSchema_format) is
   begin
      case Value is
         when Enum.date      =>
            Handler.String_Value ("date");

         when Enum.date_time =>
            Handler.String_Value ("date-time");

         when Enum.email     =>
            Handler.String_Value ("email");

         when Enum.uri       =>
            Handler.String_Value ("uri");
      end case;
   end Output_StringSchema_format;

   procedure Output_NumberSchema_type
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.NumberSchema_type) is
   begin
      case Value is
         when Enum.integer =>
            Handler.String_Value ("integer");

         when Enum.number  =>
            Handler.String_Value ("number");
      end case;
   end Output_NumberSchema_type;

   procedure Output_ListResourceTemplatesResult_cacheScope
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.ListResourceTemplatesResult_cacheScope) is
   begin
      case Value is
         when Enum.a_private =>
            Handler.String_Value ("private");

         when Enum.public    =>
            Handler.String_Value ("public");
      end case;
   end Output_ListResourceTemplatesResult_cacheScope;

   procedure Output_Role
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.Role) is
   begin
      case Value is
         when Enum.assistant =>
            Handler.String_Value ("assistant");

         when Enum.user      =>
            Handler.String_Value ("user");
      end case;
   end Output_Role;

   procedure Output_ReadResourceResult_cacheScope
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.ReadResourceResult_cacheScope) is
   begin
      case Value is
         when Enum.a_private =>
            Handler.String_Value ("private");

         when Enum.public    =>
            Handler.String_Value ("public");
      end case;
   end Output_ReadResourceResult_cacheScope;

   procedure Output_DiscoverResult_cacheScope
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.DiscoverResult_cacheScope) is
   begin
      case Value is
         when Enum.a_private =>
            Handler.String_Value ("private");

         when Enum.public    =>
            Handler.String_Value ("public");
      end case;
   end Output_DiscoverResult_cacheScope;

   procedure Output_Icon_theme
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.Icon_theme) is
   begin
      case Value is
         when Enum.dark  =>
            Handler.String_Value ("dark");

         when Enum.light =>
            Handler.String_Value ("light");
      end case;
   end Output_Icon_theme;

   procedure Output_ListResourcesResult_cacheScope
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.ListResourcesResult_cacheScope) is
   begin
      case Value is
         when Enum.a_private =>
            Handler.String_Value ("private");

         when Enum.public    =>
            Handler.String_Value ("public");
      end case;
   end Output_ListResourcesResult_cacheScope;

   procedure Output_ElicitResult_action
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.ElicitResult_action) is
   begin
      case Value is
         when Enum.an_accept =>
            Handler.String_Value ("accept");

         when Enum.cancel    =>
            Handler.String_Value ("cancel");

         when Enum.decline   =>
            Handler.String_Value ("decline");
      end case;
   end Output_ElicitResult_action;

   procedure Output_ToolChoice_mode
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.ToolChoice_mode) is
   begin
      case Value is
         when Enum.auto     =>
            Handler.String_Value ("auto");

         when Enum.none     =>
            Handler.String_Value ("none");

         when Enum.required =>
            Handler.String_Value ("required");
      end case;
   end Output_ToolChoice_mode;

   procedure Output_CreateMessageRequestParams_includeContext
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.CreateMessageRequestParams_includeContext) is
   begin
      case Value is
         when Enum.allServers =>
            Handler.String_Value ("allServers");

         when Enum.none       =>
            Handler.String_Value ("none");

         when Enum.thisServer =>
            Handler.String_Value ("thisServer");
      end case;
   end Output_CreateMessageRequestParams_includeContext;

   procedure Output_LoggingLevel
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.LoggingLevel) is
   begin
      case Value is
         when Enum.alert     =>
            Handler.String_Value ("alert");

         when Enum.critical  =>
            Handler.String_Value ("critical");

         when Enum.debug     =>
            Handler.String_Value ("debug");

         when Enum.emergency =>
            Handler.String_Value ("emergency");

         when Enum.error     =>
            Handler.String_Value ("error");

         when Enum.info      =>
            Handler.String_Value ("info");

         when Enum.notice    =>
            Handler.String_Value ("notice");

         when Enum.warning   =>
            Handler.String_Value ("warning");
      end case;
   end Output_LoggingLevel;

   procedure Output_CacheableResult_cacheScope
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.CacheableResult_cacheScope) is
   begin
      case Value is
         when Enum.a_private =>
            Handler.String_Value ("private");

         when Enum.public    =>
            Handler.String_Value ("public");
      end case;
   end Output_CacheableResult_cacheScope;

   procedure Output_ListPromptsResult_cacheScope
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.ListPromptsResult_cacheScope) is
   begin
      case Value is
         when Enum.a_private =>
            Handler.String_Value ("private");

         when Enum.public    =>
            Handler.String_Value ("public");
      end case;
   end Output_ListPromptsResult_cacheScope;

   procedure Output_ListToolsResult_cacheScope
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.ListToolsResult_cacheScope) is
   begin
      case Value is
         when Enum.a_private =>
            Handler.String_Value ("private");

         when Enum.public    =>
            Handler.String_Value ("public");
      end case;
   end Output_ListToolsResult_cacheScope;

   procedure Output_Error
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Error) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("code");
      Handler.Integer_Value (Value.code);
      if not Value.data.Is_Empty then
         Handler.Key_Name ("data");
         Output_Any_Value (Handler, Value.data);
      end if;
      Handler.Key_Name ("message");
      Handler.String_Value (Value.message);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_Error;

   procedure Output_BaseMetadata
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : BaseMetadata) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_BaseMetadata;

   procedure Output_ResourceRequestParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResourceRequestParams) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("_meta");
      Output_RequestMetaObject (Handler, Value.meta);
      Handler.Key_Name ("uri");
      Handler.String_Value (Value.uri);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ResourceRequestParams;

   procedure Output_ElicitRequestParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitRequestParams) is
   begin
      case Value.Union.Kind is
         when Enum.form =>
            Output_ElicitRequestFormParams (Handler, Value.Union.form);

         when Enum.url  =>
            Output_ElicitRequestURLParams (Handler, Value.Union.url);
      end case;
   end Output_ElicitRequestParams;

   procedure Output_InputResponseRequestParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : InputResponseRequestParams) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("_meta");
      Output_RequestMetaObject (Handler, Value.meta);
      if Value.inputResponses.Is_Set then
         Handler.Key_Name ("inputResponses");
         Output_InputResponses (Handler, Value.inputResponses.Value);
      end if;
      if not Value.requestState.Is_Null then
         Handler.Key_Name ("requestState");
         Handler.String_Value (Value.requestState);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_InputResponseRequestParams;

   procedure Output_ToolListChangedNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolListChangedNotification) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("method");
      Handler.String_Value ("notifications/tools/list_changed");
      if Value.params.Is_Set then
         Handler.Key_Name ("params");
         Output_NotificationParams (Handler, Value.params.Value);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ToolListChangedNotification;

   procedure Output_ResourceLink
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResourceLink) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_MetaObject (Handler, Value.meta.Value);
      end if;
      if Value.annotations.Is_Set then
         Handler.Key_Name ("annotations");
         Output_Annotations (Handler, Value.annotations.Value);
      end if;
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      if not Value.icons.Is_Null then
         Handler.Key_Name ("icons");
         Handler.Start_Array;
         for J in 1 .. Value.icons.Length loop
            Output_Icon (Handler, Value.icons (J));
         end loop;
         Handler.End_Array;
      end if;
      if not Value.mimeType.Is_Null then
         Handler.Key_Name ("mimeType");
         Handler.String_Value (Value.mimeType);
      end if;
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      if Value.size.Is_Set then
         Handler.Key_Name ("size");
         Handler.Integer_Value (Value.size.Value);
      end if;
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      Handler.Key_Name ("type");
      Handler.String_Value ("resource_link");
      Handler.Key_Name ("uri");
      Handler.String_Value (Value.uri);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ResourceLink;

   procedure Output_PaginatedRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PaginatedRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("method");
      Handler.String_Value (Value.method);
      Handler.Key_Name ("params");
      Output_PaginatedRequestParams (Handler, Value.params);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_PaginatedRequest;

   procedure Output_ImageContent
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ImageContent) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_MetaObject (Handler, Value.meta.Value);
      end if;
      if Value.annotations.Is_Set then
         Handler.Key_Name ("annotations");
         Output_Annotations (Handler, Value.annotations.Value);
      end if;
      Handler.Key_Name ("data");
      Handler.String_Value (Value.data);
      Handler.Key_Name ("mimeType");
      Handler.String_Value (Value.mimeType);
      Handler.Key_Name ("type");
      Handler.String_Value ("image");
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ImageContent;

   procedure Output_ParseError
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ParseError) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("code");
      Handler.Integer_Value (-32700);
      if not Value.data.Is_Empty then
         Handler.Key_Name ("data");
         Output_Any_Value (Handler, Value.data);
      end if;
      Handler.Key_Name ("message");
      Handler.String_Value (Value.message);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ParseError;

   procedure Output_ListResourcesResultResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListResourcesResultResponse) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("result");
      Output_ListResourcesResult (Handler, Value.result);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ListResourcesResultResponse;

   procedure Output_GetPromptRequestParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : GetPromptRequestParams) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("_meta");
      Output_RequestMetaObject (Handler, Value.meta);
      if not Value.arguments.Is_Empty then
         Handler.Key_Name ("arguments");
         Output_Any_Value (Handler, Value.arguments);
      end if;
      if Value.inputResponses.Is_Set then
         Handler.Key_Name ("inputResponses");
         Output_InputResponses (Handler, Value.inputResponses.Value);
      end if;
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      if not Value.requestState.Is_Null then
         Handler.Key_Name ("requestState");
         Handler.String_Value (Value.requestState);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_GetPromptRequestParams;

   procedure Output_InputResponses
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : InputResponses) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_InputResponses;

   procedure Output_SubscriptionsAcknowledgedNotificationParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SubscriptionsAcknowledgedNotificationParams) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_NotificationMetaObject (Handler, Value.meta.Value);
      end if;
      Handler.Key_Name ("notifications");
      Output_SubscriptionFilter (Handler, Value.notifications);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SubscriptionsAcknowledgedNotificationParams;

   procedure Output_Prompt
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Prompt) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_MetaObject (Handler, Value.meta.Value);
      end if;
      if not Value.arguments.Is_Null then
         Handler.Key_Name ("arguments");
         Handler.Start_Array;
         for J in 1 .. Value.arguments.Length loop
            Output_PromptArgument (Handler, Value.arguments (J));
         end loop;
         Handler.End_Array;
      end if;
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      if not Value.icons.Is_Null then
         Handler.Key_Name ("icons");
         Handler.Start_Array;
         for J in 1 .. Value.icons.Length loop
            Output_Icon (Handler, Value.icons (J));
         end loop;
         Handler.End_Array;
      end if;
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_Prompt;

   procedure Output_RequestParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : RequestParams) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("_meta");
      Output_RequestMetaObject (Handler, Value.meta);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_RequestParams;

   procedure Output_JSONRPCRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : JSONRPCRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("method");
      Handler.String_Value (Value.method);
      if not Value.params.Is_Empty then
         Handler.Key_Name ("params");
         Output_Any_Value (Handler, Value.params);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_JSONRPCRequest;

   procedure Output_InputRequiredResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : InputRequiredResult) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_ResultMetaObject (Handler, Value.meta.Value);
      end if;
      if Value.inputRequests.Is_Set then
         Handler.Key_Name ("inputRequests");
         Output_InputRequests (Handler, Value.inputRequests.Value);
      end if;
      if not Value.requestState.Is_Null then
         Handler.Key_Name ("requestState");
         Handler.String_Value (Value.requestState);
      end if;
      Handler.Key_Name ("resultType");
      Handler.String_Value (Value.resultType);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_InputRequiredResult;

   procedure Output_PrimitiveSchemaDefinition
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PrimitiveSchemaDefinition) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_PrimitiveSchemaDefinition;

   procedure Output_SamplingMessageContentBlock
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SamplingMessageContentBlock) is
   begin
      case Value.Union.Kind is
         when Enum.text        =>
            Output_TextContent (Handler, Value.Union.text);

         when Enum.image       =>
            Output_ImageContent (Handler, Value.Union.image);

         when Enum.audio       =>
            Output_AudioContent (Handler, Value.Union.audio);

         when Enum.tool_use    =>
            Output_ToolUseContent (Handler, Value.Union.tool_use);

         when Enum.tool_result =>
            Output_ToolResultContent (Handler, Value.Union.tool_result);
      end case;
   end Output_SamplingMessageContentBlock;

   procedure Output_RequestMetaObject
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : RequestMetaObject) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("io.modelcontextprotocol/clientCapabilities");
      Output_ClientCapabilities
        (Handler, Value.io_modelcontextprotocol_clientCapabilities);
      if Value.io_modelcontextprotocol_clientInfo.Is_Set then
         Handler.Key_Name ("io.modelcontextprotocol/clientInfo");
         Output_Implementation
           (Handler, Value.io_modelcontextprotocol_clientInfo.Value);
      end if;
      if Value.io_modelcontextprotocol_logLevel.Is_Set then
         Handler.Key_Name ("io.modelcontextprotocol/logLevel");
         Output_LoggingLevel
           (Handler, Value.io_modelcontextprotocol_logLevel.Value);
      end if;
      Handler.Key_Name ("io.modelcontextprotocol/protocolVersion");
      Handler.String_Value (Value.io_modelcontextprotocol_protocolVersion);
      if Value.progressToken.Is_Set then
         Handler.Key_Name ("progressToken");
         if Value.progressToken.Value.Is_String then
            Handler.String_Value (Value.progressToken.Value.String);
         else
            Handler.Integer_Value (Value.progressToken.Value.Integer);
         end if;
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_RequestMetaObject;

   procedure Output_TextContent
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TextContent) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_MetaObject (Handler, Value.meta.Value);
      end if;
      if Value.annotations.Is_Set then
         Handler.Key_Name ("annotations");
         Output_Annotations (Handler, Value.annotations.Value);
      end if;
      Handler.Key_Name ("text");
      Handler.String_Value (Value.text);
      Handler.Key_Name ("type");
      Handler.String_Value ("text");
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_TextContent;

   procedure Output_JSONObject
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : JSONObject) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_JSONObject;

   procedure Output_SubscriptionsListenRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SubscriptionsListenRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("method");
      Handler.String_Value ("subscriptions/listen");
      Handler.Key_Name ("params");
      Output_SubscriptionsListenRequestParams (Handler, Value.params);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SubscriptionsListenRequest;

   procedure Output_LoggingMessageNotificationParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : LoggingMessageNotificationParams) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_NotificationMetaObject (Handler, Value.meta.Value);
      end if;
      Handler.Key_Name ("data");
      Output_Any_Value (Handler, Value.data);
      Handler.Key_Name ("level");
      Output_LoggingLevel (Handler, Value.level);
      if not Value.logger.Is_Null then
         Handler.Key_Name ("logger");
         Handler.String_Value (Value.logger);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_LoggingMessageNotificationParams;

   procedure Output_SubscriptionsListenResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SubscriptionsListenResult) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("_meta");
      Output_SubscriptionsListenResultMetaObject (Handler, Value.meta);
      Handler.Key_Name ("resultType");
      Handler.String_Value (Value.resultType);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SubscriptionsListenResult;

   procedure Output_PromptReference
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PromptReference) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      Handler.Key_Name ("type");
      Handler.String_Value ("ref/prompt");
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_PromptReference;

   procedure Output_ListResourceTemplatesRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListResourceTemplatesRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("method");
      Handler.String_Value ("resources/templates/list");
      Handler.Key_Name ("params");
      Output_PaginatedRequestParams (Handler, Value.params);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ListResourceTemplatesRequest;

   procedure Output_InputResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : InputResponse) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_InputResponse;

   procedure Output_InternalError
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : InternalError) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("code");
      Handler.Integer_Value (-32603);
      if not Value.data.Is_Empty then
         Handler.Key_Name ("data");
         Output_Any_Value (Handler, Value.data);
      end if;
      Handler.Key_Name ("message");
      Handler.String_Value (Value.message);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_InternalError;

   procedure Output_ServerResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ServerResult) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_ServerResult;

   procedure Output_TextResourceContents
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TextResourceContents) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_MetaObject (Handler, Value.meta.Value);
      end if;
      if not Value.mimeType.Is_Null then
         Handler.Key_Name ("mimeType");
         Handler.String_Value (Value.mimeType);
      end if;
      Handler.Key_Name ("text");
      Handler.String_Value (Value.text);
      Handler.Key_Name ("uri");
      Handler.String_Value (Value.uri);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_TextResourceContents;

   procedure Output_ToolUseContent
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolUseContent) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_MetaObject (Handler, Value.meta.Value);
      end if;
      Handler.Key_Name ("id");
      Handler.String_Value (Value.id);
      Handler.Key_Name ("input");
      Output_Any_Value (Handler, Value.input);
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      Handler.Key_Name ("type");
      Handler.String_Value ("tool_use");
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ToolUseContent;

   procedure Output_ReadResourceRequestParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ReadResourceRequestParams) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("_meta");
      Output_RequestMetaObject (Handler, Value.meta);
      if Value.inputResponses.Is_Set then
         Handler.Key_Name ("inputResponses");
         Output_InputResponses (Handler, Value.inputResponses.Value);
      end if;
      if not Value.requestState.Is_Null then
         Handler.Key_Name ("requestState");
         Handler.String_Value (Value.requestState);
      end if;
      Handler.Key_Name ("uri");
      Handler.String_Value (Value.uri);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ReadResourceRequestParams;

   procedure Output_StringSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : StringSchema) is
   begin
      Handler.Start_Object;
      if not Value.default.Is_Null then
         Handler.Key_Name ("default");
         Handler.String_Value (Value.default);
      end if;
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      if Value.format.Is_Set then
         Handler.Key_Name ("format");
         Output_StringSchema_format (Handler, Value.format.Value);
      end if;
      if Value.maxLength.Is_Set then
         Handler.Key_Name ("maxLength");
         Handler.Integer_Value (Value.maxLength.Value);
      end if;
      if Value.minLength.Is_Set then
         Handler.Key_Name ("minLength");
         Handler.Integer_Value (Value.minLength.Value);
      end if;
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      Handler.Key_Name ("type");
      Handler.String_Value ("string");
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_StringSchema;

   procedure Output_ServerCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ServerCapabilities)
   is
      procedure Output_ServerCapabilities_prompts
        (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
         Value   : ServerCapabilities_prompts) is
      begin
         Handler.Start_Object;
         if Value.listChanged then
            Handler.Key_Name ("listChanged");
            Handler.Boolean_Value (Value.listChanged);
         end if;
         Output_Any_Value (Handler, Value.Additional_Properties);
         Handler.End_Object;
      end Output_ServerCapabilities_prompts;

      procedure Output_ServerCapabilities_resources
        (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
         Value   : ServerCapabilities_resources) is
      begin
         Handler.Start_Object;
         if Value.listChanged then
            Handler.Key_Name ("listChanged");
            Handler.Boolean_Value (Value.listChanged);
         end if;
         if Value.subscribe then
            Handler.Key_Name ("subscribe");
            Handler.Boolean_Value (Value.subscribe);
         end if;
         Output_Any_Value (Handler, Value.Additional_Properties);
         Handler.End_Object;
      end Output_ServerCapabilities_resources;

      procedure Output_ServerCapabilities_tools
        (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
         Value   : ServerCapabilities_tools) is
      begin
         Handler.Start_Object;
         if Value.listChanged then
            Handler.Key_Name ("listChanged");
            Handler.Boolean_Value (Value.listChanged);
         end if;
         Output_Any_Value (Handler, Value.Additional_Properties);
         Handler.End_Object;
      end Output_ServerCapabilities_tools;

   begin
      Handler.Start_Object;
      if Value.completions.Is_Set then
         Handler.Key_Name ("completions");
         Output_JSONObject (Handler, Value.completions.Value);
      end if;
      if not Value.experimental.Is_Empty then
         Handler.Key_Name ("experimental");
         Output_Any_Value (Handler, Value.experimental);
      end if;
      if not Value.extensions.Is_Empty then
         Handler.Key_Name ("extensions");
         Output_Any_Value (Handler, Value.extensions);
      end if;
      if Value.logging.Is_Set then
         Handler.Key_Name ("logging");
         Output_JSONObject (Handler, Value.logging.Value);
      end if;
      if Value.prompts.Is_Set then
         Handler.Key_Name ("prompts");
         Output_ServerCapabilities_prompts (Handler, Value.prompts.Value);
      end if;
      if Value.resources.Is_Set then
         Handler.Key_Name ("resources");
         Output_ServerCapabilities_resources (Handler, Value.resources.Value);
      end if;
      if Value.tools.Is_Set then
         Handler.Key_Name ("tools");
         Output_ServerCapabilities_tools (Handler, Value.tools.Value);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ServerCapabilities;

   procedure Output_InputRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : InputRequest) is
   begin
      case Value.Union.Kind is
         when Enum.sampling_createMessage =>
            Output_CreateMessageRequest
              (Handler, Value.Union.sampling_createMessage);

         when Enum.roots_list             =>
            Output_ListRootsRequest (Handler, Value.Union.roots_list);

         when Enum.elicitation_create     =>
            Output_ElicitRequest (Handler, Value.Union.elicitation_create);
      end case;
   end Output_InputRequest;

   procedure Output_SubscriptionFilter
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SubscriptionFilter) is
   begin
      Handler.Start_Object;
      if Value.promptsListChanged then
         Handler.Key_Name ("promptsListChanged");
         Handler.Boolean_Value (Value.promptsListChanged);
      end if;
      if not Value.resourceSubscriptions.Is_Empty then
         Handler.Key_Name ("resourceSubscriptions");
         Handler.Start_Array;
         for J in 1 .. Value.resourceSubscriptions.Length loop
            Handler.String_Value (Value.resourceSubscriptions (J));
         end loop;
         Handler.End_Array;
      end if;
      if Value.resourcesListChanged then
         Handler.Key_Name ("resourcesListChanged");
         Handler.Boolean_Value (Value.resourcesListChanged);
      end if;
      if Value.toolsListChanged then
         Handler.Key_Name ("toolsListChanged");
         Handler.Boolean_Value (Value.toolsListChanged);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SubscriptionFilter;

   procedure Output_Result
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Result) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_ResultMetaObject (Handler, Value.meta.Value);
      end if;
      Handler.Key_Name ("resultType");
      Handler.String_Value (Value.resultType);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_Result;

   procedure Output_CallToolRequestParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CallToolRequestParams) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("_meta");
      Output_RequestMetaObject (Handler, Value.meta);
      if not Value.arguments.Is_Empty then
         Handler.Key_Name ("arguments");
         Output_Any_Value (Handler, Value.arguments);
      end if;
      if Value.inputResponses.Is_Set then
         Handler.Key_Name ("inputResponses");
         Output_InputResponses (Handler, Value.inputResponses.Value);
      end if;
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      if not Value.requestState.Is_Null then
         Handler.Key_Name ("requestState");
         Handler.String_Value (Value.requestState);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CallToolRequestParams;

   procedure Output_ResourceTemplate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResourceTemplate) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_MetaObject (Handler, Value.meta.Value);
      end if;
      if Value.annotations.Is_Set then
         Handler.Key_Name ("annotations");
         Output_Annotations (Handler, Value.annotations.Value);
      end if;
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      if not Value.icons.Is_Null then
         Handler.Key_Name ("icons");
         Handler.Start_Array;
         for J in 1 .. Value.icons.Length loop
            Output_Icon (Handler, Value.icons (J));
         end loop;
         Handler.End_Array;
      end if;
      if not Value.mimeType.Is_Null then
         Handler.Key_Name ("mimeType");
         Handler.String_Value (Value.mimeType);
      end if;
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      Handler.Key_Name ("uriTemplate");
      Handler.String_Value (Value.uriTemplate);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ResourceTemplate;

   procedure Output_ReadResourceRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ReadResourceRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("method");
      Handler.String_Value ("resources/read");
      Handler.Key_Name ("params");
      Output_ReadResourceRequestParams (Handler, Value.params);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ReadResourceRequest;

   procedure Output_SubscriptionsListenResultMetaObject
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SubscriptionsListenResultMetaObject) is
   begin
      Handler.Start_Object;
      if Value.io_modelcontextprotocol_serverInfo.Is_Set then
         Handler.Key_Name ("io.modelcontextprotocol/serverInfo");
         Output_Implementation
           (Handler, Value.io_modelcontextprotocol_serverInfo.Value);
      end if;
      Handler.Key_Name ("io.modelcontextprotocol/subscriptionId");
      if Value.io_modelcontextprotocol_subscriptionId.Is_String then
         Handler.String_Value
           (Value.io_modelcontextprotocol_subscriptionId.String);
      else
         Handler.Integer_Value
           (Value.io_modelcontextprotocol_subscriptionId.Integer);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SubscriptionsListenResultMetaObject;

   procedure Output_NumberSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : NumberSchema) is
   begin
      Handler.Start_Object;
      if Value.default.Is_Set then
         Handler.Key_Name ("default");
         Handler.Float_Value (Value.default.Value);
      end if;
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      if Value.maximum.Is_Set then
         Handler.Key_Name ("maximum");
         Handler.Float_Value (Value.maximum.Value);
      end if;
      if Value.minimum.Is_Set then
         Handler.Key_Name ("minimum");
         Handler.Float_Value (Value.minimum.Value);
      end if;
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      Handler.Key_Name ("type");
      Output_NumberSchema_type (Handler, Value.a_type);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_NumberSchema;

   procedure Output_Annotations
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Annotations) is
   begin
      Handler.Start_Object;
      if not Value.audience.Is_Null then
         Handler.Key_Name ("audience");
         Handler.Start_Array;
         for J in 1 .. Value.audience.Length loop
            Output_Role (Handler, Value.audience (J));
         end loop;
         Handler.End_Array;
      end if;
      if not Value.lastModified.Is_Null then
         Handler.Key_Name ("lastModified");
         Handler.String_Value (Value.lastModified);
      end if;
      if Value.priority.Is_Set then
         Handler.Key_Name ("priority");
         Handler.Float_Value (Value.priority.Value);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_Annotations;

   procedure Output_SamplingMessage
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SamplingMessage) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_MetaObject (Handler, Value.meta.Value);
      end if;
      Handler.Key_Name ("content");
      Output_Any_Value (Handler, Value.content);
      Handler.Key_Name ("role");
      Output_Role (Handler, Value.role);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SamplingMessage;

   procedure Output_PaginatedResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PaginatedResult) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_ResultMetaObject (Handler, Value.meta.Value);
      end if;
      if not Value.nextCursor.Is_Null then
         Handler.Key_Name ("nextCursor");
         Handler.String_Value (Value.nextCursor);
      end if;
      Handler.Key_Name ("resultType");
      Handler.String_Value (Value.resultType);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_PaginatedResult;

   procedure Output_PromptListChangedNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PromptListChangedNotification) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("method");
      Handler.String_Value ("notifications/prompts/list_changed");
      if Value.params.Is_Set then
         Handler.Key_Name ("params");
         Output_NotificationParams (Handler, Value.params.Value);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_PromptListChangedNotification;

   procedure Output_CompleteRequestParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CompleteRequestParams)
   is
      procedure Output_CompleteRequestParams_argument
        (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
         Value   : CompleteRequestParams_argument) is
      begin
         Handler.Start_Object;
         Handler.Key_Name ("name");
         Handler.String_Value (Value.name);
         Handler.Key_Name ("value");
         Handler.String_Value (Value.value);
         Output_Any_Value (Handler, Value.Additional_Properties);
         Handler.End_Object;
      end Output_CompleteRequestParams_argument;

      procedure Output_CompleteRequestParams_context
        (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
         Value   : CompleteRequestParams_context) is
      begin
         Handler.Start_Object;
         if not Value.arguments.Is_Empty then
            Handler.Key_Name ("arguments");
            Output_Any_Value (Handler, Value.arguments);
         end if;
         Output_Any_Value (Handler, Value.Additional_Properties);
         Handler.End_Object;
      end Output_CompleteRequestParams_context;

   begin
      Handler.Start_Object;
      Handler.Key_Name ("_meta");
      Output_RequestMetaObject (Handler, Value.meta);
      Handler.Key_Name ("argument");
      Output_CompleteRequestParams_argument (Handler, Value.argument);
      if Value.context.Is_Set then
         Handler.Key_Name ("context");
         Output_CompleteRequestParams_context (Handler, Value.context.Value);
      end if;
      Handler.Key_Name ("ref");
      Output_Any_Value (Handler, Value.ref);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CompleteRequestParams;

   procedure Output_ListResourceTemplatesResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListResourceTemplatesResult) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_ResultMetaObject (Handler, Value.meta.Value);
      end if;
      Handler.Key_Name ("cacheScope");
      Output_ListResourceTemplatesResult_cacheScope
        (Handler, Value.cacheScope);
      if not Value.nextCursor.Is_Null then
         Handler.Key_Name ("nextCursor");
         Handler.String_Value (Value.nextCursor);
      end if;
      Handler.Key_Name ("resourceTemplates");
      Handler.Start_Array;
      for J in 1 .. Value.resourceTemplates.Length loop
         Output_ResourceTemplate (Handler, Value.resourceTemplates (J));
      end loop;
      Handler.End_Array;
      Handler.Key_Name ("resultType");
      Handler.String_Value (Value.resultType);
      Handler.Key_Name ("ttlMs");
      Handler.Integer_Value (Value.ttlMs);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ListResourceTemplatesResult;

   procedure Output_MultiSelectEnumSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : MultiSelectEnumSchema) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_MultiSelectEnumSchema;

   procedure Output_ListToolsResultResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListToolsResultResponse) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("result");
      Output_ListToolsResult (Handler, Value.result);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ListToolsResultResponse;

   procedure Output_ToolResultContent
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolResultContent) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_MetaObject (Handler, Value.meta.Value);
      end if;
      Handler.Key_Name ("content");
      Handler.Start_Array;
      for J in 1 .. Value.content.Length loop
         Output_ContentBlock (Handler, Value.content (J));
      end loop;
      Handler.End_Array;
      if Value.isError then
         Handler.Key_Name ("isError");
         Handler.Boolean_Value (Value.isError);
      end if;
      if not Value.structuredContent.Is_Empty then
         Handler.Key_Name ("structuredContent");
         Output_Any_Value (Handler, Value.structuredContent);
      end if;
      Handler.Key_Name ("toolUseId");
      Handler.String_Value (Value.toolUseId);
      Handler.Key_Name ("type");
      Handler.String_Value ("tool_result");
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ToolResultContent;

   procedure Output_CallToolRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CallToolRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("method");
      Handler.String_Value ("tools/call");
      Handler.Key_Name ("params");
      Output_CallToolRequestParams (Handler, Value.params);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CallToolRequest;

   procedure Output_ResourceContents
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResourceContents) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_MetaObject (Handler, Value.meta.Value);
      end if;
      if not Value.mimeType.Is_Null then
         Handler.Key_Name ("mimeType");
         Handler.String_Value (Value.mimeType);
      end if;
      Handler.Key_Name ("uri");
      Handler.String_Value (Value.uri);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ResourceContents;

   procedure Output_CallToolResultResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CallToolResultResponse) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("result");
      Output_Any_Value (Handler, Value.result);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CallToolResultResponse;

   procedure Output_ClientNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ClientNotification) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("method");
      Handler.String_Value ("notifications/cancelled");
      Handler.Key_Name ("params");
      Output_CancelledNotificationParams (Handler, Value.params);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ClientNotification;

   procedure Output_ModelHint
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ModelHint) is
   begin
      Handler.Start_Object;
      if not Value.name.Is_Null then
         Handler.Key_Name ("name");
         Handler.String_Value (Value.name);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ModelHint;

   procedure Output_ReadResourceResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ReadResourceResult) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_ResultMetaObject (Handler, Value.meta.Value);
      end if;
      Handler.Key_Name ("cacheScope");
      Output_ReadResourceResult_cacheScope (Handler, Value.cacheScope);
      Handler.Key_Name ("contents");
      Output_Any_Value (Handler, Value.contents);
      Handler.Key_Name ("resultType");
      Handler.String_Value (Value.resultType);
      Handler.Key_Name ("ttlMs");
      Handler.Integer_Value (Value.ttlMs);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ReadResourceResult;

   procedure Output_ElicitRequestURLParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitRequestURLParams) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("message");
      Handler.String_Value (Value.message);
      Handler.Key_Name ("mode");
      Handler.String_Value ("url");
      Handler.Key_Name ("url");
      Handler.String_Value (Value.url);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ElicitRequestURLParams;

   procedure Output_SubscriptionsListenRequestParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SubscriptionsListenRequestParams) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("_meta");
      Output_RequestMetaObject (Handler, Value.meta);
      Handler.Key_Name ("notifications");
      Output_SubscriptionFilter (Handler, Value.notifications);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SubscriptionsListenRequestParams;

   procedure Output_EnumSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : EnumSchema) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_EnumSchema;

   procedure Output_DiscoverRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : DiscoverRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("method");
      Handler.String_Value ("server/discover");
      Handler.Key_Name ("params");
      Output_RequestParams (Handler, Value.params);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_DiscoverRequest;

   procedure Output_CreateMessageRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CreateMessageRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("method");
      Handler.String_Value ("sampling/createMessage");
      Handler.Key_Name ("params");
      Output_CreateMessageRequestParams (Handler, Value.params);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CreateMessageRequest;

   procedure Output_ProgressNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ProgressNotification) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("method");
      Handler.String_Value ("notifications/progress");
      Handler.Key_Name ("params");
      Output_ProgressNotificationParams (Handler, Value.params);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ProgressNotification;

   procedure Output_ListPromptsResultResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListPromptsResultResponse) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("result");
      Output_ListPromptsResult (Handler, Value.result);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ListPromptsResultResponse;

   procedure Output_SingleSelectEnumSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SingleSelectEnumSchema) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_SingleSelectEnumSchema;

   procedure Output_PromptMessage
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PromptMessage) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("content");
      Output_ContentBlock (Handler, Value.content);
      Handler.Key_Name ("role");
      Output_Role (Handler, Value.role);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_PromptMessage;

   procedure Output_MetaObject
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : MetaObject) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_MetaObject;

   procedure Output_ServerNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ServerNotification) is
   begin
      case Value.Union.Kind is
         when Enum.notifications_cancelled                  =>
            Output_CancelledNotification
              (Handler, Value.Union.notifications_cancelled);

         when Enum.notifications_progress                   =>
            Output_ProgressNotification
              (Handler, Value.Union.notifications_progress);

         when Enum.notifications_resources_list_changed     =>
            Output_ResourceListChangedNotification
              (Handler, Value.Union.notifications_resources_list_changed);

         when Enum.notifications_subscriptions_acknowledged =>
            Output_SubscriptionsAcknowledgedNotification
              (Handler, Value.Union.notifications_subscriptions_acknowledged);

         when Enum.notifications_resources_updated          =>
            Output_ResourceUpdatedNotification
              (Handler, Value.Union.notifications_resources_updated);

         when Enum.notifications_prompts_list_changed       =>
            Output_PromptListChangedNotification
              (Handler, Value.Union.notifications_prompts_list_changed);

         when Enum.notifications_tools_list_changed         =>
            Output_ToolListChangedNotification
              (Handler, Value.Union.notifications_tools_list_changed);

         when Enum.notifications_message                    =>
            Output_LoggingMessageNotification
              (Handler, Value.Union.notifications_message);
      end case;
   end Output_ServerNotification;

   procedure Output_JSONRPCNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : JSONRPCNotification) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("method");
      Handler.String_Value (Value.method);
      if not Value.params.Is_Empty then
         Handler.Key_Name ("params");
         Output_Any_Value (Handler, Value.params);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_JSONRPCNotification;

   procedure Output_InputRequests
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : InputRequests) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_InputRequests;

   procedure Output_ListPromptsRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListPromptsRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("method");
      Handler.String_Value ("prompts/list");
      Handler.Key_Name ("params");
      Output_PaginatedRequestParams (Handler, Value.params);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ListPromptsRequest;

   procedure Output_DiscoverResultResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : DiscoverResultResponse) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("result");
      Output_DiscoverResult (Handler, Value.result);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_DiscoverResultResponse;

   procedure Output_ElicitRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("method");
      Handler.String_Value ("elicitation/create");
      Handler.Key_Name ("params");
      Output_ElicitRequestParams (Handler, Value.params);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ElicitRequest;

   procedure Output_ClientCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ClientCapabilities)
   is
      procedure Output_ClientCapabilities_elicitation
        (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
         Value   : ClientCapabilities_elicitation) is
      begin
         Handler.Start_Object;
         if Value.form.Is_Set then
            Handler.Key_Name ("form");
            Output_JSONObject (Handler, Value.form.Value);
         end if;
         if Value.url.Is_Set then
            Handler.Key_Name ("url");
            Output_JSONObject (Handler, Value.url.Value);
         end if;
         Output_Any_Value (Handler, Value.Additional_Properties);
         Handler.End_Object;
      end Output_ClientCapabilities_elicitation;

      procedure Output_ClientCapabilities_sampling
        (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
         Value   : ClientCapabilities_sampling) is
      begin
         Handler.Start_Object;
         if Value.context.Is_Set then
            Handler.Key_Name ("context");
            Output_JSONObject (Handler, Value.context.Value);
         end if;
         if Value.tools.Is_Set then
            Handler.Key_Name ("tools");
            Output_JSONObject (Handler, Value.tools.Value);
         end if;
         Output_Any_Value (Handler, Value.Additional_Properties);
         Handler.End_Object;
      end Output_ClientCapabilities_sampling;

   begin
      Handler.Start_Object;
      if Value.elicitation.Is_Set then
         Handler.Key_Name ("elicitation");
         Output_ClientCapabilities_elicitation
           (Handler, Value.elicitation.Value);
      end if;
      if not Value.experimental.Is_Empty then
         Handler.Key_Name ("experimental");
         Output_Any_Value (Handler, Value.experimental);
      end if;
      if not Value.extensions.Is_Empty then
         Handler.Key_Name ("extensions");
         Output_Any_Value (Handler, Value.extensions);
      end if;
      if not Value.roots.Is_Empty then
         Handler.Key_Name ("roots");
         Output_Any_Value (Handler, Value.roots);
      end if;
      if Value.sampling.Is_Set then
         Handler.Key_Name ("sampling");
         Output_ClientCapabilities_sampling (Handler, Value.sampling.Value);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ClientCapabilities;

   procedure Output_DiscoverResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : DiscoverResult) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_ResultMetaObject (Handler, Value.meta.Value);
      end if;
      Handler.Key_Name ("cacheScope");
      Output_DiscoverResult_cacheScope (Handler, Value.cacheScope);
      Handler.Key_Name ("capabilities");
      Output_ServerCapabilities (Handler, Value.capabilities);
      if not Value.instructions.Is_Null then
         Handler.Key_Name ("instructions");
         Handler.String_Value (Value.instructions);
      end if;
      Handler.Key_Name ("resultType");
      Handler.String_Value (Value.resultType);
      Handler.Key_Name ("supportedVersions");
      Handler.Start_Array;
      for J in 1 .. Value.supportedVersions.Length loop
         Handler.String_Value (Value.supportedVersions (J));
      end loop;
      Handler.End_Array;
      Handler.Key_Name ("ttlMs");
      Handler.Integer_Value (Value.ttlMs);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_DiscoverResult;

   procedure Output_Request
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Request) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("method");
      Handler.String_Value (Value.method);
      if not Value.params.Is_Empty then
         Handler.Key_Name ("params");
         Output_Any_Value (Handler, Value.params);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_Request;

   procedure Output_AudioContent
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AudioContent) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_MetaObject (Handler, Value.meta.Value);
      end if;
      if Value.annotations.Is_Set then
         Handler.Key_Name ("annotations");
         Output_Annotations (Handler, Value.annotations.Value);
      end if;
      Handler.Key_Name ("data");
      Handler.String_Value (Value.data);
      Handler.Key_Name ("mimeType");
      Handler.String_Value (Value.mimeType);
      Handler.Key_Name ("type");
      Handler.String_Value ("audio");
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_AudioContent;

   procedure Output_JSONRPCErrorResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : JSONRPCErrorResponse) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("error");
      Output_Error (Handler, Value.error);
      if Value.id.Is_Set then
         Handler.Key_Name ("id");
         if Value.id.Value.Is_String then
            Handler.String_Value (Value.id.Value.String);
         else
            Handler.Integer_Value (Value.id.Value.Integer);
         end if;
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_JSONRPCErrorResponse;

   procedure Output_Implementation
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Implementation) is
   begin
      Handler.Start_Object;
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      if not Value.icons.Is_Null then
         Handler.Key_Name ("icons");
         Handler.Start_Array;
         for J in 1 .. Value.icons.Length loop
            Output_Icon (Handler, Value.icons (J));
         end loop;
         Handler.End_Array;
      end if;
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      Handler.Key_Name ("version");
      Handler.String_Value (Value.version);
      if not Value.websiteUrl.Is_Null then
         Handler.Key_Name ("websiteUrl");
         Handler.String_Value (Value.websiteUrl);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_Implementation;

   procedure Output_Tool
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Tool) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_MetaObject (Handler, Value.meta.Value);
      end if;
      if Value.annotations.Is_Set then
         Handler.Key_Name ("annotations");
         Output_ToolAnnotations (Handler, Value.annotations.Value);
      end if;
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      if not Value.icons.Is_Null then
         Handler.Key_Name ("icons");
         Handler.Start_Array;
         for J in 1 .. Value.icons.Length loop
            Output_Icon (Handler, Value.icons (J));
         end loop;
         Handler.End_Array;
      end if;
      Handler.Key_Name ("inputSchema");
      Output_Any_Value (Handler, Value.inputSchema);
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      if not Value.outputSchema.Is_Empty then
         Handler.Key_Name ("outputSchema");
         Output_Any_Value (Handler, Value.outputSchema);
      end if;
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_Tool;

   procedure Output_NotificationMetaObject
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : NotificationMetaObject) is
   begin
      Handler.Start_Object;
      if Value.io_modelcontextprotocol_subscriptionId.Is_Set then
         Handler.Key_Name ("io.modelcontextprotocol/subscriptionId");
         if Value.io_modelcontextprotocol_subscriptionId.Value.Is_String then
            Handler.String_Value
              (Value.io_modelcontextprotocol_subscriptionId.Value.String);
         else
            Handler.Integer_Value
              (Value.io_modelcontextprotocol_subscriptionId.Value.Integer);
         end if;
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_NotificationMetaObject;

   procedure Output_Icons
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Icons) is
   begin
      Handler.Start_Object;
      if not Value.icons.Is_Null then
         Handler.Key_Name ("icons");
         Handler.Start_Array;
         for J in 1 .. Value.icons.Length loop
            Output_Icon (Handler, Value.icons (J));
         end loop;
         Handler.End_Array;
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_Icons;

   procedure Output_UntitledSingleSelectEnumSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : UntitledSingleSelectEnumSchema) is
   begin
      Handler.Start_Object;
      if not Value.default.Is_Null then
         Handler.Key_Name ("default");
         Handler.String_Value (Value.default);
      end if;
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      Handler.Key_Name ("enum");
      Handler.Start_Array;
      for J in 1 .. Value.enum.Length loop
         Handler.String_Value (Value.enum (J));
      end loop;
      Handler.End_Array;
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      Handler.Key_Name ("type");
      Handler.String_Value ("string");
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_UntitledSingleSelectEnumSchema;

   procedure Output_Icon
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Icon) is
   begin
      Handler.Start_Object;
      if not Value.mimeType.Is_Null then
         Handler.Key_Name ("mimeType");
         Handler.String_Value (Value.mimeType);
      end if;
      if not Value.sizes.Is_Empty then
         Handler.Key_Name ("sizes");
         Handler.Start_Array;
         for J in 1 .. Value.sizes.Length loop
            Handler.String_Value (Value.sizes (J));
         end loop;
         Handler.End_Array;
      end if;
      Handler.Key_Name ("src");
      Handler.String_Value (Value.src);
      if Value.theme.Is_Set then
         Handler.Key_Name ("theme");
         Output_Icon_theme (Handler, Value.theme.Value);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_Icon;

   procedure Output_CancelledNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CancelledNotification) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("method");
      Handler.String_Value ("notifications/cancelled");
      Handler.Key_Name ("params");
      Output_CancelledNotificationParams (Handler, Value.params);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CancelledNotification;

   procedure Output_CompleteResultResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CompleteResultResponse) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("result");
      Output_CompleteResult (Handler, Value.result);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CompleteResultResponse;

   procedure Output_GetPromptResultResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : GetPromptResultResponse) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("result");
      Output_Any_Value (Handler, Value.result);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_GetPromptResultResponse;

   procedure Output_ResourceUpdatedNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResourceUpdatedNotification) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("method");
      Handler.String_Value ("notifications/resources/updated");
      Handler.Key_Name ("params");
      Output_ResourceUpdatedNotificationParams (Handler, Value.params);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ResourceUpdatedNotification;

   procedure Output_BlobResourceContents
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : BlobResourceContents) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_MetaObject (Handler, Value.meta.Value);
      end if;
      Handler.Key_Name ("blob");
      Handler.String_Value (Value.blob);
      if not Value.mimeType.Is_Null then
         Handler.Key_Name ("mimeType");
         Handler.String_Value (Value.mimeType);
      end if;
      Handler.Key_Name ("uri");
      Handler.String_Value (Value.uri);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_BlobResourceContents;

   procedure Output_LegacyTitledEnumSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : LegacyTitledEnumSchema) is
   begin
      Handler.Start_Object;
      if not Value.default.Is_Null then
         Handler.Key_Name ("default");
         Handler.String_Value (Value.default);
      end if;
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      Handler.Key_Name ("enum");
      Handler.Start_Array;
      for J in 1 .. Value.enum.Length loop
         Handler.String_Value (Value.enum (J));
      end loop;
      Handler.End_Array;
      if not Value.enumNames.Is_Empty then
         Handler.Key_Name ("enumNames");
         Handler.Start_Array;
         for J in 1 .. Value.enumNames.Length loop
            Handler.String_Value (Value.enumNames (J));
         end loop;
         Handler.End_Array;
      end if;
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      Handler.Key_Name ("type");
      Handler.String_Value ("string");
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_LegacyTitledEnumSchema;

   procedure Output_JSONRPCMessage
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : JSONRPCMessage) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_JSONRPCMessage;

   procedure Output_ListRootsResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListRootsResult) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("roots");
      Handler.Start_Array;
      for J in 1 .. Value.roots.Length loop
         Output_Root (Handler, Value.roots (J));
      end loop;
      Handler.End_Array;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ListRootsResult;

   procedure Output_ListResourcesRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListResourcesRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("method");
      Handler.String_Value ("resources/list");
      Handler.Key_Name ("params");
      Output_PaginatedRequestParams (Handler, Value.params);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ListResourcesRequest;

   procedure Output_CreateMessageResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CreateMessageResult) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_MetaObject (Handler, Value.meta.Value);
      end if;
      Handler.Key_Name ("content");
      Output_Any_Value (Handler, Value.content);
      Handler.Key_Name ("model");
      Handler.String_Value (Value.model);
      Handler.Key_Name ("role");
      Output_Role (Handler, Value.role);
      if not Value.stopReason.Is_Null then
         Handler.Key_Name ("stopReason");
         Handler.String_Value (Value.stopReason);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CreateMessageResult;

   procedure Output_JSONValue
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : JSONValue) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_JSONValue;

   procedure Output_CompleteResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CompleteResult)
   is
      procedure Output_CompleteResult_completion
        (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
         Value   : CompleteResult_completion) is
      begin
         Handler.Start_Object;
         if Value.hasMore then
            Handler.Key_Name ("hasMore");
            Handler.Boolean_Value (Value.hasMore);
         end if;
         if Value.total.Is_Set then
            Handler.Key_Name ("total");
            Handler.Integer_Value (Value.total.Value);
         end if;
         Handler.Key_Name ("values");
         Handler.Start_Array;
         for J in 1 .. Value.values.Length loop
            Handler.String_Value (Value.values (J));
         end loop;
         Handler.End_Array;
         Output_Any_Value (Handler, Value.Additional_Properties);
         Handler.End_Object;
      end Output_CompleteResult_completion;

   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_ResultMetaObject (Handler, Value.meta.Value);
      end if;
      Handler.Key_Name ("completion");
      Output_CompleteResult_completion (Handler, Value.completion);
      Handler.Key_Name ("resultType");
      Handler.String_Value (Value.resultType);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CompleteResult;

   procedure Output_EmbeddedResource
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : EmbeddedResource) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_MetaObject (Handler, Value.meta.Value);
      end if;
      if Value.annotations.Is_Set then
         Handler.Key_Name ("annotations");
         Output_Annotations (Handler, Value.annotations.Value);
      end if;
      Handler.Key_Name ("resource");
      Output_Any_Value (Handler, Value.resource);
      Handler.Key_Name ("type");
      Handler.String_Value ("resource");
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_EmbeddedResource;

   procedure Output_ListResourcesResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListResourcesResult) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_ResultMetaObject (Handler, Value.meta.Value);
      end if;
      Handler.Key_Name ("cacheScope");
      Output_ListResourcesResult_cacheScope (Handler, Value.cacheScope);
      if not Value.nextCursor.Is_Null then
         Handler.Key_Name ("nextCursor");
         Handler.String_Value (Value.nextCursor);
      end if;
      Handler.Key_Name ("resources");
      Handler.Start_Array;
      for J in 1 .. Value.resources.Length loop
         Output_Resource (Handler, Value.resources (J));
      end loop;
      Handler.End_Array;
      Handler.Key_Name ("resultType");
      Handler.String_Value (Value.resultType);
      Handler.Key_Name ("ttlMs");
      Handler.Integer_Value (Value.ttlMs);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ListResourcesResult;

   procedure Output_CallToolResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CallToolResult) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_ResultMetaObject (Handler, Value.meta.Value);
      end if;
      Handler.Key_Name ("content");
      Handler.Start_Array;
      for J in 1 .. Value.content.Length loop
         Output_ContentBlock (Handler, Value.content (J));
      end loop;
      Handler.End_Array;
      if Value.isError then
         Handler.Key_Name ("isError");
         Handler.Boolean_Value (Value.isError);
      end if;
      Handler.Key_Name ("resultType");
      Handler.String_Value (Value.resultType);
      if not Value.structuredContent.Is_Empty then
         Handler.Key_Name ("structuredContent");
         Output_Any_Value (Handler, Value.structuredContent);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CallToolResult;

   procedure Output_ProgressNotificationParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ProgressNotificationParams) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_NotificationMetaObject (Handler, Value.meta.Value);
      end if;
      if not Value.message.Is_Null then
         Handler.Key_Name ("message");
         Handler.String_Value (Value.message);
      end if;
      Handler.Key_Name ("progress");
      Handler.Float_Value (Value.progress);
      Handler.Key_Name ("progressToken");
      if Value.progressToken.Is_String then
         Handler.String_Value (Value.progressToken.String);
      else
         Handler.Integer_Value (Value.progressToken.Integer);
      end if;
      if Value.total.Is_Set then
         Handler.Key_Name ("total");
         Handler.Float_Value (Value.total.Value);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ProgressNotificationParams;

   procedure Output_TitledMultiSelectEnumSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TitledMultiSelectEnumSchema)
   is
      procedure Output_TitledMultiSelectEnumSchema_items
        (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
         Value   : TitledMultiSelectEnumSchema_items) is
      begin
         Handler.Start_Object;
         Handler.Key_Name ("anyOf");
         Output_Any_Value (Handler, Value.anyOf);
         Output_Any_Value (Handler, Value.Additional_Properties);
         Handler.End_Object;
      end Output_TitledMultiSelectEnumSchema_items;

   begin
      Handler.Start_Object;
      if not Value.default.Is_Empty then
         Handler.Key_Name ("default");
         Handler.Start_Array;
         for J in 1 .. Value.default.Length loop
            Handler.String_Value (Value.default (J));
         end loop;
         Handler.End_Array;
      end if;
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      Handler.Key_Name ("items");
      Output_TitledMultiSelectEnumSchema_items (Handler, Value.items);
      if Value.maxItems.Is_Set then
         Handler.Key_Name ("maxItems");
         Handler.Integer_Value (Value.maxItems.Value);
      end if;
      if Value.minItems.Is_Set then
         Handler.Key_Name ("minItems");
         Handler.Integer_Value (Value.minItems.Value);
      end if;
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      Handler.Key_Name ("type");
      Handler.String_Value ("array");
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_TitledMultiSelectEnumSchema;

   procedure Output_ContentBlock
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ContentBlock) is
   begin
      case Value.Union.Kind is
         when Enum.text          =>
            Output_TextContent (Handler, Value.Union.text);

         when Enum.image         =>
            Output_ImageContent (Handler, Value.Union.image);

         when Enum.audio         =>
            Output_AudioContent (Handler, Value.Union.audio);

         when Enum.resource_link =>
            Output_ResourceLink (Handler, Value.Union.resource_link);

         when Enum.resource      =>
            Output_EmbeddedResource (Handler, Value.Union.resource);
      end case;
   end Output_ContentBlock;

   procedure Output_ClientRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ClientRequest) is
   begin
      case Value.Union.Kind is
         when Enum.server_discover          =>
            Output_DiscoverRequest (Handler, Value.Union.server_discover);

         when Enum.resources_list           =>
            Output_ListResourcesRequest (Handler, Value.Union.resources_list);

         when Enum.resources_templates_list =>
            Output_ListResourceTemplatesRequest
              (Handler, Value.Union.resources_templates_list);

         when Enum.resources_read           =>
            Output_ReadResourceRequest (Handler, Value.Union.resources_read);

         when Enum.subscriptions_listen     =>
            Output_SubscriptionsListenRequest
              (Handler, Value.Union.subscriptions_listen);

         when Enum.prompts_list             =>
            Output_ListPromptsRequest (Handler, Value.Union.prompts_list);

         when Enum.prompts_get              =>
            Output_GetPromptRequest (Handler, Value.Union.prompts_get);

         when Enum.tools_list               =>
            Output_ListToolsRequest (Handler, Value.Union.tools_list);

         when Enum.tools_call               =>
            Output_CallToolRequest (Handler, Value.Union.tools_call);

         when Enum.completion_complete      =>
            Output_CompleteRequest (Handler, Value.Union.completion_complete);
      end case;
   end Output_ClientRequest;

   procedure Output_GetPromptRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : GetPromptRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("method");
      Handler.String_Value ("prompts/get");
      Handler.Key_Name ("params");
      Output_GetPromptRequestParams (Handler, Value.params);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_GetPromptRequest;

   procedure Output_InvalidRequestError
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : InvalidRequestError) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("code");
      Handler.Integer_Value (-32600);
      if not Value.data.Is_Empty then
         Handler.Key_Name ("data");
         Output_Any_Value (Handler, Value.data);
      end if;
      Handler.Key_Name ("message");
      Handler.String_Value (Value.message);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_InvalidRequestError;

   procedure Output_CompleteRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CompleteRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("method");
      Handler.String_Value ("completion/complete");
      Handler.Key_Name ("params");
      Output_CompleteRequestParams (Handler, Value.params);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CompleteRequest;

   procedure Output_ElicitResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitResult) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("action");
      Output_ElicitResult_action (Handler, Value.action);
      if not Value.content.Is_Empty then
         Handler.Key_Name ("content");
         Output_Any_Value (Handler, Value.content);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ElicitResult;

   procedure Output_InvalidParamsError
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : InvalidParamsError) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("code");
      Handler.Integer_Value (-32602);
      if not Value.data.Is_Empty then
         Handler.Key_Name ("data");
         Output_Any_Value (Handler, Value.data);
      end if;
      Handler.Key_Name ("message");
      Handler.String_Value (Value.message);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_InvalidParamsError;

   procedure Output_Notification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Notification) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("method");
      Handler.String_Value (Value.method);
      if not Value.params.Is_Empty then
         Handler.Key_Name ("params");
         Output_Any_Value (Handler, Value.params);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_Notification;

   procedure Output_JSONRPCResultResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : JSONRPCResultResponse) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("result");
      Output_Result (Handler, Value.result);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_JSONRPCResultResponse;

   procedure Output_HeaderMismatchError
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : HeaderMismatchError) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("error");
      Output_Any_Value (Handler, Value.error);
      if Value.id.Is_Set then
         Handler.Key_Name ("id");
         if Value.id.Value.Is_String then
            Handler.String_Value (Value.id.Value.String);
         else
            Handler.Integer_Value (Value.id.Value.Integer);
         end if;
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_HeaderMismatchError;

   procedure Output_TitledSingleSelectEnumSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TitledSingleSelectEnumSchema) is
   begin
      Handler.Start_Object;
      if not Value.default.Is_Null then
         Handler.Key_Name ("default");
         Handler.String_Value (Value.default);
      end if;
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      Handler.Key_Name ("oneOf");
      Output_Any_Value (Handler, Value.oneOf);
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      Handler.Key_Name ("type");
      Handler.String_Value ("string");
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_TitledSingleSelectEnumSchema;

   procedure Output_ResourceListChangedNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResourceListChangedNotification) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("method");
      Handler.String_Value ("notifications/resources/list_changed");
      if Value.params.Is_Set then
         Handler.Key_Name ("params");
         Output_NotificationParams (Handler, Value.params.Value);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ResourceListChangedNotification;

   procedure Output_ToolChoice
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolChoice) is
   begin
      Handler.Start_Object;
      if Value.mode.Is_Set then
         Handler.Key_Name ("mode");
         Output_ToolChoice_mode (Handler, Value.mode.Value);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ToolChoice;

   procedure Output_BooleanSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : BooleanSchema) is
   begin
      Handler.Start_Object;
      if Value.default then
         Handler.Key_Name ("default");
         Handler.Boolean_Value (Value.default);
      end if;
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      Handler.Key_Name ("type");
      Handler.String_Value ("boolean");
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_BooleanSchema;

   procedure Output_ToolAnnotations
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolAnnotations) is
   begin
      Handler.Start_Object;
      if Value.destructiveHint then
         Handler.Key_Name ("destructiveHint");
         Handler.Boolean_Value (Value.destructiveHint);
      end if;
      if Value.idempotentHint then
         Handler.Key_Name ("idempotentHint");
         Handler.Boolean_Value (Value.idempotentHint);
      end if;
      if Value.openWorldHint then
         Handler.Key_Name ("openWorldHint");
         Handler.Boolean_Value (Value.openWorldHint);
      end if;
      if Value.readOnlyHint then
         Handler.Key_Name ("readOnlyHint");
         Handler.Boolean_Value (Value.readOnlyHint);
      end if;
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ToolAnnotations;

   procedure Output_ResourceUpdatedNotificationParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResourceUpdatedNotificationParams) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_NotificationMetaObject (Handler, Value.meta.Value);
      end if;
      Handler.Key_Name ("uri");
      Handler.String_Value (Value.uri);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ResourceUpdatedNotificationParams;

   procedure Output_NotificationParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : NotificationParams) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_NotificationMetaObject (Handler, Value.meta.Value);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_NotificationParams;

   procedure Output_SubscriptionsListenResultResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SubscriptionsListenResultResponse) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("result");
      Output_SubscriptionsListenResult (Handler, Value.result);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SubscriptionsListenResultResponse;

   procedure Output_Root
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Root) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_MetaObject (Handler, Value.meta.Value);
      end if;
      if not Value.name.Is_Null then
         Handler.Key_Name ("name");
         Handler.String_Value (Value.name);
      end if;
      Handler.Key_Name ("uri");
      Handler.String_Value (Value.uri);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_Root;

   procedure Output_CreateMessageRequestParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CreateMessageRequestParams) is
   begin
      Handler.Start_Object;
      if Value.includeContext.Is_Set then
         Handler.Key_Name ("includeContext");
         Output_CreateMessageRequestParams_includeContext
           (Handler, Value.includeContext.Value);
      end if;
      Handler.Key_Name ("maxTokens");
      Handler.Integer_Value (Value.maxTokens);
      Handler.Key_Name ("messages");
      Handler.Start_Array;
      for J in 1 .. Value.messages.Length loop
         Output_SamplingMessage (Handler, Value.messages (J));
      end loop;
      Handler.End_Array;
      if Value.metadata.Is_Set then
         Handler.Key_Name ("metadata");
         Output_JSONObject (Handler, Value.metadata.Value);
      end if;
      if Value.modelPreferences.Is_Set then
         Handler.Key_Name ("modelPreferences");
         Output_ModelPreferences (Handler, Value.modelPreferences.Value);
      end if;
      if not Value.stopSequences.Is_Empty then
         Handler.Key_Name ("stopSequences");
         Handler.Start_Array;
         for J in 1 .. Value.stopSequences.Length loop
            Handler.String_Value (Value.stopSequences (J));
         end loop;
         Handler.End_Array;
      end if;
      if not Value.systemPrompt.Is_Null then
         Handler.Key_Name ("systemPrompt");
         Handler.String_Value (Value.systemPrompt);
      end if;
      if Value.temperature.Is_Set then
         Handler.Key_Name ("temperature");
         Handler.Float_Value (Value.temperature.Value);
      end if;
      if Value.toolChoice.Is_Set then
         Handler.Key_Name ("toolChoice");
         Output_ToolChoice (Handler, Value.toolChoice.Value);
      end if;
      if not Value.tools.Is_Null then
         Handler.Key_Name ("tools");
         Handler.Start_Array;
         for J in 1 .. Value.tools.Length loop
            Output_Tool (Handler, Value.tools (J));
         end loop;
         Handler.End_Array;
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CreateMessageRequestParams;

   procedure Output_ElicitRequestFormParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitRequestFormParams)
   is
      procedure Output_ElicitRequestFormParams_requestedSchema
        (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
         Value   : ElicitRequestFormParams_requestedSchema) is
      begin
         Handler.Start_Object;
         if not Value.schema.Is_Null then
            Handler.Key_Name ("$schema");
            Handler.String_Value (Value.schema);
         end if;
         Handler.Key_Name ("properties");
         Output_Any_Value (Handler, Value.properties);
         if not Value.required.Is_Empty then
            Handler.Key_Name ("required");
            Handler.Start_Array;
            for J in 1 .. Value.required.Length loop
               Handler.String_Value (Value.required (J));
            end loop;
            Handler.End_Array;
         end if;
         Handler.Key_Name ("type");
         Handler.String_Value ("object");
         Output_Any_Value (Handler, Value.Additional_Properties);
         Handler.End_Object;
      end Output_ElicitRequestFormParams_requestedSchema;

   begin
      Handler.Start_Object;
      Handler.Key_Name ("message");
      Handler.String_Value (Value.message);
      Handler.Key_Name ("mode");
      Handler.String_Value ("form");
      Handler.Key_Name ("requestedSchema");
      Output_ElicitRequestFormParams_requestedSchema
        (Handler, Value.requestedSchema);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ElicitRequestFormParams;

   procedure Output_UntitledMultiSelectEnumSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : UntitledMultiSelectEnumSchema)
   is
      procedure Output_UntitledMultiSelectEnumSchema_items
        (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
         Value   : UntitledMultiSelectEnumSchema_items) is
      begin
         Handler.Start_Object;
         Handler.Key_Name ("enum");
         Handler.Start_Array;
         for J in 1 .. Value.enum.Length loop
            Handler.String_Value (Value.enum (J));
         end loop;
         Handler.End_Array;
         Handler.Key_Name ("type");
         Handler.String_Value ("string");
         Output_Any_Value (Handler, Value.Additional_Properties);
         Handler.End_Object;
      end Output_UntitledMultiSelectEnumSchema_items;

   begin
      Handler.Start_Object;
      if not Value.default.Is_Empty then
         Handler.Key_Name ("default");
         Handler.Start_Array;
         for J in 1 .. Value.default.Length loop
            Handler.String_Value (Value.default (J));
         end loop;
         Handler.End_Array;
      end if;
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      Handler.Key_Name ("items");
      Output_UntitledMultiSelectEnumSchema_items (Handler, Value.items);
      if Value.maxItems.Is_Set then
         Handler.Key_Name ("maxItems");
         Handler.Integer_Value (Value.maxItems.Value);
      end if;
      if Value.minItems.Is_Set then
         Handler.Key_Name ("minItems");
         Handler.Integer_Value (Value.minItems.Value);
      end if;
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      Handler.Key_Name ("type");
      Handler.String_Value ("array");
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_UntitledMultiSelectEnumSchema;

   procedure Output_LoggingMessageNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : LoggingMessageNotification) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("method");
      Handler.String_Value ("notifications/message");
      Handler.Key_Name ("params");
      Output_LoggingMessageNotificationParams (Handler, Value.params);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_LoggingMessageNotification;

   procedure Output_PromptArgument
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PromptArgument) is
   begin
      Handler.Start_Object;
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      if Value.required then
         Handler.Key_Name ("required");
         Handler.Boolean_Value (Value.required);
      end if;
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_PromptArgument;

   procedure Output_ReadResourceResultResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ReadResourceResultResponse) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("result");
      Output_Any_Value (Handler, Value.result);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ReadResourceResultResponse;

   procedure Output_ResourceTemplateReference
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResourceTemplateReference) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("type");
      Handler.String_Value ("ref/resource");
      Handler.Key_Name ("uri");
      Handler.String_Value (Value.uri);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ResourceTemplateReference;

   procedure Output_MethodNotFoundError
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : MethodNotFoundError) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("code");
      Handler.Integer_Value (-32601);
      if not Value.data.Is_Empty then
         Handler.Key_Name ("data");
         Output_Any_Value (Handler, Value.data);
      end if;
      Handler.Key_Name ("message");
      Handler.String_Value (Value.message);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_MethodNotFoundError;

   procedure Output_Resource
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Resource) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_MetaObject (Handler, Value.meta.Value);
      end if;
      if Value.annotations.Is_Set then
         Handler.Key_Name ("annotations");
         Output_Annotations (Handler, Value.annotations.Value);
      end if;
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      if not Value.icons.Is_Null then
         Handler.Key_Name ("icons");
         Handler.Start_Array;
         for J in 1 .. Value.icons.Length loop
            Output_Icon (Handler, Value.icons (J));
         end loop;
         Handler.End_Array;
      end if;
      if not Value.mimeType.Is_Null then
         Handler.Key_Name ("mimeType");
         Handler.String_Value (Value.mimeType);
      end if;
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      if Value.size.Is_Set then
         Handler.Key_Name ("size");
         Handler.Integer_Value (Value.size.Value);
      end if;
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      Handler.Key_Name ("uri");
      Handler.String_Value (Value.uri);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_Resource;

   procedure Output_ModelPreferences
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ModelPreferences) is
   begin
      Handler.Start_Object;
      if Value.costPriority.Is_Set then
         Handler.Key_Name ("costPriority");
         Handler.Float_Value (Value.costPriority.Value);
      end if;
      if not Value.hints.Is_Null then
         Handler.Key_Name ("hints");
         Handler.Start_Array;
         for J in 1 .. Value.hints.Length loop
            Output_ModelHint (Handler, Value.hints (J));
         end loop;
         Handler.End_Array;
      end if;
      if Value.intelligencePriority.Is_Set then
         Handler.Key_Name ("intelligencePriority");
         Handler.Float_Value (Value.intelligencePriority.Value);
      end if;
      if Value.speedPriority.Is_Set then
         Handler.Key_Name ("speedPriority");
         Handler.Float_Value (Value.speedPriority.Value);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ModelPreferences;

   procedure Output_ListResourceTemplatesResultResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListResourceTemplatesResultResponse) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("result");
      Output_ListResourceTemplatesResult (Handler, Value.result);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ListResourceTemplatesResultResponse;

   procedure Output_SubscriptionsAcknowledgedNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SubscriptionsAcknowledgedNotification) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("method");
      Handler.String_Value ("notifications/subscriptions/acknowledged");
      Handler.Key_Name ("params");
      Output_SubscriptionsAcknowledgedNotificationParams
        (Handler, Value.params);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SubscriptionsAcknowledgedNotification;

   procedure Output_ListRootsRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListRootsRequest)
   is
      procedure Output_ListRootsRequest_params
        (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
         Value   : ListRootsRequest_params) is
      begin
         Handler.Start_Object;
         if Value.meta.Is_Set then
            Handler.Key_Name ("_meta");
            Output_MetaObject (Handler, Value.meta.Value);
         end if;
         Output_Any_Value (Handler, Value.Additional_Properties);
         Handler.End_Object;
      end Output_ListRootsRequest_params;

   begin
      Handler.Start_Object;
      Handler.Key_Name ("method");
      Handler.String_Value ("roots/list");
      if Value.params.Is_Set then
         Handler.Key_Name ("params");
         Output_ListRootsRequest_params (Handler, Value.params.Value);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ListRootsRequest;

   procedure Output_JSONRPCResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : JSONRPCResponse) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_JSONRPCResponse;

   procedure Output_GetPromptResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : GetPromptResult) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_ResultMetaObject (Handler, Value.meta.Value);
      end if;
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      Handler.Key_Name ("messages");
      Handler.Start_Array;
      for J in 1 .. Value.messages.Length loop
         Output_PromptMessage (Handler, Value.messages (J));
      end loop;
      Handler.End_Array;
      Handler.Key_Name ("resultType");
      Handler.String_Value (Value.resultType);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_GetPromptResult;

   procedure Output_UnsupportedProtocolVersionError
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : UnsupportedProtocolVersionError) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("error");
      Output_Any_Value (Handler, Value.error);
      if Value.id.Is_Set then
         Handler.Key_Name ("id");
         if Value.id.Value.Is_String then
            Handler.String_Value (Value.id.Value.String);
         else
            Handler.Integer_Value (Value.id.Value.Integer);
         end if;
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_UnsupportedProtocolVersionError;

   procedure Output_CancelledNotificationParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CancelledNotificationParams) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_NotificationMetaObject (Handler, Value.meta.Value);
      end if;
      if not Value.reason.Is_Null then
         Handler.Key_Name ("reason");
         Handler.String_Value (Value.reason);
      end if;
      Handler.Key_Name ("requestId");
      if Value.requestId.Is_String then
         Handler.String_Value (Value.requestId.String);
      else
         Handler.Integer_Value (Value.requestId.Integer);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CancelledNotificationParams;

   procedure Output_CacheableResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CacheableResult) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_ResultMetaObject (Handler, Value.meta.Value);
      end if;
      Handler.Key_Name ("cacheScope");
      Output_CacheableResult_cacheScope (Handler, Value.cacheScope);
      Handler.Key_Name ("resultType");
      Handler.String_Value (Value.resultType);
      Handler.Key_Name ("ttlMs");
      Handler.Integer_Value (Value.ttlMs);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CacheableResult;

   procedure Output_ResultMetaObject
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResultMetaObject) is
   begin
      Handler.Start_Object;
      if Value.io_modelcontextprotocol_serverInfo.Is_Set then
         Handler.Key_Name ("io.modelcontextprotocol/serverInfo");
         Output_Implementation
           (Handler, Value.io_modelcontextprotocol_serverInfo.Value);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ResultMetaObject;

   procedure Output_ListPromptsResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListPromptsResult) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_ResultMetaObject (Handler, Value.meta.Value);
      end if;
      Handler.Key_Name ("cacheScope");
      Output_ListPromptsResult_cacheScope (Handler, Value.cacheScope);
      if not Value.nextCursor.Is_Null then
         Handler.Key_Name ("nextCursor");
         Handler.String_Value (Value.nextCursor);
      end if;
      Handler.Key_Name ("prompts");
      Handler.Start_Array;
      for J in 1 .. Value.prompts.Length loop
         Output_Prompt (Handler, Value.prompts (J));
      end loop;
      Handler.End_Array;
      Handler.Key_Name ("resultType");
      Handler.String_Value (Value.resultType);
      Handler.Key_Name ("ttlMs");
      Handler.Integer_Value (Value.ttlMs);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ListPromptsResult;

   procedure Output_MissingRequiredClientCapabilityError
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : MissingRequiredClientCapabilityError) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("error");
      Output_Any_Value (Handler, Value.error);
      if Value.id.Is_Set then
         Handler.Key_Name ("id");
         if Value.id.Value.Is_String then
            Handler.String_Value (Value.id.Value.String);
         else
            Handler.Integer_Value (Value.id.Value.Integer);
         end if;
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_MissingRequiredClientCapabilityError;

   procedure Output_PaginatedRequestParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PaginatedRequestParams) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("_meta");
      Output_RequestMetaObject (Handler, Value.meta);
      if not Value.cursor.Is_Null then
         Handler.Key_Name ("cursor");
         Handler.String_Value (Value.cursor);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_PaginatedRequestParams;

   procedure Output_ListToolsResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListToolsResult) is
   begin
      Handler.Start_Object;
      if Value.meta.Is_Set then
         Handler.Key_Name ("_meta");
         Output_ResultMetaObject (Handler, Value.meta.Value);
      end if;
      Handler.Key_Name ("cacheScope");
      Output_ListToolsResult_cacheScope (Handler, Value.cacheScope);
      if not Value.nextCursor.Is_Null then
         Handler.Key_Name ("nextCursor");
         Handler.String_Value (Value.nextCursor);
      end if;
      Handler.Key_Name ("resultType");
      Handler.String_Value (Value.resultType);
      Handler.Key_Name ("tools");
      Handler.Start_Array;
      for J in 1 .. Value.tools.Length loop
         Output_Tool (Handler, Value.tools (J));
      end loop;
      Handler.End_Array;
      Handler.Key_Name ("ttlMs");
      Handler.Integer_Value (Value.ttlMs);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ListToolsResult;

   procedure Output_ListToolsRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListToolsRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("jsonrpc");
      Handler.String_Value ("2.0");
      Handler.Key_Name ("method");
      Handler.String_Value ("tools/list");
      Handler.Key_Name ("params");
      Output_PaginatedRequestParams (Handler, Value.params);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ListToolsRequest;

end MCP.Types.Outputs;
