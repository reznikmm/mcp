--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--
--  Generated from schema/schema.json. See schema/README.md.

pragma Ada_2022;
pragma Style_Checks ("M999");  --  suppress style warning unitl gnatpp is fixed
with Ada.Containers.Doubly_Linked_Lists;
with Ada.Finalization;
with Interfaces;
with VSS.JSON.Streams;
with VSS.Strings;
with VSS.String_Vectors;

package MCP.Types is
   subtype Integer_64 is Interfaces.Integer_64;
   subtype Float_64 is Interfaces.IEEE_Float_64;
   package JSON_Event_Lists is new
     Ada.Containers.Doubly_Linked_Lists
       (VSS.JSON.Streams.JSON_Stream_Element,
        VSS.JSON.Streams."=");

   type Any_Value is new JSON_Event_Lists.List with null record;
   type Any_Object is new Any_Value with null record;

   type Optional_Integer_64 (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : Integer_64;

         when False =>
            null;
      end case;
   end record;

   type Optional_Float_64 (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : Float_64;

         when False =>
            null;
      end case;
   end record;

   type Integer_Or_String (Is_String : Boolean := False) is record
      case Is_String is
         when False =>
            Integer : Integer_64;

         when True =>
            String : VSS.Strings.Virtual_String;
      end case;
   end record;

   type Optional_Integer_Or_String (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : Integer_Or_String;

         when False =>
            null;
      end case;
   end record;

   type ResourceTemplate_Vector is tagged private
   with
     Variable_Indexing => Get_ResourceTemplate_Variable_Reference,
     Constant_Indexing => Get_ResourceTemplate_Constant_Reference,
     Aggregate         => (Empty => Empty, Add_Unnamed => Append);

   type Role_Vector is tagged private
   with
     Variable_Indexing => Get_Role_Variable_Reference,
     Constant_Indexing => Get_Role_Constant_Reference,
     Aggregate         => (Empty => Empty, Add_Unnamed => Append);

   type Tool_Vector is tagged private
   with
     Variable_Indexing => Get_Tool_Variable_Reference,
     Constant_Indexing => Get_Tool_Constant_Reference,
     Aggregate         => (Empty => Empty, Add_Unnamed => Append);

   type Prompt_Vector is tagged private
   with
     Variable_Indexing => Get_Prompt_Variable_Reference,
     Constant_Indexing => Get_Prompt_Constant_Reference,
     Aggregate         => (Empty => Empty, Add_Unnamed => Append);

   type ContentBlock_Vector is tagged private
   with
     Variable_Indexing => Get_ContentBlock_Variable_Reference,
     Constant_Indexing => Get_ContentBlock_Constant_Reference,
     Aggregate         => (Empty => Empty, Add_Unnamed => Append);

   type PromptMessage_Vector is tagged private
   with
     Variable_Indexing => Get_PromptMessage_Variable_Reference,
     Constant_Indexing => Get_PromptMessage_Constant_Reference,
     Aggregate         => (Empty => Empty, Add_Unnamed => Append);

   type Root_Vector is tagged private
   with
     Variable_Indexing => Get_Root_Variable_Reference,
     Constant_Indexing => Get_Root_Constant_Reference,
     Aggregate         => (Empty => Empty, Add_Unnamed => Append);

   type PromptArgument_Vector is tagged private
   with
     Variable_Indexing => Get_PromptArgument_Variable_Reference,
     Constant_Indexing => Get_PromptArgument_Constant_Reference,
     Aggregate         => (Empty => Empty, Add_Unnamed => Append);

   type Icon_Vector is tagged private
   with
     Variable_Indexing => Get_Icon_Variable_Reference,
     Constant_Indexing => Get_Icon_Constant_Reference,
     Aggregate         => (Empty => Empty, Add_Unnamed => Append);

   type Resource_Vector is tagged private
   with
     Variable_Indexing => Get_Resource_Variable_Reference,
     Constant_Indexing => Get_Resource_Constant_Reference,
     Aggregate         => (Empty => Empty, Add_Unnamed => Append);

   type ModelHint_Vector is tagged private
   with
     Variable_Indexing => Get_ModelHint_Variable_Reference,
     Constant_Indexing => Get_ModelHint_Constant_Reference,
     Aggregate         => (Empty => Empty, Add_Unnamed => Append);

   type SamplingMessage_Vector is tagged private
   with
     Variable_Indexing => Get_SamplingMessage_Variable_Reference,
     Constant_Indexing => Get_SamplingMessage_Constant_Reference,
     Aggregate         => (Empty => Empty, Add_Unnamed => Append);

   type Integer_64_Vector is tagged private
   with
     Variable_Indexing => Get_Integer_64_Variable_Reference,
     Constant_Indexing => Get_Integer_64_Constant_Reference,
     Aggregate         => (Empty => Empty, Add_Unnamed => Append);

   package Enum is

      type StringSchema_format is (date, date_time, email, uri);

      type Optional_StringSchema_format (Is_Set : Boolean := False) is record
         case Is_Set is
            when True =>
               Value : StringSchema_format;

            when False =>
               null;
         end case;
      end record;

      type NumberSchema_type is (integer, number);

      type ListResourceTemplatesResult_cacheScope is (a_private, public);

      type Role is (assistant, user);

      type ReadResourceResult_cacheScope is (a_private, public);

      type DiscoverResult_cacheScope is (a_private, public);

      type Icon_theme is (dark, light);

      type Optional_Icon_theme (Is_Set : Boolean := False) is record
         case Is_Set is
            when True =>
               Value : Icon_theme;

            when False =>
               null;
         end case;
      end record;

      type ListResourcesResult_cacheScope is (a_private, public);

      type ElicitResult_action is (an_accept, cancel, decline);

      type ToolChoice_mode is (auto, none, required);

      type Optional_ToolChoice_mode (Is_Set : Boolean := False) is record
         case Is_Set is
            when True =>
               Value : ToolChoice_mode;

            when False =>
               null;
         end case;
      end record;

      type CreateMessageRequestParams_includeContext is
        (allServers, none, thisServer);

      type Optional_CreateMessageRequestParams_includeContext
        (Is_Set : Boolean := False)
      is record
         case Is_Set is
            when True =>
               Value : CreateMessageRequestParams_includeContext;

            when False =>
               null;
         end case;
      end record;

      type LoggingLevel is
        (alert, critical, debug, emergency, error, info, notice, warning);

      type Optional_LoggingLevel (Is_Set : Boolean := False) is record
         case Is_Set is
            when True =>
               Value : LoggingLevel;

            when False =>
               null;
         end case;
      end record;

      type CacheableResult_cacheScope is (a_private, public);

      type ListPromptsResult_cacheScope is (a_private, public);

      type ListToolsResult_cacheScope is (a_private, public);

      type ElicitRequestParams_Variant is (form, url);

      type SamplingMessageContentBlock_Variant is
        (text, image, audio, tool_use, tool_result);

      type InputRequest_Variant is
        (sampling_createMessage, roots_list, elicitation_create);

      type CompleteRequestParams_ref_Variant is (ref_prompt, ref_resource);

      type ServerNotification_Variant is
        (notifications_cancelled,
         notifications_progress,
         notifications_resources_list_changed,
         notifications_subscriptions_acknowledged,
         notifications_resources_updated,
         notifications_prompts_list_changed,
         notifications_tools_list_changed,
         notifications_message);

      type ContentBlock_Variant is
        (text, image, audio, resource_link, resource);

      type ClientRequest_Variant is
        (server_discover,
         resources_list,
         resources_templates_list,
         resources_read,
         subscriptions_listen,
         prompts_list,
         prompts_get,
         tools_list,
         tools_call,
         completion_complete);

   end Enum;

   type Error is record
      code                  : Integer_64;
      --  The error type that occurred.
      data                  : Any_Value;
      --  Additional information about the error. The value of this member is defined by the sender (e.g. detailed error information, nested errors etc.).
      message               : VSS.Strings.Virtual_String;
      --  A short description of the error. The message SHOULD be limited to a concise single sentence.
      Additional_Properties : Any_Object;
   end record;

   type BaseMetadata is record
      name                  : VSS.Strings.Virtual_String;
      --  Intended for programmatic or logical use, but used as a display name in past specs or fallback (if title isn't present).
      title                 : VSS.Strings.Virtual_String;
      --  Intended for UI and end-user contexts — optimized to be human-readable and easily understood,
      --  even by those unfamiliar with domain-specific terminology.
      --
      --  If not provided, the name should be used for display (except for {@link Tool},
      --  where `annotations.title` should be given precedence over using `name`,
      --  if present).
      Additional_Properties : Any_Object;
   end record;

   type JSONObject is new Any_Object with null record;
   type Optional_JSONObject (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : JSONObject;

         when False =>
            null;
      end case;
   end record;

   type ClientCapabilities_elicitation is record
      form                  : Optional_JSONObject;
      url                   : Optional_JSONObject;
      Additional_Properties : Any_Object;
   end record;

   type Optional_ClientCapabilities_elicitation (Is_Set : Boolean := False) is
   record
      case Is_Set is
         when True =>
            Value : ClientCapabilities_elicitation;

         when False =>
            null;
      end case;
   end record;

   type ClientCapabilities_sampling is record
      context               : Optional_JSONObject;
      --  Whether the client supports context inclusion via `includeContext` parameter.
      --  If not declared, servers SHOULD only use `includeContext: "none"` (or omit it).
      tools                 : Optional_JSONObject;
      --  Whether the client supports tool use via `tools` and `toolChoice` parameters.
      Additional_Properties : Any_Object;
   end record;

   type Optional_ClientCapabilities_sampling (Is_Set : Boolean := False) is
   record
      case Is_Set is
         when True =>
            Value : ClientCapabilities_sampling;

         when False =>
            null;
      end case;
   end record;

   type ClientCapabilities is record
      elicitation           : Optional_ClientCapabilities_elicitation;
      --  Present if the client supports elicitation from the server.
      experimental          : Any_Object;
      --  Experimental, non-standard capabilities that the client supports.
      extensions            : Any_Object;
      --  Optional MCP extensions that the client supports. Keys are extension identifiers
      --  (e.g., "io.modelcontextprotocol/oauth-client-credentials"), and values are
      --  per-extension settings objects. An empty object indicates support with no settings.
      --
      --  Keys MUST follow the {@link MetaObject`_meta` key naming rules}, with a
      --  mandatory prefix.
      roots                 : Any_Object;
      --  Present if the client supports listing roots.
      sampling              : Optional_ClientCapabilities_sampling;
      --  Present if the client supports sampling from an LLM.
      Additional_Properties : Any_Object;
   end record;

   type Implementation is record
      description           : VSS.Strings.Virtual_String;
      --  An optional human-readable description of what this implementation does.
      --
      --  This can be used by clients or servers to provide context about their purpose
      --  and capabilities. For example, a server might describe the types of resources
      --  or tools it provides, while a client might describe its intended use case.
      icons                 : Icon_Vector;
      --  Optional set of sized icons that the client can display in a user interface.
      --
      --  Clients that support rendering icons MUST support at least the following MIME types:
      --  - `image/png` - PNG images (safe, universal compatibility)
      --  - `image/jpeg` (and `image/jpg`) - JPEG images (safe, universal compatibility)
      --
      --  Clients that support rendering icons SHOULD also support:
      --  - `image/svg+xml` - SVG images (scalable but requires security precautions)
      --  - `image/webp` - WebP images (modern, efficient format)
      name                  : VSS.Strings.Virtual_String;
      --  Intended for programmatic or logical use, but used as a display name in past specs or fallback (if title isn't present).
      title                 : VSS.Strings.Virtual_String;
      --  Intended for UI and end-user contexts — optimized to be human-readable and easily understood,
      --  even by those unfamiliar with domain-specific terminology.
      --
      --  If not provided, the name should be used for display (except for {@link Tool},
      --  where `annotations.title` should be given precedence over using `name`,
      --  if present).
      version               : VSS.Strings.Virtual_String;
      --  The version of this implementation.
      websiteUrl            : VSS.Strings.Virtual_String;
      --  An optional URL of the website for this implementation.
      Additional_Properties : Any_Object;
   end record;

   type Optional_Implementation (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : Implementation;

         when False =>
            null;
      end case;
   end record;

   --  Left:#/$defs/ProgressToken
   type RequestMetaObject is record
      io_modelcontextprotocol_clientCapabilities : ClientCapabilities;
      --  The client's capabilities for this specific request. Required.
      --
      --  Capabilities are declared per-request rather than once at initialization;
      --  an empty object means the client supports no optional capabilities.
      --  Servers MUST NOT infer capabilities from prior requests.
      io_modelcontextprotocol_clientInfo         : Optional_Implementation;
      --  Identifies the client software making the request. Clients SHOULD
      --  include this field on every request unless specifically configured not
      --  to do so.
      --
      --  The {@link Implementation} schema requires `name` and `version`; other
      --  fields are optional.
      --
      --  The value is self-reported by the client and is not verified by the
      --  protocol. It is intended for display, logging, and debugging. Servers
      --  SHOULD NOT use it to change their behavior, and SHOULD NOT rely on it for
      --  security decisions.
      io_modelcontextprotocol_logLevel           : Enum.Optional_LoggingLevel;
      --  The desired log level for this request. Optional.
      --
      --  If absent, the server MUST NOT send any {@link LoggingMessageNotificationnotifications/message}
      --  notifications for this request. The client opts in to log messages by
      --  explicitly setting a level. Replaces the former `logging/setLevel` RPC.
      io_modelcontextprotocol_protocolVersion    : VSS.Strings.Virtual_String;
      --  The MCP Protocol Version being used for this request. Required.
      --
      --  For the HTTP transport, this value MUST match the `MCP-Protocol-Version`
      --  header; otherwise the server MUST return a `400 Bad Request`. If the
      --  server does not support the requested version, it MUST return an
      --  {@link UnsupportedProtocolVersionError}.
      progressToken                              : Optional_Integer_Or_String;
      --  If specified, the caller is requesting out-of-band progress notifications for this request (as represented by {@link ProgressNotificationnotifications/progress}). The value of this parameter is an opaque token that will be attached to any subsequent notifications. The receiver is not obligated to provide these notifications.
      Additional_Properties                      : Any_Object;
   end record;

   type ResourceRequestParams is record
      meta                  : RequestMetaObject;
      uri                   : VSS.Strings.Virtual_String;
      --  The URI of the resource. The URI can use any protocol; it is up to the server how to interpret it.
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/JSONArray
   type ElicitRequestFormParams_requestedSchema is record
      schema                : VSS.Strings.Virtual_String;
      properties            : Any_Object;
      required              : VSS.String_Vectors.Virtual_String_Vector;
      Additional_Properties : Any_Object;
   end record;

   type ElicitRequestFormParams is record
      message               : VSS.Strings.Virtual_String;
      --  The message to present to the user describing what information is being requested.
      mode                  : VSS.Strings.Virtual_String;
      --  The elicitation mode.
      requestedSchema       : ElicitRequestFormParams_requestedSchema;
      --  A restricted subset of JSON Schema.
      --  Only top-level properties are allowed, without nesting.
      Additional_Properties : Any_Object;
   end record;

   type ElicitRequestURLParams is record
      message               : VSS.Strings.Virtual_String;
      --  The message to present to the user explaining why the interaction is needed.
      url                   : VSS.Strings.Virtual_String;
      --  The URL that the user should navigate to.
      Additional_Properties : Any_Object;
   end record;

   type ElicitRequestParams_Union
     (Kind : Enum.ElicitRequestParams_Variant :=
        Enum.ElicitRequestParams_Variant'First)
   is record
      case Kind is
         when Enum.form =>
            form : ElicitRequestFormParams;

         when Enum.url =>
            url : ElicitRequestURLParams;
      end case;
   end record;

   type ElicitRequestParams is record
      Union : ElicitRequestParams_Union;
   end record;

   type InputResponses is new Any_Object with null record;
   type Optional_InputResponses (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : InputResponses;

         when False =>
            null;
      end case;
   end record;

   type InputResponseRequestParams is record
      meta                  : RequestMetaObject;
      inputResponses        : Optional_InputResponses;
      requestState          : VSS.Strings.Virtual_String;
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/RequestId
   type NotificationMetaObject is record
      io_modelcontextprotocol_subscriptionId : Optional_Integer_Or_String;
      --  Identifies the subscription stream a notification was delivered on. The
      --  server MUST include this key on every notification delivered via a
      --  {@link SubscriptionsListenRequestsubscriptions/listen} stream, so the
      --  client can correlate the notification with the originating subscription.
      --  The key is absent on notifications not delivered via a subscription
      --  stream (e.g. progress notifications for an in-flight request), which is
      --  why it is optional here.
      --
      --  The value is the JSON-RPC ID of the `subscriptions/listen` request that
      --  opened the stream.
      Additional_Properties                  : Any_Object;
   end record;

   type Optional_NotificationMetaObject (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : NotificationMetaObject;

         when False =>
            null;
      end case;
   end record;

   type NotificationParams is record
      meta                  : Optional_NotificationMetaObject;
      Additional_Properties : Any_Object;
   end record;

   type Optional_NotificationParams (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : NotificationParams;

         when False =>
            null;
      end case;
   end record;

   type ToolListChangedNotification is record
      params                : Optional_NotificationParams;
      Additional_Properties : Any_Object;
   end record;

   type MetaObject is new Any_Object with null record;
   type Optional_MetaObject (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : MetaObject;

         when False =>
            null;
      end case;
   end record;

   type Annotations is record
      audience              : Role_Vector;
      --  Describes who the intended audience of this object or data is.
      --
      --  It can include multiple entries to indicate content useful for multiple audiences (e.g., `["user", "assistant"]`).
      lastModified          : VSS.Strings.Virtual_String;
      --  The moment the resource was last modified, as an ISO 8601 formatted string.
      --
      --  Should be an ISO 8601 formatted string (e.g., "2025-01-12T15:00:58Z").
      --
      --  Examples: last activity timestamp in an open file, timestamp when the resource
      --  was attached, etc.
      priority              : Optional_Float_64;
      --  Describes how important this data is for operating the server.
      --
      --  A value of 1 means "most important," and indicates that the data is
      --  effectively required, while 0 means "least important," and indicates that
      --  the data is entirely optional.
      Additional_Properties : Any_Object;
   end record;

   type Optional_Annotations (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : Annotations;

         when False =>
            null;
      end case;
   end record;

   type ResourceLink is record
      meta                  : Optional_MetaObject;
      annotations           : Optional_Annotations;
      --  Optional annotations for the client.
      description           : VSS.Strings.Virtual_String;
      --  A description of what this resource represents.
      --
      --  This can be used by clients to improve the LLM's understanding of available resources. It can be thought of like a "hint" to the model.
      icons                 : Icon_Vector;
      --  Optional set of sized icons that the client can display in a user interface.
      --
      --  Clients that support rendering icons MUST support at least the following MIME types:
      --  - `image/png` - PNG images (safe, universal compatibility)
      --  - `image/jpeg` (and `image/jpg`) - JPEG images (safe, universal compatibility)
      --
      --  Clients that support rendering icons SHOULD also support:
      --  - `image/svg+xml` - SVG images (scalable but requires security precautions)
      --  - `image/webp` - WebP images (modern, efficient format)
      mimeType              : VSS.Strings.Virtual_String;
      --  The MIME type of this resource, if known.
      name                  : VSS.Strings.Virtual_String;
      --  Intended for programmatic or logical use, but used as a display name in past specs or fallback (if title isn't present).
      size                  : Optional_Integer_64;
      --  The size of the raw resource content, in bytes (i.e., before base64 encoding or any tokenization), if known.
      --
      --  This can be used by Hosts to display file sizes and estimate context window usage.
      title                 : VSS.Strings.Virtual_String;
      --  Intended for UI and end-user contexts — optimized to be human-readable and easily understood,
      --  even by those unfamiliar with domain-specific terminology.
      --
      --  If not provided, the name should be used for display (except for {@link Tool},
      --  where `annotations.title` should be given precedence over using `name`,
      --  if present).
      uri                   : VSS.Strings.Virtual_String;
      --  The URI of this resource.
      Additional_Properties : Any_Object;
   end record;

   type PaginatedRequestParams is record
      meta                  : RequestMetaObject;
      cursor                : VSS.Strings.Virtual_String;
      --  An opaque token representing the current pagination position.
      --  If provided, the server should return results starting after this cursor.
      Additional_Properties : Any_Object;
   end record;

   type PaginatedRequest is record
      id                    : Integer_Or_String;
      method                : VSS.Strings.Virtual_String;
      params                : PaginatedRequestParams;
      Additional_Properties : Any_Object;
   end record;

   type ImageContent is record
      meta                  : Optional_MetaObject;
      annotations           : Optional_Annotations;
      --  Optional annotations for the client.
      data                  : VSS.Strings.Virtual_String;
      --  The base64-encoded image data.
      mimeType              : VSS.Strings.Virtual_String;
      --  The MIME type of the image. Different providers may support different image types.
      Additional_Properties : Any_Object;
   end record;

   type ParseError is record
      data                  : Any_Value;
      --  Additional information about the error. The value of this member is defined by the sender (e.g. detailed error information, nested errors etc.).
      message               : VSS.Strings.Virtual_String;
      --  A short description of the error. The message SHOULD be limited to a concise single sentence.
      Additional_Properties : Any_Object;
   end record;

   type ResultMetaObject is record
      io_modelcontextprotocol_serverInfo : Optional_Implementation;
      --  Identifies the server software producing the response. Servers SHOULD
      --  include this field on every response unless specifically configured not
      --  to do so.
      --
      --  The {@link Implementation} schema requires `name` and `version`; other
      --  fields are optional.
      --
      --  The value is self-reported by the server and is not verified by the
      --  protocol. It is intended for display, logging, and debugging. Clients
      --  SHOULD NOT use it to change their behavior, and SHOULD NOT rely on it for
      --  security decisions.
      Additional_Properties              : Any_Object;
   end record;

   type Optional_ResultMetaObject (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : ResultMetaObject;

         when False =>
            null;
      end case;
   end record;

   type ListResourcesResult is record
      meta                  : Optional_ResultMetaObject;
      cacheScope            : Enum.ListResourcesResult_cacheScope;
      --  Indicates the intended scope of the cached response, analogous to HTTP
      --  `Cache-Control: public` vs `Cache-Control: private`.
      --
      --  - `"public"`: The response does not contain user-specific data. Any
      --    client or intermediary (e.g., shared gateway, caching proxy) MAY cache
      --    the response and serve it across authorization contexts.
      --  - `"private"`: The response MAY be cached and reused only within the
      --    same authorization context. Caches MUST NOT be shared across
      --    authorization contexts (e.g., a different access token requires a
      --    different cache).
      nextCursor            : VSS.Strings.Virtual_String;
      --  An opaque token representing the pagination position after the last returned result.
      --  If present, there may be more results available.
      resources             : Resource_Vector;
      resultType            : VSS.Strings.Virtual_String;
      --  Indicates the type of the result, which allows the client to determine
      --  how to parse the result object.
      --
      --  Servers implementing this protocol version MUST include this field.
      --  For backward compatibility, when a client receives a result from a
      --  server implementing an earlier protocol version (which does not include
      --  `resultType`), the client MUST treat the absent field as `"complete"`.
      ttlMs                 : Integer_64;
      --  A hint from the server indicating how long (in milliseconds) the
      --  client MAY cache this response before re-fetching. Semantics are
      --  analogous to HTTP Cache-Control max-age.
      --
      --  - If 0, The response SHOULD be considered immediately stale,
      --    The client MAY re-fetch every time the result is needed.
      --  - If positive, the client SHOULD consider the result fresh for this many
      --    milliseconds after receiving the response.
      Additional_Properties : Any_Object;
   end record;

   type ListResourcesResultResponse is record
      id                    : Integer_Or_String;
      result                : ListResourcesResult;
      Additional_Properties : Any_Object;
   end record;

   type GetPromptRequestParams is record
      meta                  : RequestMetaObject;
      arguments             : Any_Object;
      --  Arguments to use for templating the prompt.
      inputResponses        : Optional_InputResponses;
      name                  : VSS.Strings.Virtual_String;
      --  The name of the prompt or prompt template.
      requestState          : VSS.Strings.Virtual_String;
      Additional_Properties : Any_Object;
   end record;

   type SubscriptionFilter is record
      promptsListChanged    : Boolean := Boolean'First;
      --  If true, receive {@link PromptListChangedNotificationnotifications/prompts/list_changed}.
      resourceSubscriptions : VSS.String_Vectors.Virtual_String_Vector;
      --  Subscribe to {@link ResourceUpdatedNotificationnotifications/resources/updated} for these resource URIs.
      --  Replaces the former `resources/subscribe` RPC.
      resourcesListChanged  : Boolean := Boolean'First;
      --  If true, receive {@link ResourceListChangedNotificationnotifications/resources/list_changed}.
      toolsListChanged      : Boolean := Boolean'First;
      --  If true, receive {@link ToolListChangedNotificationnotifications/tools/list_changed}.
      Additional_Properties : Any_Object;
   end record;

   type SubscriptionsAcknowledgedNotificationParams is record
      meta                  : Optional_NotificationMetaObject;
      notifications         : SubscriptionFilter;
      --  The subset of requested notification types the server agreed to honor.
      --  Only includes notification types the server actually supports; if the
      --  client requested an unsupported type (e.g., `promptsListChanged` when
      --  the server has no prompts), it is omitted from this set.
      Additional_Properties : Any_Object;
   end record;

   type Prompt is record
      meta                  : Optional_MetaObject;
      arguments             : PromptArgument_Vector;
      --  A list of arguments to use for templating the prompt.
      description           : VSS.Strings.Virtual_String;
      --  An optional description of what this prompt provides
      icons                 : Icon_Vector;
      --  Optional set of sized icons that the client can display in a user interface.
      --
      --  Clients that support rendering icons MUST support at least the following MIME types:
      --  - `image/png` - PNG images (safe, universal compatibility)
      --  - `image/jpeg` (and `image/jpg`) - JPEG images (safe, universal compatibility)
      --
      --  Clients that support rendering icons SHOULD also support:
      --  - `image/svg+xml` - SVG images (scalable but requires security precautions)
      --  - `image/webp` - WebP images (modern, efficient format)
      name                  : VSS.Strings.Virtual_String;
      --  Intended for programmatic or logical use, but used as a display name in past specs or fallback (if title isn't present).
      title                 : VSS.Strings.Virtual_String;
      --  Intended for UI and end-user contexts — optimized to be human-readable and easily understood,
      --  even by those unfamiliar with domain-specific terminology.
      --
      --  If not provided, the name should be used for display (except for {@link Tool},
      --  where `annotations.title` should be given precedence over using `name`,
      --  if present).
      Additional_Properties : Any_Object;
   end record;

   type RequestParams is record
      meta                  : RequestMetaObject;
      Additional_Properties : Any_Object;
   end record;

   type JSONRPCRequest is record
      id                    : Integer_Or_String;
      method                : VSS.Strings.Virtual_String;
      params                : Any_Object;
      Additional_Properties : Any_Object;
   end record;

   type InputRequests is new Any_Object with null record;
   type Optional_InputRequests (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : InputRequests;

         when False =>
            null;
      end case;
   end record;

   type InputRequiredResult is record
      meta                  : Optional_ResultMetaObject;
      inputRequests         : Optional_InputRequests;
      requestState          : VSS.Strings.Virtual_String;
      resultType            : VSS.Strings.Virtual_String;
      --  Indicates the type of the result, which allows the client to determine
      --  how to parse the result object.
      --
      --  Servers implementing this protocol version MUST include this field.
      --  For backward compatibility, when a client receives a result from a
      --  server implementing an earlier protocol version (which does not include
      --  `resultType`), the client MUST treat the absent field as `"complete"`.
      Additional_Properties : Any_Object;
   end record;

   type PrimitiveSchemaDefinition is new Any_Object with null record;
   type TextContent is record
      meta                  : Optional_MetaObject;
      annotations           : Optional_Annotations;
      --  Optional annotations for the client.
      text                  : VSS.Strings.Virtual_String;
      --  The text content of the message.
      Additional_Properties : Any_Object;
   end record;

   type AudioContent is record
      meta                  : Optional_MetaObject;
      annotations           : Optional_Annotations;
      --  Optional annotations for the client.
      data                  : VSS.Strings.Virtual_String;
      --  The base64-encoded audio data.
      mimeType              : VSS.Strings.Virtual_String;
      --  The MIME type of the audio. Different providers may support different audio types.
      Additional_Properties : Any_Object;
   end record;

   type ToolUseContent is record
      meta                  : Optional_MetaObject;
      --  Optional metadata about the tool use. Clients SHOULD preserve this field when
      --  including tool uses in subsequent sampling requests to enable caching optimizations.
      id                    : VSS.Strings.Virtual_String;
      --  A unique identifier for this tool use.
      --
      --  This ID is used to match tool results to their corresponding tool uses.
      input                 : Any_Object;
      --  The arguments to pass to the tool, conforming to the tool's input schema.
      name                  : VSS.Strings.Virtual_String;
      --  The name of the tool to call.
      Additional_Properties : Any_Object;
   end record;

   type ToolResultContent is record
      meta                  : Optional_MetaObject;
      --  Optional metadata about the tool result. Clients SHOULD preserve this field when
      --  including tool results in subsequent sampling requests to enable caching optimizations.
      content               : ContentBlock_Vector;
      --  The unstructured result content of the tool use.
      --
      --  This has the same format as {@link CallToolResult.content} and can include text, images,
      --  audio, resource links, and embedded resources.
      isError               : Boolean := Boolean'First;
      --  Whether the tool use resulted in an error.
      --
      --  If true, the content typically describes the error that occurred.
      --  Default: false
      structuredContent     : Any_Value;
      --  An optional structured result value.
      --
      --  This can be any JSON value (object, array, string, number, boolean, or null).
      --  If the tool defined an {@link Tool.outputSchema}, this SHOULD conform to that schema.
      toolUseId             : VSS.Strings.Virtual_String;
      --  The ID of the tool use this result corresponds to.
      --
      --  This MUST match the ID from a previous {@link ToolUseContent}.
      Additional_Properties : Any_Object;
   end record;

   type SamplingMessageContentBlock_Union
     (Kind : Enum.SamplingMessageContentBlock_Variant :=
        Enum.SamplingMessageContentBlock_Variant'First)
   is record
      case Kind is
         when Enum.text =>
            text : TextContent;

         when Enum.image =>
            image : ImageContent;

         when Enum.audio =>
            audio : AudioContent;

         when Enum.tool_use =>
            tool_use : ToolUseContent;

         when Enum.tool_result =>
            tool_result : ToolResultContent;
      end case;
   end record;

   type SamplingMessageContentBlock is record
      Union : SamplingMessageContentBlock_Union;
   end record;

   type SubscriptionsListenRequestParams is record
      meta                  : RequestMetaObject;
      notifications         : SubscriptionFilter;
      --  The notifications the client opts in to on this stream. The server
      --  **MUST NOT** send notification types the client has not explicitly
      --  requested.
      Additional_Properties : Any_Object;
   end record;

   type SubscriptionsListenRequest is record
      id                    : Integer_Or_String;
      params                : SubscriptionsListenRequestParams;
      Additional_Properties : Any_Object;
   end record;

   type LoggingMessageNotificationParams is record
      meta                  : Optional_NotificationMetaObject;
      data                  : Any_Value;
      --  The data to be logged, such as a string message or an object. Any JSON serializable type is allowed here.
      level                 : Enum.LoggingLevel;
      --  The severity of this log message.
      logger                : VSS.Strings.Virtual_String;
      --  An optional name of the logger issuing this message.
      Additional_Properties : Any_Object;
   end record;

   type SubscriptionsListenResultMetaObject is record
      io_modelcontextprotocol_serverInfo     : Optional_Implementation;
      --  Identifies the server software producing the response. Servers SHOULD
      --  include this field on every response unless specifically configured not
      --  to do so.
      --
      --  The {@link Implementation} schema requires `name` and `version`; other
      --  fields are optional.
      --
      --  The value is self-reported by the server and is not verified by the
      --  protocol. It is intended for display, logging, and debugging. Clients
      --  SHOULD NOT use it to change their behavior, and SHOULD NOT rely on it for
      --  security decisions.
      io_modelcontextprotocol_subscriptionId : Integer_Or_String;
      --  Identifies the subscription stream this response closes, so the client can
      --  correlate it with the originating subscription — mirroring the same key on
      --  the stream's notifications. The value is the JSON-RPC ID of the
      --  `subscriptions/listen` request that opened the stream (and equals this
      --  response's `id`).
      Additional_Properties                  : Any_Object;
   end record;

   type SubscriptionsListenResult is record
      meta                  : SubscriptionsListenResultMetaObject;
      resultType            : VSS.Strings.Virtual_String;
      --  Indicates the type of the result, which allows the client to determine
      --  how to parse the result object.
      --
      --  Servers implementing this protocol version MUST include this field.
      --  For backward compatibility, when a client receives a result from a
      --  server implementing an earlier protocol version (which does not include
      --  `resultType`), the client MUST treat the absent field as `"complete"`.
      Additional_Properties : Any_Object;
   end record;

   type PromptReference is record
      name                  : VSS.Strings.Virtual_String;
      --  Intended for programmatic or logical use, but used as a display name in past specs or fallback (if title isn't present).
      title                 : VSS.Strings.Virtual_String;
      --  Intended for UI and end-user contexts — optimized to be human-readable and easily understood,
      --  even by those unfamiliar with domain-specific terminology.
      --
      --  If not provided, the name should be used for display (except for {@link Tool},
      --  where `annotations.title` should be given precedence over using `name`,
      --  if present).
      Additional_Properties : Any_Object;
   end record;

   type ListResourceTemplatesRequest is record
      id                    : Integer_Or_String;
      params                : PaginatedRequestParams;
      Additional_Properties : Any_Object;
   end record;

   type InputResponse is new Any_Object with null record;
   type InternalError is record
      data                  : Any_Value;
      --  Additional information about the error. The value of this member is defined by the sender (e.g. detailed error information, nested errors etc.).
      message               : VSS.Strings.Virtual_String;
      --  A short description of the error. The message SHOULD be limited to a concise single sentence.
      Additional_Properties : Any_Object;
   end record;

   type ServerResult is new Any_Object with null record;
   type TextResourceContents is record
      meta                  : Optional_MetaObject;
      mimeType              : VSS.Strings.Virtual_String;
      --  The MIME type of this resource, if known.
      text                  : VSS.Strings.Virtual_String;
      --  The text of the item. This must only be set if the item can actually be represented as text (not binary data).
      uri                   : VSS.Strings.Virtual_String;
      --  The URI of this resource.
      Additional_Properties : Any_Object;
   end record;

   type ReadResourceRequestParams is record
      meta                  : RequestMetaObject;
      inputResponses        : Optional_InputResponses;
      requestState          : VSS.Strings.Virtual_String;
      uri                   : VSS.Strings.Virtual_String;
      --  The URI of the resource. The URI can use any protocol; it is up to the server how to interpret it.
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/ResultType
   type StringSchema is record
      default               : VSS.Strings.Virtual_String;
      description           : VSS.Strings.Virtual_String;
      format                : Enum.Optional_StringSchema_format;
      maxLength             : Optional_Integer_64;
      minLength             : Optional_Integer_64;
      title                 : VSS.Strings.Virtual_String;
      Additional_Properties : Any_Object;
   end record;

   type ServerCapabilities_prompts is record
      listChanged           : Boolean := Boolean'First;
      --  Whether this server supports notifications for changes to the prompt list.
      Additional_Properties : Any_Object;
   end record;

   type Optional_ServerCapabilities_prompts (Is_Set : Boolean := False) is
   record
      case Is_Set is
         when True =>
            Value : ServerCapabilities_prompts;

         when False =>
            null;
      end case;
   end record;

   type ServerCapabilities_resources is record
      listChanged           : Boolean := Boolean'First;
      --  Whether this server supports notifications for changes to the resource list.
      subscribe             : Boolean := Boolean'First;
      --  Whether this server supports subscribing to resource updates.
      Additional_Properties : Any_Object;
   end record;

   type Optional_ServerCapabilities_resources (Is_Set : Boolean := False) is
   record
      case Is_Set is
         when True =>
            Value : ServerCapabilities_resources;

         when False =>
            null;
      end case;
   end record;

   type ServerCapabilities_tools is record
      listChanged           : Boolean := Boolean'First;
      --  Whether this server supports notifications for changes to the tool list.
      Additional_Properties : Any_Object;
   end record;

   type Optional_ServerCapabilities_tools (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : ServerCapabilities_tools;

         when False =>
            null;
      end case;
   end record;

   type ServerCapabilities is record
      completions           : Optional_JSONObject;
      --  Present if the server supports argument autocompletion suggestions.
      experimental          : Any_Object;
      --  Experimental, non-standard capabilities that the server supports.
      extensions            : Any_Object;
      --  Optional MCP extensions that the server supports. Keys are extension identifiers
      --  (e.g., "io.modelcontextprotocol/tasks"), and values are per-extension settings
      --  objects. An empty object indicates support with no settings.
      --
      --  Keys MUST follow the {@link MetaObject`_meta` key naming rules}, with a
      --  mandatory prefix.
      logging               : Optional_JSONObject;
      --  Present if the server supports sending log messages to the client.
      prompts               : Optional_ServerCapabilities_prompts;
      --  Present if the server offers any prompt templates.
      resources             : Optional_ServerCapabilities_resources;
      --  Present if the server offers any resources to read.
      tools                 : Optional_ServerCapabilities_tools;
      --  Present if the server offers any tools to call.
      Additional_Properties : Any_Object;
   end record;

   type ModelPreferences is record
      costPriority          : Optional_Float_64;
      --  How much to prioritize cost when selecting a model. A value of 0 means cost
      --  is not important, while a value of 1 means cost is the most important
      --  factor.
      hints                 : ModelHint_Vector;
      --  Optional hints to use for model selection.
      --
      --  If multiple hints are specified, the client MUST evaluate them in order
      --  (such that the first match is taken).
      --
      --  The client SHOULD prioritize these hints over the numeric priorities, but
      --  MAY still use the priorities to select from ambiguous matches.
      intelligencePriority  : Optional_Float_64;
      --  How much to prioritize intelligence and capabilities when selecting a
      --  model. A value of 0 means intelligence is not important, while a value of 1
      --  means intelligence is the most important factor.
      speedPriority         : Optional_Float_64;
      --  How much to prioritize sampling speed (latency) when selecting a model. A
      --  value of 0 means speed is not important, while a value of 1 means speed is
      --  the most important factor.
      Additional_Properties : Any_Object;
   end record;

   type Optional_ModelPreferences (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : ModelPreferences;

         when False =>
            null;
      end case;
   end record;

   type ToolChoice is record
      mode                  : Enum.Optional_ToolChoice_mode;
      --  Controls the tool use ability of the model:
      --  - `"auto"`: Model decides whether to use tools (default)
      --  - `"required"`: Model MUST use at least one tool before completing
      --  - `"none"`: Model MUST NOT use any tools
      Additional_Properties : Any_Object;
   end record;

   type Optional_ToolChoice (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : ToolChoice;

         when False =>
            null;
      end case;
   end record;

   type CreateMessageRequestParams is record
      includeContext        :
        Enum.Optional_CreateMessageRequestParams_includeContext;
      --  A request to include context from one or more MCP servers (including the caller), to be attached to the prompt.
      --  The client MAY ignore this request.
      --
      --  Default is `"none"`. The values `"thisServer"` and `"allServers"` are deprecated (SEP-2596): servers SHOULD
      --  omit this field or use `"none"`, and SHOULD only use the deprecated values if the client declares
      --  {@link ClientCapabilities.sampling.context}.
      maxTokens             : Integer_64;
      --  The requested maximum number of tokens to sample (to prevent runaway completions).
      --
      --  The client MAY choose to sample fewer tokens than the requested maximum.
      messages              : SamplingMessage_Vector;
      metadata              : Optional_JSONObject;
      --  Optional metadata to pass through to the LLM provider. The format of this metadata is provider-specific.
      modelPreferences      : Optional_ModelPreferences;
      --  The server's preferences for which model to select. The client MAY ignore these preferences.
      stopSequences         : VSS.String_Vectors.Virtual_String_Vector;
      systemPrompt          : VSS.Strings.Virtual_String;
      --  An optional system prompt the server wants to use for sampling. The client MAY modify or omit this prompt.
      temperature           : Optional_Float_64;
      toolChoice            : Optional_ToolChoice;
      --  Controls how the model uses tools.
      --  The client MUST return an error if this field is provided but {@link ClientCapabilities.sampling.tools} is not declared.
      --  Default is `{ mode: "auto" }`.
      tools                 : Tool_Vector;
      --  Tools that the model may use during generation.
      --  The client MUST return an error if this field is provided but {@link ClientCapabilities.sampling.tools} is not declared.
      Additional_Properties : Any_Object;
   end record;

   type CreateMessageRequest is record
      params                : CreateMessageRequestParams;
      Additional_Properties : Any_Object;
   end record;

   type ListRootsRequest_params is record
      meta                  : Optional_MetaObject;
      Additional_Properties : Any_Object;
   end record;

   type Optional_ListRootsRequest_params (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : ListRootsRequest_params;

         when False =>
            null;
      end case;
   end record;

   type ListRootsRequest is record
      params                : Optional_ListRootsRequest_params;
      Additional_Properties : Any_Object;
   end record;

   type ElicitRequest is record
      params                : ElicitRequestParams;
      Additional_Properties : Any_Object;
   end record;

   type InputRequest_Union
     (Kind : Enum.InputRequest_Variant := Enum.InputRequest_Variant'First)
   is record
      case Kind is
         when Enum.sampling_createMessage =>
            sampling_createMessage : CreateMessageRequest;

         when Enum.roots_list =>
            roots_list : ListRootsRequest;

         when Enum.elicitation_create =>
            elicitation_create : ElicitRequest;
      end case;
   end record;

   type InputRequest is record
      Union : InputRequest_Union;
   end record;

   type Result is record
      meta                  : Optional_ResultMetaObject;
      resultType            : VSS.Strings.Virtual_String;
      --  Indicates the type of the result, which allows the client to determine
      --  how to parse the result object.
      --
      --  Servers implementing this protocol version MUST include this field.
      --  For backward compatibility, when a client receives a result from a
      --  server implementing an earlier protocol version (which does not include
      --  `resultType`), the client MUST treat the absent field as `"complete"`.
      Additional_Properties : Any_Object;
   end record;

   type CallToolRequestParams is record
      meta                  : RequestMetaObject;
      arguments             : Any_Object;
      --  Arguments to use for the tool call.
      inputResponses        : Optional_InputResponses;
      name                  : VSS.Strings.Virtual_String;
      --  The name of the tool.
      requestState          : VSS.Strings.Virtual_String;
      Additional_Properties : Any_Object;
   end record;

   type ResourceTemplate is record
      meta                  : Optional_MetaObject;
      annotations           : Optional_Annotations;
      --  Optional annotations for the client.
      description           : VSS.Strings.Virtual_String;
      --  A description of what this template is for.
      --
      --  This can be used by clients to improve the LLM's understanding of available resources. It can be thought of like a "hint" to the model.
      icons                 : Icon_Vector;
      --  Optional set of sized icons that the client can display in a user interface.
      --
      --  Clients that support rendering icons MUST support at least the following MIME types:
      --  - `image/png` - PNG images (safe, universal compatibility)
      --  - `image/jpeg` (and `image/jpg`) - JPEG images (safe, universal compatibility)
      --
      --  Clients that support rendering icons SHOULD also support:
      --  - `image/svg+xml` - SVG images (scalable but requires security precautions)
      --  - `image/webp` - WebP images (modern, efficient format)
      mimeType              : VSS.Strings.Virtual_String;
      --  The MIME type for all resources that match this template. This should only be included if all resources matching this template have the same type.
      name                  : VSS.Strings.Virtual_String;
      --  Intended for programmatic or logical use, but used as a display name in past specs or fallback (if title isn't present).
      title                 : VSS.Strings.Virtual_String;
      --  Intended for UI and end-user contexts — optimized to be human-readable and easily understood,
      --  even by those unfamiliar with domain-specific terminology.
      --
      --  If not provided, the name should be used for display (except for {@link Tool},
      --  where `annotations.title` should be given precedence over using `name`,
      --  if present).
      uriTemplate           : VSS.Strings.Virtual_String;
      --  A URI template (according to RFC 6570) that can be used to construct resource URIs.
      Additional_Properties : Any_Object;
   end record;

   type ReadResourceRequest is record
      id                    : Integer_Or_String;
      params                : ReadResourceRequestParams;
      Additional_Properties : Any_Object;
   end record;

   type NumberSchema is record
      default               : Optional_Float_64;
      description           : VSS.Strings.Virtual_String;
      maximum               : Optional_Float_64;
      minimum               : Optional_Float_64;
      title                 : VSS.Strings.Virtual_String;
      a_type                : Enum.NumberSchema_type;
      Additional_Properties : Any_Object;
   end record;

   type SamplingMessage is record
      meta                  : Optional_MetaObject;
      content               : Any_Value;
      role                  : Enum.Role;
      Additional_Properties : Any_Object;
   end record;

   type PaginatedResult is record
      meta                  : Optional_ResultMetaObject;
      nextCursor            : VSS.Strings.Virtual_String;
      --  An opaque token representing the pagination position after the last returned result.
      --  If present, there may be more results available.
      resultType            : VSS.Strings.Virtual_String;
      --  Indicates the type of the result, which allows the client to determine
      --  how to parse the result object.
      --
      --  Servers implementing this protocol version MUST include this field.
      --  For backward compatibility, when a client receives a result from a
      --  server implementing an earlier protocol version (which does not include
      --  `resultType`), the client MUST treat the absent field as `"complete"`.
      Additional_Properties : Any_Object;
   end record;

   type PromptListChangedNotification is record
      params                : Optional_NotificationParams;
      Additional_Properties : Any_Object;
   end record;

   type CompleteRequestParams_argument is record
      name                  : VSS.Strings.Virtual_String;
      --  The name of the argument
      value                 : VSS.Strings.Virtual_String;
      --  The value of the argument to use for completion matching.
      Additional_Properties : Any_Object;
   end record;

   type CompleteRequestParams_context is record
      arguments             : Any_Object;
      --  Previously-resolved variables in a URI template or prompt.
      Additional_Properties : Any_Object;
   end record;

   type Optional_CompleteRequestParams_context (Is_Set : Boolean := False) is
   record
      case Is_Set is
         when True =>
            Value : CompleteRequestParams_context;

         when False =>
            null;
      end case;
   end record;

   type CompleteRequestParams is record
      meta                  : RequestMetaObject;
      argument              : CompleteRequestParams_argument;
      --  The argument's information
      context               : Optional_CompleteRequestParams_context;
      --  Additional, optional context for completions
      ref                   : Any_Value;
      Additional_Properties : Any_Object;
   end record;

   type ListResourceTemplatesResult is record
      meta                  : Optional_ResultMetaObject;
      cacheScope            : Enum.ListResourceTemplatesResult_cacheScope;
      --  Indicates the intended scope of the cached response, analogous to HTTP
      --  `Cache-Control: public` vs `Cache-Control: private`.
      --
      --  - `"public"`: The response does not contain user-specific data. Any
      --    client or intermediary (e.g., shared gateway, caching proxy) MAY cache
      --    the response and serve it across authorization contexts.
      --  - `"private"`: The response MAY be cached and reused only within the
      --    same authorization context. Caches MUST NOT be shared across
      --    authorization contexts (e.g., a different access token requires a
      --    different cache).
      nextCursor            : VSS.Strings.Virtual_String;
      --  An opaque token representing the pagination position after the last returned result.
      --  If present, there may be more results available.
      resourceTemplates     : ResourceTemplate_Vector;
      resultType            : VSS.Strings.Virtual_String;
      --  Indicates the type of the result, which allows the client to determine
      --  how to parse the result object.
      --
      --  Servers implementing this protocol version MUST include this field.
      --  For backward compatibility, when a client receives a result from a
      --  server implementing an earlier protocol version (which does not include
      --  `resultType`), the client MUST treat the absent field as `"complete"`.
      ttlMs                 : Integer_64;
      --  A hint from the server indicating how long (in milliseconds) the
      --  client MAY cache this response before re-fetching. Semantics are
      --  analogous to HTTP Cache-Control max-age.
      --
      --  - If 0, The response SHOULD be considered immediately stale,
      --    The client MAY re-fetch every time the result is needed.
      --  - If positive, the client SHOULD consider the result fresh for this many
      --    milliseconds after receiving the response.
      Additional_Properties : Any_Object;
   end record;

   type MultiSelectEnumSchema is new Any_Object with null record;
   type ListToolsResult is record
      meta                  : Optional_ResultMetaObject;
      cacheScope            : Enum.ListToolsResult_cacheScope;
      --  Indicates the intended scope of the cached response, analogous to HTTP
      --  `Cache-Control: public` vs `Cache-Control: private`.
      --
      --  - `"public"`: The response does not contain user-specific data. Any
      --    client or intermediary (e.g., shared gateway, caching proxy) MAY cache
      --    the response and serve it across authorization contexts.
      --  - `"private"`: The response MAY be cached and reused only within the
      --    same authorization context. Caches MUST NOT be shared across
      --    authorization contexts (e.g., a different access token requires a
      --    different cache).
      nextCursor            : VSS.Strings.Virtual_String;
      --  An opaque token representing the pagination position after the last returned result.
      --  If present, there may be more results available.
      resultType            : VSS.Strings.Virtual_String;
      --  Indicates the type of the result, which allows the client to determine
      --  how to parse the result object.
      --
      --  Servers implementing this protocol version MUST include this field.
      --  For backward compatibility, when a client receives a result from a
      --  server implementing an earlier protocol version (which does not include
      --  `resultType`), the client MUST treat the absent field as `"complete"`.
      tools                 : Tool_Vector;
      ttlMs                 : Integer_64;
      --  A hint from the server indicating how long (in milliseconds) the
      --  client MAY cache this response before re-fetching. Semantics are
      --  analogous to HTTP Cache-Control max-age.
      --
      --  - If 0, The response SHOULD be considered immediately stale,
      --    The client MAY re-fetch every time the result is needed.
      --  - If positive, the client SHOULD consider the result fresh for this many
      --    milliseconds after receiving the response.
      Additional_Properties : Any_Object;
   end record;

   type ListToolsResultResponse is record
      id                    : Integer_Or_String;
      result                : ListToolsResult;
      Additional_Properties : Any_Object;
   end record;

   type CallToolRequest is record
      id                    : Integer_Or_String;
      params                : CallToolRequestParams;
      Additional_Properties : Any_Object;
   end record;

   type ResourceContents is record
      meta                  : Optional_MetaObject;
      mimeType              : VSS.Strings.Virtual_String;
      --  The MIME type of this resource, if known.
      uri                   : VSS.Strings.Virtual_String;
      --  The URI of this resource.
      Additional_Properties : Any_Object;
   end record;

   type CallToolResultResponse is record
      id                    : Integer_Or_String;
      result                : Any_Value;
      Additional_Properties : Any_Object;
   end record;

   type CancelledNotificationParams is record
      meta                  : Optional_NotificationMetaObject;
      reason                : VSS.Strings.Virtual_String;
      --  An optional string describing the reason for the cancellation. This MAY be logged or presented to the user.
      requestId             : Integer_Or_String;
      --  The ID of the request to cancel.
      --
      --  This MUST correspond to the ID of a request the client previously issued.
      Additional_Properties : Any_Object;
   end record;

   type ClientNotification is record
      params                : CancelledNotificationParams;
      Additional_Properties : Any_Object;
   end record;

   type ModelHint is record
      name                  : VSS.Strings.Virtual_String;
      --  A hint for a model name.
      --
      --  The client SHOULD treat this as a substring of a model name; for example:
      --   - `claude-3-5-sonnet` should match `claude-3-5-sonnet-20241022`
      --   - `sonnet` should match `claude-3-5-sonnet-20241022`, `claude-3-sonnet-20240229`, etc.
      --   - `claude` should match any Claude model
      --
      --  The client MAY also map the string to a different provider's model name or a different model family, as long as it fills a similar niche; for example:
      --   - `gemini-1.5-flash` could match `claude-3-haiku-20240307`
      Additional_Properties : Any_Object;
   end record;

   type ReadResourceResult is record
      meta                  : Optional_ResultMetaObject;
      cacheScope            : Enum.ReadResourceResult_cacheScope;
      --  Indicates the intended scope of the cached response, analogous to HTTP
      --  `Cache-Control: public` vs `Cache-Control: private`.
      --
      --  - `"public"`: The response does not contain user-specific data. Any
      --    client or intermediary (e.g., shared gateway, caching proxy) MAY cache
      --    the response and serve it across authorization contexts.
      --  - `"private"`: The response MAY be cached and reused only within the
      --    same authorization context. Caches MUST NOT be shared across
      --    authorization contexts (e.g., a different access token requires a
      --    different cache).
      contents              : Any_Value;
      resultType            : VSS.Strings.Virtual_String;
      --  Indicates the type of the result, which allows the client to determine
      --  how to parse the result object.
      --
      --  Servers implementing this protocol version MUST include this field.
      --  For backward compatibility, when a client receives a result from a
      --  server implementing an earlier protocol version (which does not include
      --  `resultType`), the client MUST treat the absent field as `"complete"`.
      ttlMs                 : Integer_64;
      --  A hint from the server indicating how long (in milliseconds) the
      --  client MAY cache this response before re-fetching. Semantics are
      --  analogous to HTTP Cache-Control max-age.
      --
      --  - If 0, The response SHOULD be considered immediately stale,
      --    The client MAY re-fetch every time the result is needed.
      --  - If positive, the client SHOULD consider the result fresh for this many
      --    milliseconds after receiving the response.
      Additional_Properties : Any_Object;
   end record;

   type EnumSchema is new Any_Object with null record;
   type DiscoverRequest is record
      id                    : Integer_Or_String;
      params                : RequestParams;
      Additional_Properties : Any_Object;
   end record;

   type ProgressNotificationParams is record
      meta                  : Optional_NotificationMetaObject;
      message               : VSS.Strings.Virtual_String;
      --  An optional message describing the current progress.
      progress              : Float_64;
      --  The progress thus far. This should increase every time progress is made, even if the total is unknown.
      progressToken         : Integer_Or_String;
      --  The progress token which was given in the initial request, used to associate this notification with the request that is proceeding.
      total                 : Optional_Float_64;
      --  Total number of items to process (or total progress required), if known.
      Additional_Properties : Any_Object;
   end record;

   type ProgressNotification is record
      params                : ProgressNotificationParams;
      Additional_Properties : Any_Object;
   end record;

   type ListPromptsResult is record
      meta                  : Optional_ResultMetaObject;
      cacheScope            : Enum.ListPromptsResult_cacheScope;
      --  Indicates the intended scope of the cached response, analogous to HTTP
      --  `Cache-Control: public` vs `Cache-Control: private`.
      --
      --  - `"public"`: The response does not contain user-specific data. Any
      --    client or intermediary (e.g., shared gateway, caching proxy) MAY cache
      --    the response and serve it across authorization contexts.
      --  - `"private"`: The response MAY be cached and reused only within the
      --    same authorization context. Caches MUST NOT be shared across
      --    authorization contexts (e.g., a different access token requires a
      --    different cache).
      nextCursor            : VSS.Strings.Virtual_String;
      --  An opaque token representing the pagination position after the last returned result.
      --  If present, there may be more results available.
      prompts               : Prompt_Vector;
      resultType            : VSS.Strings.Virtual_String;
      --  Indicates the type of the result, which allows the client to determine
      --  how to parse the result object.
      --
      --  Servers implementing this protocol version MUST include this field.
      --  For backward compatibility, when a client receives a result from a
      --  server implementing an earlier protocol version (which does not include
      --  `resultType`), the client MUST treat the absent field as `"complete"`.
      ttlMs                 : Integer_64;
      --  A hint from the server indicating how long (in milliseconds) the
      --  client MAY cache this response before re-fetching. Semantics are
      --  analogous to HTTP Cache-Control max-age.
      --
      --  - If 0, The response SHOULD be considered immediately stale,
      --    The client MAY re-fetch every time the result is needed.
      --  - If positive, the client SHOULD consider the result fresh for this many
      --    milliseconds after receiving the response.
      Additional_Properties : Any_Object;
   end record;

   type ListPromptsResultResponse is record
      id                    : Integer_Or_String;
      result                : ListPromptsResult;
      Additional_Properties : Any_Object;
   end record;

   type SingleSelectEnumSchema is new Any_Object with null record;
   type EmbeddedResource is record
      meta                  : Optional_MetaObject;
      annotations           : Optional_Annotations;
      --  Optional annotations for the client.
      resource              : Any_Value;
      Additional_Properties : Any_Object;
   end record;

   type ContentBlock_Union
     (Kind : Enum.ContentBlock_Variant := Enum.ContentBlock_Variant'First)
   is record
      case Kind is
         when Enum.text =>
            text : TextContent;

         when Enum.image =>
            image : ImageContent;

         when Enum.audio =>
            audio : AudioContent;

         when Enum.resource_link =>
            resource_link : ResourceLink;

         when Enum.resource =>
            resource : EmbeddedResource;
      end case;
   end record;

   type ContentBlock is record
      Union : ContentBlock_Union;
   end record;

   type PromptMessage is record
      content               : ContentBlock;
      role                  : Enum.Role;
      Additional_Properties : Any_Object;
   end record;

   type CancelledNotification is record
      params                : CancelledNotificationParams;
      Additional_Properties : Any_Object;
   end record;

   type ResourceListChangedNotification is record
      params                : Optional_NotificationParams;
      Additional_Properties : Any_Object;
   end record;

   type SubscriptionsAcknowledgedNotification is record
      params                : SubscriptionsAcknowledgedNotificationParams;
      Additional_Properties : Any_Object;
   end record;

   type ResourceUpdatedNotificationParams is record
      meta                  : Optional_NotificationMetaObject;
      uri                   : VSS.Strings.Virtual_String;
      --  The URI of the resource that has been updated. This might be a sub-resource of the one that the client actually subscribed to.
      Additional_Properties : Any_Object;
   end record;

   type ResourceUpdatedNotification is record
      params                : ResourceUpdatedNotificationParams;
      Additional_Properties : Any_Object;
   end record;

   type LoggingMessageNotification is record
      params                : LoggingMessageNotificationParams;
      Additional_Properties : Any_Object;
   end record;

   type ServerNotification_Union
     (Kind : Enum.ServerNotification_Variant :=
        Enum.ServerNotification_Variant'First)
   is record
      case Kind is
         when Enum.notifications_cancelled =>
            notifications_cancelled : CancelledNotification;

         when Enum.notifications_progress =>
            notifications_progress : ProgressNotification;

         when Enum.notifications_resources_list_changed =>
            notifications_resources_list_changed :
              ResourceListChangedNotification;

         when Enum.notifications_subscriptions_acknowledged =>
            notifications_subscriptions_acknowledged :
              SubscriptionsAcknowledgedNotification;

         when Enum.notifications_resources_updated =>
            notifications_resources_updated : ResourceUpdatedNotification;

         when Enum.notifications_prompts_list_changed =>
            notifications_prompts_list_changed : PromptListChangedNotification;

         when Enum.notifications_tools_list_changed =>
            notifications_tools_list_changed : ToolListChangedNotification;

         when Enum.notifications_message =>
            notifications_message : LoggingMessageNotification;
      end case;
   end record;

   type ServerNotification is record
      Union : ServerNotification_Union;
   end record;

   --  Left:#/$defs/Cursor
   type JSONRPCNotification is record
      method                : VSS.Strings.Virtual_String;
      params                : Any_Object;
      Additional_Properties : Any_Object;
   end record;

   type ListPromptsRequest is record
      id                    : Integer_Or_String;
      params                : PaginatedRequestParams;
      Additional_Properties : Any_Object;
   end record;

   type DiscoverResult is record
      meta                  : Optional_ResultMetaObject;
      cacheScope            : Enum.DiscoverResult_cacheScope;
      --  Indicates the intended scope of the cached response, analogous to HTTP
      --  `Cache-Control: public` vs `Cache-Control: private`.
      --
      --  - `"public"`: The response does not contain user-specific data. Any
      --    client or intermediary (e.g., shared gateway, caching proxy) MAY cache
      --    the response and serve it across authorization contexts.
      --  - `"private"`: The response MAY be cached and reused only within the
      --    same authorization context. Caches MUST NOT be shared across
      --    authorization contexts (e.g., a different access token requires a
      --    different cache).
      capabilities          : ServerCapabilities;
      --  The capabilities of the server.
      instructions          : VSS.Strings.Virtual_String;
      --  Natural-language guidance describing the server and its features.
      --
      --  This can be used by clients to improve an LLM's understanding of
      --  available tools (e.g., by including it in a system prompt). It should
      --  focus on information that helps the model use the server effectively
      --  and should not duplicate information already in tool descriptions.
      resultType            : VSS.Strings.Virtual_String;
      --  Indicates the type of the result, which allows the client to determine
      --  how to parse the result object.
      --
      --  Servers implementing this protocol version MUST include this field.
      --  For backward compatibility, when a client receives a result from a
      --  server implementing an earlier protocol version (which does not include
      --  `resultType`), the client MUST treat the absent field as `"complete"`.
      supportedVersions     : VSS.String_Vectors.Virtual_String_Vector;
      --  MCP Protocol Versions this server supports. The client should choose a
      --  version from this list for use in subsequent requests.
      ttlMs                 : Integer_64;
      --  A hint from the server indicating how long (in milliseconds) the
      --  client MAY cache this response before re-fetching. Semantics are
      --  analogous to HTTP Cache-Control max-age.
      --
      --  - If 0, The response SHOULD be considered immediately stale,
      --    The client MAY re-fetch every time the result is needed.
      --  - If positive, the client SHOULD consider the result fresh for this many
      --    milliseconds after receiving the response.
      Additional_Properties : Any_Object;
   end record;

   type DiscoverResultResponse is record
      id                    : Integer_Or_String;
      result                : DiscoverResult;
      Additional_Properties : Any_Object;
   end record;

   type Request is record
      method                : VSS.Strings.Virtual_String;
      params                : Any_Object;
      Additional_Properties : Any_Object;
   end record;

   type JSONRPCErrorResponse is record
      error                 : MCP.Types.Error;
      id                    : Optional_Integer_Or_String;
      Additional_Properties : Any_Object;
   end record;

   type ToolAnnotations is record
      destructiveHint       : Boolean := Boolean'First;
      --  If true, the tool may perform destructive updates to its environment.
      --  If false, the tool performs only additive updates.
      --
      --  (This property is meaningful only when `readOnlyHint == false`)
      --
      --  Default: true
      idempotentHint        : Boolean := Boolean'First;
      --  If true, calling the tool repeatedly with the same arguments
      --  will have no additional effect on its environment.
      --
      --  (This property is meaningful only when `readOnlyHint == false`)
      --
      --  Default: false
      openWorldHint         : Boolean := Boolean'First;
      --  If true, this tool may interact with an "open world" of external
      --  entities. If false, the tool's domain of interaction is closed.
      --  For example, the world of a web search tool is open, whereas that
      --  of a memory tool is not.
      --
      --  Default: true
      readOnlyHint          : Boolean := Boolean'First;
      --  If true, the tool does not modify its environment.
      --
      --  Default: false
      title                 : VSS.Strings.Virtual_String;
      --  A human-readable title for the tool.
      Additional_Properties : Any_Object;
   end record;

   type Optional_ToolAnnotations (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : ToolAnnotations;

         when False =>
            null;
      end case;
   end record;

   type Tool is record
      meta                  : Optional_MetaObject;
      annotations           : Optional_ToolAnnotations;
      --  Optional additional tool information.
      --
      --  Display name precedence order is: `title`, `annotations.title`, then `name`.
      description           : VSS.Strings.Virtual_String;
      --  A human-readable description of the tool.
      --
      --  This can be used by clients to improve the LLM's understanding of available tools. It can be thought of like a "hint" to the model.
      icons                 : Icon_Vector;
      --  Optional set of sized icons that the client can display in a user interface.
      --
      --  Clients that support rendering icons MUST support at least the following MIME types:
      --  - `image/png` - PNG images (safe, universal compatibility)
      --  - `image/jpeg` (and `image/jpg`) - JPEG images (safe, universal compatibility)
      --
      --  Clients that support rendering icons SHOULD also support:
      --  - `image/svg+xml` - SVG images (scalable but requires security precautions)
      --  - `image/webp` - WebP images (modern, efficient format)
      inputSchema           : Any_Object;
      --  A JSON Schema object defining the expected parameters for the tool.
      --
      --  Tool arguments are always JSON objects, so `type: "object"` is required at the root.
      --  Beyond that, any JSON Schema 2020-12 keyword may appear alongside `type` — including
      --  composition keywords (`oneOf`, `anyOf`, `allOf`, `not`), conditional keywords
      --  (`if`/`then`/`else`), reference keywords (`$ref`, `$defs`, `$anchor`), and any other
      --  standard validation or annotation keywords.
      --
      --  When using composition keywords, declare `properties` at the schema root and keep the
      --  branches to presence assertions such as `required`. A subschema that fails on a type
      --  error is indistinguishable from one that does not apply, so type constraints placed
      --  inside `oneOf` branches are not enforced for whichever branch does not match.
      --
      --  Property schemas may carry an `x-mcp-header` annotation to mirror the
      --  argument value into an HTTP header on the Streamable HTTP transport. See
      --  the Streamable HTTP transport specification for the validity and
      --  extraction rules.
      --
      --  Defaults to JSON Schema 2020-12 when no explicit `$schema` is provided.
      name                  : VSS.Strings.Virtual_String;
      --  Intended for programmatic or logical use, but used as a display name in past specs or fallback (if title isn't present).
      outputSchema          : Any_Object;
      --  An optional JSON Schema object defining the structure of the tool's output returned in
      --  the structuredContent field of a {@link CallToolResult}. This can be any valid JSON Schema 2020-12.
      --
      --  Defaults to JSON Schema 2020-12 when no explicit `$schema` is provided.
      title                 : VSS.Strings.Virtual_String;
      --  Intended for UI and end-user contexts — optimized to be human-readable and easily understood,
      --  even by those unfamiliar with domain-specific terminology.
      --
      --  If not provided, the name should be used for display (except for {@link Tool},
      --  where `annotations.title` should be given precedence over using `name`,
      --  if present).
      Additional_Properties : Any_Object;
   end record;

   type Icons is record
      icons                 : Icon_Vector;
      --  Optional set of sized icons that the client can display in a user interface.
      --
      --  Clients that support rendering icons MUST support at least the following MIME types:
      --  - `image/png` - PNG images (safe, universal compatibility)
      --  - `image/jpeg` (and `image/jpg`) - JPEG images (safe, universal compatibility)
      --
      --  Clients that support rendering icons SHOULD also support:
      --  - `image/svg+xml` - SVG images (scalable but requires security precautions)
      --  - `image/webp` - WebP images (modern, efficient format)
      Additional_Properties : Any_Object;
   end record;

   type UntitledSingleSelectEnumSchema is record
      default               : VSS.Strings.Virtual_String;
      --  Optional default value.
      description           : VSS.Strings.Virtual_String;
      --  Optional description for the enum field.
      enum                  : VSS.String_Vectors.Virtual_String_Vector;
      --  Array of enum values to choose from.
      title                 : VSS.Strings.Virtual_String;
      --  Optional title for the enum field.
      Additional_Properties : Any_Object;
   end record;

   type Icon is record
      mimeType              : VSS.Strings.Virtual_String;
      --  Optional MIME type override if the source MIME type is missing or generic.
      --  For example: `"image/png"`, `"image/jpeg"`, or `"image/svg+xml"`.
      sizes                 : VSS.String_Vectors.Virtual_String_Vector;
      --  Optional array of strings that specify sizes at which the icon can be used.
      --  Each string should be in WxH format (e.g., `"48x48"`, `"96x96"`) or `"any"` for scalable formats like SVG.
      --
      --  If not provided, the client should assume that the icon can be used at any size.
      src                   : VSS.Strings.Virtual_String;
      --  A standard URI pointing to an icon resource. May be an HTTP/HTTPS URL or a
      --  `data:` URI with Base64-encoded image data.
      --
      --  Consumers SHOULD take steps to ensure URLs serving icons are from the
      --  same domain as the client/server or a trusted domain.
      --
      --  Consumers SHOULD take appropriate precautions when consuming SVGs as they can contain
      --  executable JavaScript.
      theme                 : Enum.Optional_Icon_theme;
      --  Optional specifier for the theme this icon is designed for. `"light"` indicates
      --  the icon is designed to be used with a light background, and `"dark"` indicates
      --  the icon is designed to be used with a dark background.
      --
      --  If not provided, the client should assume the icon can be used with any theme.
      Additional_Properties : Any_Object;
   end record;

   type CompleteResult_completion is record
      hasMore               : Boolean := Boolean'First;
      --  Indicates whether there are additional completion options beyond those provided in the current response, even if the exact total is unknown.
      total                 : Optional_Integer_64;
      --  The total number of completion options available. This can exceed the number of values actually sent in the response.
      values                : VSS.String_Vectors.Virtual_String_Vector;
      --  An array of completion values. Must not exceed 100 items.
      Additional_Properties : Any_Object;
   end record;

   type CompleteResult is record
      meta                  : Optional_ResultMetaObject;
      completion            : CompleteResult_completion;
      resultType            : VSS.Strings.Virtual_String;
      --  Indicates the type of the result, which allows the client to determine
      --  how to parse the result object.
      --
      --  Servers implementing this protocol version MUST include this field.
      --  For backward compatibility, when a client receives a result from a
      --  server implementing an earlier protocol version (which does not include
      --  `resultType`), the client MUST treat the absent field as `"complete"`.
      Additional_Properties : Any_Object;
   end record;

   type CompleteResultResponse is record
      id                    : Integer_Or_String;
      result                : CompleteResult;
      Additional_Properties : Any_Object;
   end record;

   type GetPromptResultResponse is record
      id                    : Integer_Or_String;
      result                : Any_Value;
      Additional_Properties : Any_Object;
   end record;

   type BlobResourceContents is record
      meta                  : Optional_MetaObject;
      blob                  : VSS.Strings.Virtual_String;
      --  A base64-encoded string representing the binary data of the item.
      mimeType              : VSS.Strings.Virtual_String;
      --  The MIME type of this resource, if known.
      uri                   : VSS.Strings.Virtual_String;
      --  The URI of this resource.
      Additional_Properties : Any_Object;
   end record;

   type LegacyTitledEnumSchema is record
      default               : VSS.Strings.Virtual_String;
      description           : VSS.Strings.Virtual_String;
      enum                  : VSS.String_Vectors.Virtual_String_Vector;
      enumNames             : VSS.String_Vectors.Virtual_String_Vector;
      --  (Legacy) Display names for enum values.
      --  Non-standard according to JSON schema 2020-12.
      title                 : VSS.Strings.Virtual_String;
      Additional_Properties : Any_Object;
   end record;

   type JSONRPCMessage is new Any_Object with null record;
   type ListRootsResult is record
      roots                 : Root_Vector;
      Additional_Properties : Any_Object;
   end record;

   type ListResourcesRequest is record
      id                    : Integer_Or_String;
      params                : PaginatedRequestParams;
      Additional_Properties : Any_Object;
   end record;

   type CreateMessageResult is record
      meta                  : Optional_MetaObject;
      content               : Any_Value;
      model                 : VSS.Strings.Virtual_String;
      --  The name of the model that generated the message.
      role                  : Enum.Role;
      stopReason            : VSS.Strings.Virtual_String;
      --  The reason why sampling stopped, if known.
      --
      --  Standard values:
      --  - `"endTurn"`: Natural end of the assistant's turn
      --  - `"stopSequence"`: A stop sequence was encountered
      --  - `"maxTokens"`: Maximum token limit was reached
      --  - `"toolUse"`: The model wants to use one or more tools
      --
      --  This field is an open string to allow for provider-specific stop reasons.
      Additional_Properties : Any_Object;
   end record;

   type JSONValue is new Any_Object with null record;
   type CallToolResult is record
      meta                  : Optional_ResultMetaObject;
      content               : ContentBlock_Vector;
      --  A list of content objects that represent the unstructured result of the tool call.
      isError               : Boolean := Boolean'First;
      --  Whether the tool call ended in an error.
      --
      --  If not set, this is assumed to be false (the call was successful).
      --
      --  Any errors that originate from the tool SHOULD be reported inside the result
      --  object, with `isError` set to true, _not_ as an MCP protocol-level error
      --  response. Otherwise, the LLM would not be able to see that an error occurred
      --  and self-correct.
      --
      --  However, any errors in _finding_ the tool, an error indicating that the
      --  server does not support tool calls, or any other exceptional conditions,
      --  should be reported as an MCP error response.
      resultType            : VSS.Strings.Virtual_String;
      --  Indicates the type of the result, which allows the client to determine
      --  how to parse the result object.
      --
      --  Servers implementing this protocol version MUST include this field.
      --  For backward compatibility, when a client receives a result from a
      --  server implementing an earlier protocol version (which does not include
      --  `resultType`), the client MUST treat the absent field as `"complete"`.
      structuredContent     : Any_Value;
      --  An optional JSON value that represents the structured result of the tool call.
      --
      --  This can be any JSON value (object, array, string, number, boolean, or null)
      --  that conforms to the tool's outputSchema if one is defined.
      Additional_Properties : Any_Object;
   end record;

   type TitledMultiSelectEnumSchema_items is record
      anyOf                 : Any_Value;
      --  Array of enum options with values and display labels.
      Additional_Properties : Any_Object;
   end record;

   type TitledMultiSelectEnumSchema is record
      default               : VSS.String_Vectors.Virtual_String_Vector;
      --  Optional default value.
      description           : VSS.Strings.Virtual_String;
      --  Optional description for the enum field.
      items                 : TitledMultiSelectEnumSchema_items;
      --  Schema for array items with enum options and display labels.
      maxItems              : Optional_Integer_64;
      --  Maximum number of items to select.
      minItems              : Optional_Integer_64;
      --  Minimum number of items to select.
      title                 : VSS.Strings.Virtual_String;
      --  Optional title for the enum field.
      Additional_Properties : Any_Object;
   end record;

   type GetPromptRequest is record
      id                    : Integer_Or_String;
      params                : GetPromptRequestParams;
      Additional_Properties : Any_Object;
   end record;

   type ListToolsRequest is record
      id                    : Integer_Or_String;
      params                : PaginatedRequestParams;
      Additional_Properties : Any_Object;
   end record;

   type CompleteRequest is record
      id                    : Integer_Or_String;
      params                : CompleteRequestParams;
      Additional_Properties : Any_Object;
   end record;

   type ClientRequest_Union
     (Kind : Enum.ClientRequest_Variant := Enum.ClientRequest_Variant'First)
   is record
      case Kind is
         when Enum.server_discover =>
            server_discover : DiscoverRequest;

         when Enum.resources_list =>
            resources_list : ListResourcesRequest;

         when Enum.resources_templates_list =>
            resources_templates_list : ListResourceTemplatesRequest;

         when Enum.resources_read =>
            resources_read : ReadResourceRequest;

         when Enum.subscriptions_listen =>
            subscriptions_listen : SubscriptionsListenRequest;

         when Enum.prompts_list =>
            prompts_list : ListPromptsRequest;

         when Enum.prompts_get =>
            prompts_get : GetPromptRequest;

         when Enum.tools_list =>
            tools_list : ListToolsRequest;

         when Enum.tools_call =>
            tools_call : CallToolRequest;

         when Enum.completion_complete =>
            completion_complete : CompleteRequest;
      end case;
   end record;

   type ClientRequest is record
      Union : ClientRequest_Union;
   end record;

   type InvalidRequestError is record
      data                  : Any_Value;
      --  Additional information about the error. The value of this member is defined by the sender (e.g. detailed error information, nested errors etc.).
      message               : VSS.Strings.Virtual_String;
      --  A short description of the error. The message SHOULD be limited to a concise single sentence.
      Additional_Properties : Any_Object;
   end record;

   type ElicitResult is record
      action                : Enum.ElicitResult_action;
      --  The user action in response to the elicitation.
      --  - `"accept"`: User submitted the form/confirmed the action
      --  - `"decline"`: User explicitly declined the action
      --  - `"cancel"`: User dismissed without making an explicit choice
      content               : Any_Object;
      --  The submitted form data, only present when action is `"accept"` and mode was `"form"`.
      --  Contains values matching the requested schema.
      --  Omitted for out-of-band mode responses.
      Additional_Properties : Any_Object;
   end record;

   type InvalidParamsError is record
      data                  : Any_Value;
      --  Additional information about the error. The value of this member is defined by the sender (e.g. detailed error information, nested errors etc.).
      message               : VSS.Strings.Virtual_String;
      --  A short description of the error. The message SHOULD be limited to a concise single sentence.
      Additional_Properties : Any_Object;
   end record;

   type Notification is record
      method                : VSS.Strings.Virtual_String;
      params                : Any_Object;
      Additional_Properties : Any_Object;
   end record;

   type JSONRPCResultResponse is record
      id                    : Integer_Or_String;
      result                : MCP.Types.Result;
      Additional_Properties : Any_Object;
   end record;

   type HeaderMismatchError is record
      error                 : Any_Value;
      id                    : Optional_Integer_Or_String;
      Additional_Properties : Any_Object;
   end record;

   type TitledSingleSelectEnumSchema is record
      default               : VSS.Strings.Virtual_String;
      --  Optional default value.
      description           : VSS.Strings.Virtual_String;
      --  Optional description for the enum field.
      oneOf                 : Any_Value;
      --  Array of enum options with values and display labels.
      title                 : VSS.Strings.Virtual_String;
      --  Optional title for the enum field.
      Additional_Properties : Any_Object;
   end record;

   type BooleanSchema is record
      default               : Boolean := Boolean'First;
      description           : VSS.Strings.Virtual_String;
      title                 : VSS.Strings.Virtual_String;
      Additional_Properties : Any_Object;
   end record;

   type SubscriptionsListenResultResponse is record
      id                    : Integer_Or_String;
      result                : SubscriptionsListenResult;
      Additional_Properties : Any_Object;
   end record;

   type Root is record
      meta                  : Optional_MetaObject;
      name                  : VSS.Strings.Virtual_String;
      --  An optional name for the root. This can be used to provide a human-readable
      --  identifier for the root, which may be useful for display purposes or for
      --  referencing the root in other parts of the application.
      uri                   : VSS.Strings.Virtual_String;
      --  The URI identifying the root. This *must* start with `file://` for now.
      --  This restriction may be relaxed in future versions of the protocol to allow
      --  other URI schemes.
      Additional_Properties : Any_Object;
   end record;

   type UntitledMultiSelectEnumSchema_items is record
      enum                  : VSS.String_Vectors.Virtual_String_Vector;
      --  Array of enum values to choose from.
      Additional_Properties : Any_Object;
   end record;

   type UntitledMultiSelectEnumSchema is record
      default               : VSS.String_Vectors.Virtual_String_Vector;
      --  Optional default value.
      description           : VSS.Strings.Virtual_String;
      --  Optional description for the enum field.
      items                 : UntitledMultiSelectEnumSchema_items;
      --  Schema for the array items.
      maxItems              : Optional_Integer_64;
      --  Maximum number of items to select.
      minItems              : Optional_Integer_64;
      --  Minimum number of items to select.
      title                 : VSS.Strings.Virtual_String;
      --  Optional title for the enum field.
      Additional_Properties : Any_Object;
   end record;

   type PromptArgument is record
      description           : VSS.Strings.Virtual_String;
      --  A human-readable description of the argument.
      name                  : VSS.Strings.Virtual_String;
      --  Intended for programmatic or logical use, but used as a display name in past specs or fallback (if title isn't present).
      required              : Boolean := Boolean'First;
      --  Whether this argument must be provided.
      title                 : VSS.Strings.Virtual_String;
      --  Intended for UI and end-user contexts — optimized to be human-readable and easily understood,
      --  even by those unfamiliar with domain-specific terminology.
      --
      --  If not provided, the name should be used for display (except for {@link Tool},
      --  where `annotations.title` should be given precedence over using `name`,
      --  if present).
      Additional_Properties : Any_Object;
   end record;

   type ReadResourceResultResponse is record
      id                    : Integer_Or_String;
      result                : Any_Value;
      Additional_Properties : Any_Object;
   end record;

   type ResourceTemplateReference is record
      uri                   : VSS.Strings.Virtual_String;
      --  The URI or URI template of the resource.
      Additional_Properties : Any_Object;
   end record;

   type MethodNotFoundError is record
      data                  : Any_Value;
      --  Additional information about the error. The value of this member is defined by the sender (e.g. detailed error information, nested errors etc.).
      message               : VSS.Strings.Virtual_String;
      --  A short description of the error. The message SHOULD be limited to a concise single sentence.
      Additional_Properties : Any_Object;
   end record;

   type Resource is record
      meta                  : Optional_MetaObject;
      annotations           : Optional_Annotations;
      --  Optional annotations for the client.
      description           : VSS.Strings.Virtual_String;
      --  A description of what this resource represents.
      --
      --  This can be used by clients to improve the LLM's understanding of available resources. It can be thought of like a "hint" to the model.
      icons                 : Icon_Vector;
      --  Optional set of sized icons that the client can display in a user interface.
      --
      --  Clients that support rendering icons MUST support at least the following MIME types:
      --  - `image/png` - PNG images (safe, universal compatibility)
      --  - `image/jpeg` (and `image/jpg`) - JPEG images (safe, universal compatibility)
      --
      --  Clients that support rendering icons SHOULD also support:
      --  - `image/svg+xml` - SVG images (scalable but requires security precautions)
      --  - `image/webp` - WebP images (modern, efficient format)
      mimeType              : VSS.Strings.Virtual_String;
      --  The MIME type of this resource, if known.
      name                  : VSS.Strings.Virtual_String;
      --  Intended for programmatic or logical use, but used as a display name in past specs or fallback (if title isn't present).
      size                  : Optional_Integer_64;
      --  The size of the raw resource content, in bytes (i.e., before base64 encoding or any tokenization), if known.
      --
      --  This can be used by Hosts to display file sizes and estimate context window usage.
      title                 : VSS.Strings.Virtual_String;
      --  Intended for UI and end-user contexts — optimized to be human-readable and easily understood,
      --  even by those unfamiliar with domain-specific terminology.
      --
      --  If not provided, the name should be used for display (except for {@link Tool},
      --  where `annotations.title` should be given precedence over using `name`,
      --  if present).
      uri                   : VSS.Strings.Virtual_String;
      --  The URI of this resource.
      Additional_Properties : Any_Object;
   end record;

   type ListResourceTemplatesResultResponse is record
      id                    : Integer_Or_String;
      result                : ListResourceTemplatesResult;
      Additional_Properties : Any_Object;
   end record;

   type JSONRPCResponse is new Any_Object with null record;
   type GetPromptResult is record
      meta                  : Optional_ResultMetaObject;
      description           : VSS.Strings.Virtual_String;
      --  An optional description for the prompt.
      messages              : PromptMessage_Vector;
      resultType            : VSS.Strings.Virtual_String;
      --  Indicates the type of the result, which allows the client to determine
      --  how to parse the result object.
      --
      --  Servers implementing this protocol version MUST include this field.
      --  For backward compatibility, when a client receives a result from a
      --  server implementing an earlier protocol version (which does not include
      --  `resultType`), the client MUST treat the absent field as `"complete"`.
      Additional_Properties : Any_Object;
   end record;

   type UnsupportedProtocolVersionError is record
      error                 : Any_Value;
      id                    : Optional_Integer_Or_String;
      Additional_Properties : Any_Object;
   end record;

   type CacheableResult is record
      meta                  : Optional_ResultMetaObject;
      cacheScope            : Enum.CacheableResult_cacheScope;
      --  Indicates the intended scope of the cached response, analogous to HTTP
      --  `Cache-Control: public` vs `Cache-Control: private`.
      --
      --  - `"public"`: The response does not contain user-specific data. Any
      --    client or intermediary (e.g., shared gateway, caching proxy) MAY cache
      --    the response and serve it across authorization contexts.
      --  - `"private"`: The response MAY be cached and reused only within the
      --    same authorization context. Caches MUST NOT be shared across
      --    authorization contexts (e.g., a different access token requires a
      --    different cache).
      resultType            : VSS.Strings.Virtual_String;
      --  Indicates the type of the result, which allows the client to determine
      --  how to parse the result object.
      --
      --  Servers implementing this protocol version MUST include this field.
      --  For backward compatibility, when a client receives a result from a
      --  server implementing an earlier protocol version (which does not include
      --  `resultType`), the client MUST treat the absent field as `"complete"`.
      ttlMs                 : Integer_64;
      --  A hint from the server indicating how long (in milliseconds) the
      --  client MAY cache this response before re-fetching. Semantics are
      --  analogous to HTTP Cache-Control max-age.
      --
      --  - If 0, The response SHOULD be considered immediately stale,
      --    The client MAY re-fetch every time the result is needed.
      --  - If positive, the client SHOULD consider the result fresh for this many
      --    milliseconds after receiving the response.
      Additional_Properties : Any_Object;
   end record;

   type MissingRequiredClientCapabilityError is record
      error                 : Any_Value;
      id                    : Optional_Integer_Or_String;
      Additional_Properties : Any_Object;
   end record;

   function Empty return ResourceTemplate_Vector;

   function Is_Null (Self : ResourceTemplate_Vector) return Boolean;

   function Length (Self : ResourceTemplate_Vector) return Natural;

   procedure Clear
     (Self : in out ResourceTemplate_Vector; Is_Null : Boolean := True);

   procedure Append
     (Self : in out ResourceTemplate_Vector; Value : ResourceTemplate);

   type ResourceTemplate_Variable_Reference
     (Element : not null access ResourceTemplate)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_ResourceTemplate_Variable_Reference
     (Self : aliased in out ResourceTemplate_Vector; Index : Positive)
      return ResourceTemplate_Variable_Reference
   with Inline;

   type ResourceTemplate_Constant_Reference
     (Element : not null access constant ResourceTemplate)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_ResourceTemplate_Constant_Reference
     (Self : aliased ResourceTemplate_Vector; Index : Positive)
      return ResourceTemplate_Constant_Reference
   with Inline;

   function Empty return Role_Vector;

   function Is_Null (Self : Role_Vector) return Boolean;

   function Length (Self : Role_Vector) return Natural;

   procedure Clear (Self : in out Role_Vector; Is_Null : Boolean := True);

   procedure Append (Self : in out Role_Vector; Value : Enum.Role);

   type Role_Variable_Reference (Element : not null access Enum.Role) is
   null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_Role_Variable_Reference
     (Self : aliased in out Role_Vector; Index : Positive)
      return Role_Variable_Reference
   with Inline;

   type Role_Constant_Reference
     (Element : not null access constant Enum.Role)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_Role_Constant_Reference
     (Self : aliased Role_Vector; Index : Positive)
      return Role_Constant_Reference
   with Inline;

   function Empty return Tool_Vector;

   function Is_Null (Self : Tool_Vector) return Boolean;

   function Length (Self : Tool_Vector) return Natural;

   procedure Clear (Self : in out Tool_Vector; Is_Null : Boolean := True);

   procedure Append (Self : in out Tool_Vector; Value : Tool);

   type Tool_Variable_Reference (Element : not null access Tool) is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_Tool_Variable_Reference
     (Self : aliased in out Tool_Vector; Index : Positive)
      return Tool_Variable_Reference
   with Inline;

   type Tool_Constant_Reference (Element : not null access constant Tool) is
   null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_Tool_Constant_Reference
     (Self : aliased Tool_Vector; Index : Positive)
      return Tool_Constant_Reference
   with Inline;

   function Empty return Prompt_Vector;

   function Is_Null (Self : Prompt_Vector) return Boolean;

   function Length (Self : Prompt_Vector) return Natural;

   procedure Clear (Self : in out Prompt_Vector; Is_Null : Boolean := True);

   procedure Append (Self : in out Prompt_Vector; Value : Prompt);

   type Prompt_Variable_Reference (Element : not null access Prompt) is
   null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_Prompt_Variable_Reference
     (Self : aliased in out Prompt_Vector; Index : Positive)
      return Prompt_Variable_Reference
   with Inline;

   type Prompt_Constant_Reference
     (Element : not null access constant Prompt)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_Prompt_Constant_Reference
     (Self : aliased Prompt_Vector; Index : Positive)
      return Prompt_Constant_Reference
   with Inline;

   function Empty return ContentBlock_Vector;

   function Is_Null (Self : ContentBlock_Vector) return Boolean;

   function Length (Self : ContentBlock_Vector) return Natural;

   procedure Clear
     (Self : in out ContentBlock_Vector; Is_Null : Boolean := True);

   procedure Append (Self : in out ContentBlock_Vector; Value : ContentBlock);

   type ContentBlock_Variable_Reference
     (Element : not null access ContentBlock)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_ContentBlock_Variable_Reference
     (Self : aliased in out ContentBlock_Vector; Index : Positive)
      return ContentBlock_Variable_Reference
   with Inline;

   type ContentBlock_Constant_Reference
     (Element : not null access constant ContentBlock)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_ContentBlock_Constant_Reference
     (Self : aliased ContentBlock_Vector; Index : Positive)
      return ContentBlock_Constant_Reference
   with Inline;

   function Empty return PromptMessage_Vector;

   function Is_Null (Self : PromptMessage_Vector) return Boolean;

   function Length (Self : PromptMessage_Vector) return Natural;

   procedure Clear
     (Self : in out PromptMessage_Vector; Is_Null : Boolean := True);

   procedure Append
     (Self : in out PromptMessage_Vector; Value : PromptMessage);

   type PromptMessage_Variable_Reference
     (Element : not null access PromptMessage)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_PromptMessage_Variable_Reference
     (Self : aliased in out PromptMessage_Vector; Index : Positive)
      return PromptMessage_Variable_Reference
   with Inline;

   type PromptMessage_Constant_Reference
     (Element : not null access constant PromptMessage)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_PromptMessage_Constant_Reference
     (Self : aliased PromptMessage_Vector; Index : Positive)
      return PromptMessage_Constant_Reference
   with Inline;

   function Empty return Root_Vector;

   function Is_Null (Self : Root_Vector) return Boolean;

   function Length (Self : Root_Vector) return Natural;

   procedure Clear (Self : in out Root_Vector; Is_Null : Boolean := True);

   procedure Append (Self : in out Root_Vector; Value : Root);

   type Root_Variable_Reference (Element : not null access Root) is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_Root_Variable_Reference
     (Self : aliased in out Root_Vector; Index : Positive)
      return Root_Variable_Reference
   with Inline;

   type Root_Constant_Reference (Element : not null access constant Root) is
   null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_Root_Constant_Reference
     (Self : aliased Root_Vector; Index : Positive)
      return Root_Constant_Reference
   with Inline;

   function Empty return PromptArgument_Vector;

   function Is_Null (Self : PromptArgument_Vector) return Boolean;

   function Length (Self : PromptArgument_Vector) return Natural;

   procedure Clear
     (Self : in out PromptArgument_Vector; Is_Null : Boolean := True);

   procedure Append
     (Self : in out PromptArgument_Vector; Value : PromptArgument);

   type PromptArgument_Variable_Reference
     (Element : not null access PromptArgument)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_PromptArgument_Variable_Reference
     (Self : aliased in out PromptArgument_Vector; Index : Positive)
      return PromptArgument_Variable_Reference
   with Inline;

   type PromptArgument_Constant_Reference
     (Element : not null access constant PromptArgument)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_PromptArgument_Constant_Reference
     (Self : aliased PromptArgument_Vector; Index : Positive)
      return PromptArgument_Constant_Reference
   with Inline;

   function Empty return Icon_Vector;

   function Is_Null (Self : Icon_Vector) return Boolean;

   function Length (Self : Icon_Vector) return Natural;

   procedure Clear (Self : in out Icon_Vector; Is_Null : Boolean := True);

   procedure Append (Self : in out Icon_Vector; Value : Icon);

   type Icon_Variable_Reference (Element : not null access Icon) is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_Icon_Variable_Reference
     (Self : aliased in out Icon_Vector; Index : Positive)
      return Icon_Variable_Reference
   with Inline;

   type Icon_Constant_Reference (Element : not null access constant Icon) is
   null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_Icon_Constant_Reference
     (Self : aliased Icon_Vector; Index : Positive)
      return Icon_Constant_Reference
   with Inline;

   function Empty return Resource_Vector;

   function Is_Null (Self : Resource_Vector) return Boolean;

   function Length (Self : Resource_Vector) return Natural;

   procedure Clear (Self : in out Resource_Vector; Is_Null : Boolean := True);

   procedure Append (Self : in out Resource_Vector; Value : Resource);

   type Resource_Variable_Reference (Element : not null access Resource) is
   null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_Resource_Variable_Reference
     (Self : aliased in out Resource_Vector; Index : Positive)
      return Resource_Variable_Reference
   with Inline;

   type Resource_Constant_Reference
     (Element : not null access constant Resource)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_Resource_Constant_Reference
     (Self : aliased Resource_Vector; Index : Positive)
      return Resource_Constant_Reference
   with Inline;

   function Empty return ModelHint_Vector;

   function Is_Null (Self : ModelHint_Vector) return Boolean;

   function Length (Self : ModelHint_Vector) return Natural;

   procedure Clear (Self : in out ModelHint_Vector; Is_Null : Boolean := True);

   procedure Append (Self : in out ModelHint_Vector; Value : ModelHint);

   type ModelHint_Variable_Reference (Element : not null access ModelHint) is
   null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_ModelHint_Variable_Reference
     (Self : aliased in out ModelHint_Vector; Index : Positive)
      return ModelHint_Variable_Reference
   with Inline;

   type ModelHint_Constant_Reference
     (Element : not null access constant ModelHint)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_ModelHint_Constant_Reference
     (Self : aliased ModelHint_Vector; Index : Positive)
      return ModelHint_Constant_Reference
   with Inline;

   function Empty return SamplingMessage_Vector;

   function Is_Null (Self : SamplingMessage_Vector) return Boolean;

   function Length (Self : SamplingMessage_Vector) return Natural;

   procedure Clear
     (Self : in out SamplingMessage_Vector; Is_Null : Boolean := True);

   procedure Append
     (Self : in out SamplingMessage_Vector; Value : SamplingMessage);

   type SamplingMessage_Variable_Reference
     (Element : not null access SamplingMessage)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_SamplingMessage_Variable_Reference
     (Self : aliased in out SamplingMessage_Vector; Index : Positive)
      return SamplingMessage_Variable_Reference
   with Inline;

   type SamplingMessage_Constant_Reference
     (Element : not null access constant SamplingMessage)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_SamplingMessage_Constant_Reference
     (Self : aliased SamplingMessage_Vector; Index : Positive)
      return SamplingMessage_Constant_Reference
   with Inline;

   function Empty return Integer_64_Vector;

   function Is_Null (Self : Integer_64_Vector) return Boolean;

   function Length (Self : Integer_64_Vector) return Natural;

   procedure Clear
     (Self : in out Integer_64_Vector; Is_Null : Boolean := True);

   procedure Append (Self : in out Integer_64_Vector; Value : Integer_64);

   type Integer_64_Variable_Reference (Element : not null access Integer_64) is
   null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_Integer_64_Variable_Reference
     (Self : aliased in out Integer_64_Vector; Index : Positive)
      return Integer_64_Variable_Reference
   with Inline;

   type Integer_64_Constant_Reference
     (Element : not null access constant Integer_64)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_Integer_64_Constant_Reference
     (Self : aliased Integer_64_Vector; Index : Positive)
      return Integer_64_Constant_Reference
   with Inline;

private
   type ResourceTemplate_Array is
     array (Positive range <>) of aliased ResourceTemplate;
   type ResourceTemplate_Array_Access is access ResourceTemplate_Array;
   type ResourceTemplate_Vector is new Ada.Finalization.Controlled with record
      Data    : ResourceTemplate_Array_Access;
      Length  : Natural := 0;
      Is_Null : Boolean := True;
   end record;

   overriding
   procedure Adjust (Self : in out ResourceTemplate_Vector);

   overriding
   procedure Finalize (Self : in out ResourceTemplate_Vector);

   type Role_Array is array (Positive range <>) of aliased Enum.Role;
   type Role_Array_Access is access Role_Array;
   type Role_Vector is new Ada.Finalization.Controlled with record
      Data    : Role_Array_Access;
      Length  : Natural := 0;
      Is_Null : Boolean := True;
   end record;

   overriding
   procedure Adjust (Self : in out Role_Vector);

   overriding
   procedure Finalize (Self : in out Role_Vector);

   type Tool_Array is array (Positive range <>) of aliased Tool;
   type Tool_Array_Access is access Tool_Array;
   type Tool_Vector is new Ada.Finalization.Controlled with record
      Data    : Tool_Array_Access;
      Length  : Natural := 0;
      Is_Null : Boolean := True;
   end record;

   overriding
   procedure Adjust (Self : in out Tool_Vector);

   overriding
   procedure Finalize (Self : in out Tool_Vector);

   type Prompt_Array is array (Positive range <>) of aliased Prompt;
   type Prompt_Array_Access is access Prompt_Array;
   type Prompt_Vector is new Ada.Finalization.Controlled with record
      Data    : Prompt_Array_Access;
      Length  : Natural := 0;
      Is_Null : Boolean := True;
   end record;

   overriding
   procedure Adjust (Self : in out Prompt_Vector);

   overriding
   procedure Finalize (Self : in out Prompt_Vector);

   type ContentBlock_Array is
     array (Positive range <>) of aliased ContentBlock;
   type ContentBlock_Array_Access is access ContentBlock_Array;
   type ContentBlock_Vector is new Ada.Finalization.Controlled with record
      Data    : ContentBlock_Array_Access;
      Length  : Natural := 0;
      Is_Null : Boolean := True;
   end record;

   overriding
   procedure Adjust (Self : in out ContentBlock_Vector);

   overriding
   procedure Finalize (Self : in out ContentBlock_Vector);

   type PromptMessage_Array is
     array (Positive range <>) of aliased PromptMessage;
   type PromptMessage_Array_Access is access PromptMessage_Array;
   type PromptMessage_Vector is new Ada.Finalization.Controlled with record
      Data    : PromptMessage_Array_Access;
      Length  : Natural := 0;
      Is_Null : Boolean := True;
   end record;

   overriding
   procedure Adjust (Self : in out PromptMessage_Vector);

   overriding
   procedure Finalize (Self : in out PromptMessage_Vector);

   type Root_Array is array (Positive range <>) of aliased Root;
   type Root_Array_Access is access Root_Array;
   type Root_Vector is new Ada.Finalization.Controlled with record
      Data    : Root_Array_Access;
      Length  : Natural := 0;
      Is_Null : Boolean := True;
   end record;

   overriding
   procedure Adjust (Self : in out Root_Vector);

   overriding
   procedure Finalize (Self : in out Root_Vector);

   type PromptArgument_Array is
     array (Positive range <>) of aliased PromptArgument;
   type PromptArgument_Array_Access is access PromptArgument_Array;
   type PromptArgument_Vector is new Ada.Finalization.Controlled with record
      Data    : PromptArgument_Array_Access;
      Length  : Natural := 0;
      Is_Null : Boolean := True;
   end record;

   overriding
   procedure Adjust (Self : in out PromptArgument_Vector);

   overriding
   procedure Finalize (Self : in out PromptArgument_Vector);

   type Icon_Array is array (Positive range <>) of aliased Icon;
   type Icon_Array_Access is access Icon_Array;
   type Icon_Vector is new Ada.Finalization.Controlled with record
      Data    : Icon_Array_Access;
      Length  : Natural := 0;
      Is_Null : Boolean := True;
   end record;

   overriding
   procedure Adjust (Self : in out Icon_Vector);

   overriding
   procedure Finalize (Self : in out Icon_Vector);

   type Resource_Array is array (Positive range <>) of aliased Resource;
   type Resource_Array_Access is access Resource_Array;
   type Resource_Vector is new Ada.Finalization.Controlled with record
      Data    : Resource_Array_Access;
      Length  : Natural := 0;
      Is_Null : Boolean := True;
   end record;

   overriding
   procedure Adjust (Self : in out Resource_Vector);

   overriding
   procedure Finalize (Self : in out Resource_Vector);

   type ModelHint_Array is array (Positive range <>) of aliased ModelHint;
   type ModelHint_Array_Access is access ModelHint_Array;
   type ModelHint_Vector is new Ada.Finalization.Controlled with record
      Data    : ModelHint_Array_Access;
      Length  : Natural := 0;
      Is_Null : Boolean := True;
   end record;

   overriding
   procedure Adjust (Self : in out ModelHint_Vector);

   overriding
   procedure Finalize (Self : in out ModelHint_Vector);

   type SamplingMessage_Array is
     array (Positive range <>) of aliased SamplingMessage;
   type SamplingMessage_Array_Access is access SamplingMessage_Array;
   type SamplingMessage_Vector is new Ada.Finalization.Controlled with record
      Data    : SamplingMessage_Array_Access;
      Length  : Natural := 0;
      Is_Null : Boolean := True;
   end record;

   overriding
   procedure Adjust (Self : in out SamplingMessage_Vector);

   overriding
   procedure Finalize (Self : in out SamplingMessage_Vector);

   type Integer_64_Array is array (Positive range <>) of aliased Integer_64;
   type Integer_64_Array_Access is access Integer_64_Array;
   type Integer_64_Vector is new Ada.Finalization.Controlled with record
      Data    : Integer_64_Array_Access;
      Length  : Natural := 0;
      Is_Null : Boolean := True;
   end record;

   overriding
   procedure Adjust (Self : in out Integer_64_Vector);

   overriding
   procedure Finalize (Self : in out Integer_64_Vector);

end MCP.Types;
