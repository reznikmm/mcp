# Ada MCP stdio server demo

A small POSIX echo server using the generated MCP binding and a stdio stream
adapted from Ada Language Server. It demonstrates the supplied schema's
`server/discover` and per-request metadata model, targeting `2026-07-28`.

## Build and run

From the MCP repository root, with the same sibling VSS checkouts used by the
library and an Ada 2022 toolchain selected:

```sh
alr -C demos/server build
./demos/server/bin/mcp_demo < demos/server/requests.jsonl
```

The example sends three requests: discover the server, list tools, then call
`echo`. The last response contains:

```json
{"jsonrpc":"2.0","id":3,"result":{"content":[{"text":"Привіт з Ada!","type":"text"}],"resultType":"complete"}}
```

For an interactive client, launch `demos/server/bin/mcp_demo` directly and keep its pipes
open. Each input/output line is one UTF-8 JSON-RPC message. The server replies
as soon as a complete line arrives. Closing stdin ends the server; a partial
line at EOF produces a diagnostic on stderr and a failing exit status.

The [Ada client demo](../client/README.md) connects to this server and exercises
all three methods using generated request writers and response readers.

## Requests

- `server/discover` advertises the protocol version and tool capability.
- `tools/list` advertises one tool, `echo`, whose arguments are an object with
  exactly one string property, `text`.
- `tools/call` returns that text as a generated `ContentBlock`.

Every request carries the metadata from the supplied schema:

```json
"params": {
  "_meta": {
    "io.modelcontextprotocol/clientCapabilities": {},
    "io.modelcontextprotocol/protocolVersion": "2026-07-28"
  }
}
```

For `tools/call`, add `"name":"echo"` and `"arguments":{"text":"Hello!"}`
alongside `_meta`. Both integer and string request IDs are supported.
Malformed JSON, invalid request envelopes, unknown methods, invalid tool
arguments, and unsupported versions produce JSON-RPC errors. Notifications
are ignored without a reply. This example implements these three methods;
it does not implement subscriptions or the older `initialize` handshake.

The framing follows the
[MCP stdio specification](https://github.com/modelcontextprotocol/modelcontextprotocol/blob/main/docs/specification/2026-07-28/basic/transports/stdio.mdx).
Only JSON-RPC messages go to stdout; diagnostics go to stderr.

## Tests

```sh
alr -C demos/server test
```

The Python standard-library tests launch the actual executable. They cover
discovery, tool listing, Unicode, escaped newlines, empty text, large messages,
messages sharing a read, fragmented UTF-8 input, immediate replies before EOF,
notification silence, EOF, invalid JSON/UTF-8, and error recovery.

## Sources and provenance

- `source/mcp_demo.adb` frames newline-delimited messages over the stdio stream.
- `source/demo-messages.adb` uses generated readers to decode requests and
  generated writers to encode results and errors. It checks the request
  envelope and the echo arguments explicitly because the generated readers
  do not perform complete schema validation.
- `../common/demo-stdio_streams.ad[sb]` and
  `../common/demo-stdio_streams-initialize.adb` are shared with the client demo
  and were adapted from
  `ada_language_server/source/common/lsp-stdio_streams.ad[sb]` and
  `lsp-stdio_streams-init_others.adb`, at commit
  `5cfd5917caae6f621d211138c3171d2ce4e81cb9`.
  The package was renamed, read errors are checked, and writes loop until all
  bytes have been sent. The demo is tested on Linux.
