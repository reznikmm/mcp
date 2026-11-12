
--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--
--  Generated from schema/schema.json. See schema/README.md.

with VSS.JSON.Content_Handlers;

package MCP.Types.Outputs is

   procedure Output_StringSchema_format
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.StringSchema_format);

   procedure Output_NumberSchema_type
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.NumberSchema_type);

   procedure Output_ListResourceTemplatesResult_cacheScope
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.ListResourceTemplatesResult_cacheScope);

   procedure Output_Role
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.Role);

   procedure Output_ReadResourceResult_cacheScope
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.ReadResourceResult_cacheScope);

   procedure Output_DiscoverResult_cacheScope
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.DiscoverResult_cacheScope);

   procedure Output_Icon_theme
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.Icon_theme);

   procedure Output_ListResourcesResult_cacheScope
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.ListResourcesResult_cacheScope);

   procedure Output_ElicitResult_action
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.ElicitResult_action);

   procedure Output_ToolChoice_mode
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.ToolChoice_mode);

   procedure Output_CreateMessageRequestParams_includeContext
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.CreateMessageRequestParams_includeContext);

   procedure Output_LoggingLevel
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.LoggingLevel);

   procedure Output_CacheableResult_cacheScope
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.CacheableResult_cacheScope);

   procedure Output_ListPromptsResult_cacheScope
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.ListPromptsResult_cacheScope);

   procedure Output_ListToolsResult_cacheScope
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Enum.ListToolsResult_cacheScope);

   procedure Output_Error
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Error);

   procedure Output_BaseMetadata
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : BaseMetadata);

   procedure Output_ResourceRequestParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResourceRequestParams);

   procedure Output_ElicitRequestParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitRequestParams);

   procedure Output_InputResponseRequestParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : InputResponseRequestParams);

   procedure Output_ToolListChangedNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolListChangedNotification);

   procedure Output_ResourceLink
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResourceLink);

   procedure Output_PaginatedRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PaginatedRequest);

   procedure Output_ImageContent
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ImageContent);

   procedure Output_ParseError
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ParseError);

   procedure Output_ListResourcesResultResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListResourcesResultResponse);

   procedure Output_GetPromptRequestParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : GetPromptRequestParams);

   procedure Output_InputResponses
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : InputResponses);

   procedure Output_SubscriptionsAcknowledgedNotificationParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SubscriptionsAcknowledgedNotificationParams);

   procedure Output_Prompt
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Prompt);

   procedure Output_RequestParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : RequestParams);

   procedure Output_JSONRPCRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : JSONRPCRequest);

   procedure Output_InputRequiredResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : InputRequiredResult);

   procedure Output_PrimitiveSchemaDefinition
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PrimitiveSchemaDefinition);

   procedure Output_SamplingMessageContentBlock
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SamplingMessageContentBlock);

   procedure Output_RequestMetaObject
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : RequestMetaObject);

   procedure Output_TextContent
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TextContent);

   procedure Output_JSONObject
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : JSONObject);

   procedure Output_SubscriptionsListenRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SubscriptionsListenRequest);

   procedure Output_LoggingMessageNotificationParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : LoggingMessageNotificationParams);

   procedure Output_SubscriptionsListenResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SubscriptionsListenResult);

   procedure Output_PromptReference
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PromptReference);

   procedure Output_ListResourceTemplatesRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListResourceTemplatesRequest);

   procedure Output_InputResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : InputResponse);

   procedure Output_InternalError
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : InternalError);

   procedure Output_ServerResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ServerResult);

   procedure Output_TextResourceContents
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TextResourceContents);

   procedure Output_ToolUseContent
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolUseContent);

   procedure Output_ReadResourceRequestParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ReadResourceRequestParams);

   procedure Output_StringSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : StringSchema);

   procedure Output_ServerCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ServerCapabilities);

   procedure Output_InputRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : InputRequest);

   procedure Output_SubscriptionFilter
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SubscriptionFilter);

   procedure Output_Result
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Result);

   procedure Output_CallToolRequestParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CallToolRequestParams);

   procedure Output_ResourceTemplate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResourceTemplate);

   procedure Output_ReadResourceRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ReadResourceRequest);

   procedure Output_SubscriptionsListenResultMetaObject
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SubscriptionsListenResultMetaObject);

   procedure Output_NumberSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : NumberSchema);

   procedure Output_Annotations
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Annotations);

   procedure Output_SamplingMessage
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SamplingMessage);

   procedure Output_PaginatedResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PaginatedResult);

   procedure Output_PromptListChangedNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PromptListChangedNotification);

   procedure Output_CompleteRequestParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CompleteRequestParams);

   procedure Output_ListResourceTemplatesResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListResourceTemplatesResult);

   procedure Output_MultiSelectEnumSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : MultiSelectEnumSchema);

   procedure Output_ListToolsResultResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListToolsResultResponse);

   procedure Output_ToolResultContent
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolResultContent);

   procedure Output_CallToolRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CallToolRequest);

   procedure Output_ResourceContents
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResourceContents);

   procedure Output_CallToolResultResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CallToolResultResponse);

   procedure Output_ClientNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ClientNotification);

   procedure Output_ModelHint
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ModelHint);

   procedure Output_ReadResourceResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ReadResourceResult);

   procedure Output_ElicitRequestURLParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitRequestURLParams);

   procedure Output_SubscriptionsListenRequestParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SubscriptionsListenRequestParams);

   procedure Output_EnumSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : EnumSchema);

   procedure Output_DiscoverRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : DiscoverRequest);

   procedure Output_CreateMessageRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CreateMessageRequest);

   procedure Output_ProgressNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ProgressNotification);

   procedure Output_ListPromptsResultResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListPromptsResultResponse);

   procedure Output_SingleSelectEnumSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SingleSelectEnumSchema);

   procedure Output_PromptMessage
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PromptMessage);

   procedure Output_MetaObject
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : MetaObject);

   procedure Output_ServerNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ServerNotification);

   procedure Output_JSONRPCNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : JSONRPCNotification);

   procedure Output_InputRequests
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : InputRequests);

   procedure Output_ListPromptsRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListPromptsRequest);

   procedure Output_DiscoverResultResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : DiscoverResultResponse);

   procedure Output_ElicitRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitRequest);

   procedure Output_ClientCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ClientCapabilities);

   procedure Output_DiscoverResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : DiscoverResult);

   procedure Output_Request
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Request);

   procedure Output_AudioContent
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AudioContent);

   procedure Output_JSONRPCErrorResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : JSONRPCErrorResponse);

   procedure Output_Implementation
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Implementation);

   procedure Output_Tool
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Tool);

   procedure Output_NotificationMetaObject
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : NotificationMetaObject);

   procedure Output_Icons
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Icons);

   procedure Output_UntitledSingleSelectEnumSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : UntitledSingleSelectEnumSchema);

   procedure Output_Icon
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Icon);

   procedure Output_CancelledNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CancelledNotification);

   procedure Output_CompleteResultResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CompleteResultResponse);

   procedure Output_GetPromptResultResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : GetPromptResultResponse);

   procedure Output_ResourceUpdatedNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResourceUpdatedNotification);

   procedure Output_BlobResourceContents
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : BlobResourceContents);

   procedure Output_LegacyTitledEnumSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : LegacyTitledEnumSchema);

   procedure Output_JSONRPCMessage
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : JSONRPCMessage);

   procedure Output_ListRootsResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListRootsResult);

   procedure Output_ListResourcesRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListResourcesRequest);

   procedure Output_CreateMessageResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CreateMessageResult);

   procedure Output_JSONValue
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : JSONValue);

   procedure Output_CompleteResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CompleteResult);

   procedure Output_EmbeddedResource
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : EmbeddedResource);

   procedure Output_ListResourcesResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListResourcesResult);

   procedure Output_CallToolResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CallToolResult);

   procedure Output_ProgressNotificationParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ProgressNotificationParams);

   procedure Output_TitledMultiSelectEnumSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TitledMultiSelectEnumSchema);

   procedure Output_ContentBlock
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ContentBlock);

   procedure Output_ClientRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ClientRequest);

   procedure Output_GetPromptRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : GetPromptRequest);

   procedure Output_InvalidRequestError
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : InvalidRequestError);

   procedure Output_CompleteRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CompleteRequest);

   procedure Output_ElicitResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitResult);

   procedure Output_InvalidParamsError
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : InvalidParamsError);

   procedure Output_Notification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Notification);

   procedure Output_JSONRPCResultResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : JSONRPCResultResponse);

   procedure Output_HeaderMismatchError
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : HeaderMismatchError);

   procedure Output_TitledSingleSelectEnumSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TitledSingleSelectEnumSchema);

   procedure Output_ResourceListChangedNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResourceListChangedNotification);

   procedure Output_ToolChoice
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolChoice);

   procedure Output_BooleanSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : BooleanSchema);

   procedure Output_ToolAnnotations
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolAnnotations);

   procedure Output_ResourceUpdatedNotificationParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResourceUpdatedNotificationParams);

   procedure Output_NotificationParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : NotificationParams);

   procedure Output_SubscriptionsListenResultResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SubscriptionsListenResultResponse);

   procedure Output_Root
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Root);

   procedure Output_CreateMessageRequestParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CreateMessageRequestParams);

   procedure Output_ElicitRequestFormParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitRequestFormParams);

   procedure Output_UntitledMultiSelectEnumSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : UntitledMultiSelectEnumSchema);

   procedure Output_LoggingMessageNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : LoggingMessageNotification);

   procedure Output_PromptArgument
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PromptArgument);

   procedure Output_ReadResourceResultResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ReadResourceResultResponse);

   procedure Output_ResourceTemplateReference
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResourceTemplateReference);

   procedure Output_MethodNotFoundError
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : MethodNotFoundError);

   procedure Output_Resource
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Resource);

   procedure Output_ModelPreferences
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ModelPreferences);

   procedure Output_ListResourceTemplatesResultResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListResourceTemplatesResultResponse);

   procedure Output_SubscriptionsAcknowledgedNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SubscriptionsAcknowledgedNotification);

   procedure Output_ListRootsRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListRootsRequest);

   procedure Output_JSONRPCResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : JSONRPCResponse);

   procedure Output_GetPromptResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : GetPromptResult);

   procedure Output_UnsupportedProtocolVersionError
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : UnsupportedProtocolVersionError);

   procedure Output_CancelledNotificationParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CancelledNotificationParams);

   procedure Output_CacheableResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CacheableResult);

   procedure Output_ResultMetaObject
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResultMetaObject);

   procedure Output_ListPromptsResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListPromptsResult);

   procedure Output_MissingRequiredClientCapabilityError
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : MissingRequiredClientCapabilityError);

   procedure Output_PaginatedRequestParams
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PaginatedRequestParams);

   procedure Output_ListToolsResult
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListToolsResult);

   procedure Output_ListToolsRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListToolsRequest);

end MCP.Types.Outputs;
