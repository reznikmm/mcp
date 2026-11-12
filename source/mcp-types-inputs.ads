--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--
--  Generated from schema/schema.json. See schema/README.md.

with VSS.JSON.Pull_Readers;

package MCP.Types.Inputs is

   procedure Input_StringSchema_format
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.StringSchema_format;
      Success : in out Boolean);

   procedure Input_NumberSchema_type
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.NumberSchema_type;
      Success : in out Boolean);

   procedure Input_ListResourceTemplatesResult_cacheScope
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.ListResourceTemplatesResult_cacheScope;
      Success : in out Boolean);

   procedure Input_Role
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.Role;
      Success : in out Boolean);

   procedure Input_ReadResourceResult_cacheScope
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.ReadResourceResult_cacheScope;
      Success : in out Boolean);

   procedure Input_DiscoverResult_cacheScope
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.DiscoverResult_cacheScope;
      Success : in out Boolean);

   procedure Input_Icon_theme
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.Icon_theme;
      Success : in out Boolean);

   procedure Input_ListResourcesResult_cacheScope
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.ListResourcesResult_cacheScope;
      Success : in out Boolean);

   procedure Input_ElicitResult_action
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.ElicitResult_action;
      Success : in out Boolean);

   procedure Input_ToolChoice_mode
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.ToolChoice_mode;
      Success : in out Boolean);

   procedure Input_CreateMessageRequestParams_includeContext
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.CreateMessageRequestParams_includeContext;
      Success : in out Boolean);

   procedure Input_LoggingLevel
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.LoggingLevel;
      Success : in out Boolean);

   procedure Input_CacheableResult_cacheScope
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.CacheableResult_cacheScope;
      Success : in out Boolean);

   procedure Input_ListPromptsResult_cacheScope
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.ListPromptsResult_cacheScope;
      Success : in out Boolean);

   procedure Input_ListToolsResult_cacheScope
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Enum.ListToolsResult_cacheScope;
      Success : in out Boolean);

   procedure Input_Error
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Error;
      Success : in out Boolean);

   procedure Input_BaseMetadata
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out BaseMetadata;
      Success : in out Boolean);

   procedure Input_ResourceRequestParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResourceRequestParams;
      Success : in out Boolean);

   procedure Input_ElicitRequestParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitRequestParams;
      Success : in out Boolean);

   procedure Input_InputResponseRequestParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out InputResponseRequestParams;
      Success : in out Boolean);

   procedure Input_ToolListChangedNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolListChangedNotification;
      Success : in out Boolean);

   procedure Input_ResourceLink
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResourceLink;
      Success : in out Boolean);

   procedure Input_PaginatedRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PaginatedRequest;
      Success : in out Boolean);

   procedure Input_ImageContent
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ImageContent;
      Success : in out Boolean);

   procedure Input_ParseError
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ParseError;
      Success : in out Boolean);

   procedure Input_ListResourcesResultResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListResourcesResultResponse;
      Success : in out Boolean);

   procedure Input_GetPromptRequestParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out GetPromptRequestParams;
      Success : in out Boolean);

   procedure Input_InputResponses
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out InputResponses;
      Success : in out Boolean);

   procedure Input_SubscriptionsAcknowledgedNotificationParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SubscriptionsAcknowledgedNotificationParams;
      Success : in out Boolean);

   procedure Input_Prompt
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Prompt;
      Success : in out Boolean);

   procedure Input_RequestParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out RequestParams;
      Success : in out Boolean);

   procedure Input_JSONRPCRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out JSONRPCRequest;
      Success : in out Boolean);

   procedure Input_InputRequiredResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out InputRequiredResult;
      Success : in out Boolean);

   procedure Input_PrimitiveSchemaDefinition
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PrimitiveSchemaDefinition;
      Success : in out Boolean);

   procedure Input_SamplingMessageContentBlock
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SamplingMessageContentBlock;
      Success : in out Boolean);

   procedure Input_RequestMetaObject
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out RequestMetaObject;
      Success : in out Boolean);

   procedure Input_TextContent
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TextContent;
      Success : in out Boolean);

   procedure Input_JSONObject
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out JSONObject;
      Success : in out Boolean);

   procedure Input_SubscriptionsListenRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SubscriptionsListenRequest;
      Success : in out Boolean);

   procedure Input_LoggingMessageNotificationParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out LoggingMessageNotificationParams;
      Success : in out Boolean);

   procedure Input_SubscriptionsListenResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SubscriptionsListenResult;
      Success : in out Boolean);

   procedure Input_PromptReference
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PromptReference;
      Success : in out Boolean);

   procedure Input_ListResourceTemplatesRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListResourceTemplatesRequest;
      Success : in out Boolean);

   procedure Input_InputResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out InputResponse;
      Success : in out Boolean);

   procedure Input_InternalError
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out InternalError;
      Success : in out Boolean);

   procedure Input_ServerResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ServerResult;
      Success : in out Boolean);

   procedure Input_TextResourceContents
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TextResourceContents;
      Success : in out Boolean);

   procedure Input_ToolUseContent
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolUseContent;
      Success : in out Boolean);

   procedure Input_ReadResourceRequestParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ReadResourceRequestParams;
      Success : in out Boolean);

   procedure Input_StringSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out StringSchema;
      Success : in out Boolean);

   procedure Input_ServerCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ServerCapabilities;
      Success : in out Boolean);

   procedure Input_InputRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out InputRequest;
      Success : in out Boolean);

   procedure Input_SubscriptionFilter
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SubscriptionFilter;
      Success : in out Boolean);

   procedure Input_Result
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Result;
      Success : in out Boolean);

   procedure Input_CallToolRequestParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CallToolRequestParams;
      Success : in out Boolean);

   procedure Input_ResourceTemplate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResourceTemplate;
      Success : in out Boolean);

   procedure Input_ReadResourceRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ReadResourceRequest;
      Success : in out Boolean);

   procedure Input_SubscriptionsListenResultMetaObject
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SubscriptionsListenResultMetaObject;
      Success : in out Boolean);

   procedure Input_NumberSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out NumberSchema;
      Success : in out Boolean);

   procedure Input_Annotations
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Annotations;
      Success : in out Boolean);

   procedure Input_SamplingMessage
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SamplingMessage;
      Success : in out Boolean);

   procedure Input_PaginatedResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PaginatedResult;
      Success : in out Boolean);

   procedure Input_PromptListChangedNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PromptListChangedNotification;
      Success : in out Boolean);

   procedure Input_CompleteRequestParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CompleteRequestParams;
      Success : in out Boolean);

   procedure Input_ListResourceTemplatesResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListResourceTemplatesResult;
      Success : in out Boolean);

   procedure Input_MultiSelectEnumSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out MultiSelectEnumSchema;
      Success : in out Boolean);

   procedure Input_ListToolsResultResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListToolsResultResponse;
      Success : in out Boolean);

   procedure Input_ToolResultContent
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolResultContent;
      Success : in out Boolean);

   procedure Input_CallToolRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CallToolRequest;
      Success : in out Boolean);

   procedure Input_ResourceContents
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResourceContents;
      Success : in out Boolean);

   procedure Input_CallToolResultResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CallToolResultResponse;
      Success : in out Boolean);

   procedure Input_ClientNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ClientNotification;
      Success : in out Boolean);

   procedure Input_ModelHint
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ModelHint;
      Success : in out Boolean);

   procedure Input_ReadResourceResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ReadResourceResult;
      Success : in out Boolean);

   procedure Input_ElicitRequestURLParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitRequestURLParams;
      Success : in out Boolean);

   procedure Input_SubscriptionsListenRequestParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SubscriptionsListenRequestParams;
      Success : in out Boolean);

   procedure Input_EnumSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out EnumSchema;
      Success : in out Boolean);

   procedure Input_DiscoverRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out DiscoverRequest;
      Success : in out Boolean);

   procedure Input_CreateMessageRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CreateMessageRequest;
      Success : in out Boolean);

   procedure Input_ProgressNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ProgressNotification;
      Success : in out Boolean);

   procedure Input_ListPromptsResultResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListPromptsResultResponse;
      Success : in out Boolean);

   procedure Input_SingleSelectEnumSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SingleSelectEnumSchema;
      Success : in out Boolean);

   procedure Input_PromptMessage
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PromptMessage;
      Success : in out Boolean);

   procedure Input_MetaObject
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out MetaObject;
      Success : in out Boolean);

   procedure Input_ServerNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ServerNotification;
      Success : in out Boolean);

   procedure Input_JSONRPCNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out JSONRPCNotification;
      Success : in out Boolean);

   procedure Input_InputRequests
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out InputRequests;
      Success : in out Boolean);

   procedure Input_ListPromptsRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListPromptsRequest;
      Success : in out Boolean);

   procedure Input_DiscoverResultResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out DiscoverResultResponse;
      Success : in out Boolean);

   procedure Input_ElicitRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitRequest;
      Success : in out Boolean);

   procedure Input_ClientCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ClientCapabilities;
      Success : in out Boolean);

   procedure Input_DiscoverResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out DiscoverResult;
      Success : in out Boolean);

   procedure Input_Request
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Request;
      Success : in out Boolean);

   procedure Input_AudioContent
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AudioContent;
      Success : in out Boolean);

   procedure Input_JSONRPCErrorResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out JSONRPCErrorResponse;
      Success : in out Boolean);

   procedure Input_Implementation
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Implementation;
      Success : in out Boolean);

   procedure Input_Tool
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Tool;
      Success : in out Boolean);

   procedure Input_NotificationMetaObject
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out NotificationMetaObject;
      Success : in out Boolean);

   procedure Input_Icons
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Icons;
      Success : in out Boolean);

   procedure Input_UntitledSingleSelectEnumSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out UntitledSingleSelectEnumSchema;
      Success : in out Boolean);

   procedure Input_Icon
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Icon;
      Success : in out Boolean);

   procedure Input_CancelledNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CancelledNotification;
      Success : in out Boolean);

   procedure Input_CompleteResultResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CompleteResultResponse;
      Success : in out Boolean);

   procedure Input_GetPromptResultResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out GetPromptResultResponse;
      Success : in out Boolean);

   procedure Input_ResourceUpdatedNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResourceUpdatedNotification;
      Success : in out Boolean);

   procedure Input_BlobResourceContents
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out BlobResourceContents;
      Success : in out Boolean);

   procedure Input_LegacyTitledEnumSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out LegacyTitledEnumSchema;
      Success : in out Boolean);

   procedure Input_JSONRPCMessage
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out JSONRPCMessage;
      Success : in out Boolean);

   procedure Input_ListRootsResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListRootsResult;
      Success : in out Boolean);

   procedure Input_ListResourcesRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListResourcesRequest;
      Success : in out Boolean);

   procedure Input_CreateMessageResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CreateMessageResult;
      Success : in out Boolean);

   procedure Input_JSONValue
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out JSONValue;
      Success : in out Boolean);

   procedure Input_CompleteResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CompleteResult;
      Success : in out Boolean);

   procedure Input_EmbeddedResource
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out EmbeddedResource;
      Success : in out Boolean);

   procedure Input_ListResourcesResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListResourcesResult;
      Success : in out Boolean);

   procedure Input_CallToolResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CallToolResult;
      Success : in out Boolean);

   procedure Input_ProgressNotificationParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ProgressNotificationParams;
      Success : in out Boolean);

   procedure Input_TitledMultiSelectEnumSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TitledMultiSelectEnumSchema;
      Success : in out Boolean);

   procedure Input_ContentBlock
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ContentBlock;
      Success : in out Boolean);

   procedure Input_ClientRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ClientRequest;
      Success : in out Boolean);

   procedure Input_GetPromptRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out GetPromptRequest;
      Success : in out Boolean);

   procedure Input_InvalidRequestError
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out InvalidRequestError;
      Success : in out Boolean);

   procedure Input_CompleteRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CompleteRequest;
      Success : in out Boolean);

   procedure Input_ElicitResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitResult;
      Success : in out Boolean);

   procedure Input_InvalidParamsError
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out InvalidParamsError;
      Success : in out Boolean);

   procedure Input_Notification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Notification;
      Success : in out Boolean);

   procedure Input_JSONRPCResultResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out JSONRPCResultResponse;
      Success : in out Boolean);

   procedure Input_HeaderMismatchError
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out HeaderMismatchError;
      Success : in out Boolean);

   procedure Input_TitledSingleSelectEnumSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TitledSingleSelectEnumSchema;
      Success : in out Boolean);

   procedure Input_ResourceListChangedNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResourceListChangedNotification;
      Success : in out Boolean);

   procedure Input_ToolChoice
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolChoice;
      Success : in out Boolean);

   procedure Input_BooleanSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out BooleanSchema;
      Success : in out Boolean);

   procedure Input_ToolAnnotations
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolAnnotations;
      Success : in out Boolean);

   procedure Input_ResourceUpdatedNotificationParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResourceUpdatedNotificationParams;
      Success : in out Boolean);

   procedure Input_NotificationParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out NotificationParams;
      Success : in out Boolean);

   procedure Input_SubscriptionsListenResultResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SubscriptionsListenResultResponse;
      Success : in out Boolean);

   procedure Input_Root
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Root;
      Success : in out Boolean);

   procedure Input_CreateMessageRequestParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CreateMessageRequestParams;
      Success : in out Boolean);

   procedure Input_ElicitRequestFormParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitRequestFormParams;
      Success : in out Boolean);

   procedure Input_UntitledMultiSelectEnumSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out UntitledMultiSelectEnumSchema;
      Success : in out Boolean);

   procedure Input_LoggingMessageNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out LoggingMessageNotification;
      Success : in out Boolean);

   procedure Input_PromptArgument
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PromptArgument;
      Success : in out Boolean);

   procedure Input_ReadResourceResultResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ReadResourceResultResponse;
      Success : in out Boolean);

   procedure Input_ResourceTemplateReference
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResourceTemplateReference;
      Success : in out Boolean);

   procedure Input_MethodNotFoundError
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out MethodNotFoundError;
      Success : in out Boolean);

   procedure Input_Resource
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Resource;
      Success : in out Boolean);

   procedure Input_ModelPreferences
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ModelPreferences;
      Success : in out Boolean);

   procedure Input_ListResourceTemplatesResultResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListResourceTemplatesResultResponse;
      Success : in out Boolean);

   procedure Input_SubscriptionsAcknowledgedNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SubscriptionsAcknowledgedNotification;
      Success : in out Boolean);

   procedure Input_ListRootsRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListRootsRequest;
      Success : in out Boolean);

   procedure Input_JSONRPCResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out JSONRPCResponse;
      Success : in out Boolean);

   procedure Input_GetPromptResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out GetPromptResult;
      Success : in out Boolean);

   procedure Input_UnsupportedProtocolVersionError
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out UnsupportedProtocolVersionError;
      Success : in out Boolean);

   procedure Input_CancelledNotificationParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CancelledNotificationParams;
      Success : in out Boolean);

   procedure Input_CacheableResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CacheableResult;
      Success : in out Boolean);

   procedure Input_ResultMetaObject
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResultMetaObject;
      Success : in out Boolean);

   procedure Input_ListPromptsResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListPromptsResult;
      Success : in out Boolean);

   procedure Input_MissingRequiredClientCapabilityError
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out MissingRequiredClientCapabilityError;
      Success : in out Boolean);

   procedure Input_PaginatedRequestParams
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PaginatedRequestParams;
      Success : in out Boolean);

   procedure Input_ListToolsResult
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListToolsResult;
      Success : in out Boolean);

   procedure Input_ListToolsRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListToolsRequest;
      Success : in out Boolean);

end MCP.Types.Inputs;
