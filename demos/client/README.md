# Ada MCP stdio client demo

This example uses the MCP library as a client. It constructs Ada request
records, serializes them with `MCP.Types.Outputs`, and parses replies with
`MCP.Types.Inputs`.

## Build and run

From the repository root, with the sibling VSS checkouts and an Ada 2022 toolchain:

```sh
alr -C demos/server build
alr -C demos/client build
./demos/client/run.sh "Привіт з Ada!"
```

The Bash launcher connects the client and server executables with two FIFOs
in a temporary directory. It only manages processes and pipes; the protocol
exchange is implemented in Ada. Bash, GNU `timeout`, `mkfifo`, `mktemp` and a
POSIX system are required. Python 3 is only needed for the integration tests.

You can override either executable and the process timeout:

```sh
./demos/client/run.sh --server /path/to/server --timeout 10 "Hello!"
```

The selected server must implement the same schema/version and advertise the
echo tool. The demo targets `2026-07-28`; it does not perform the older
`initialize` handshake.

## Exchange

1. Send a generated `DiscoverRequest` with integer ID `1`, and read a
   `DiscoverResultResponse`. Check the supported version and tool capability.
2. Send a generated `ListToolsRequest` with string ID `"tools"`, and read a
   `ListToolsResultResponse`. Check that `echo` is advertised.
3. Send a generated `CallToolRequest` with string ID `"echo"`. Read the response,
   decode its result as `CallToolResult`, and check the returned text.

The result union in `CallToolResultResponse` currently uses opaque JSON event
storage. `Read_Call_Result` in the main procedure shows how to decode that field
with the generated converter once the concrete result type is known.

Every request includes protocol version and client capabilities in `_meta`.
The client checks JSON-RPC envelopes and response IDs before using generated
response readers. Invalid replies, remote errors, an unavailable echo tool,
and a text mismatch produce diagnostics and a nonzero exit status. This is a
synchronous example; incoming server notifications are not supported.

The executable itself communicates over stdin/stdout. Only newline-delimited
JSON goes to stdout; status and returned echo text go to stderr:

```text
Protocol: 2026-07-28
Tool: echo
Echo: Привіт з Ada!
```

Exiting the client closes its output pipe, which lets the server shut down on
EOF. The launcher checks both exit statuses, enforces a timeout, and cleans up
remaining child processes and temporary FIFOs on failure or interruption.
The launcher returns status 124 if the timeout expires.

## Tests and sources

After building both demos:

```sh
alr -C demos/client test
```

The JSON tests run the real Ada client/server pair and feed controlled responses to
the client. They cover generated request fields, buffered replies, Unicode,
empty and large text, mismatched IDs, remote errors, invalid envelopes,
unsupported versions, missing tools, changed echo text, and premature EOF.
The Bash launcher tests check argument quoting, failures, timeouts, interruption,
and cleanup of peer processes and temporary FIFOs.

- `source/mcp_client_demo.adb`: typed requests and application-level checks.
- `source/demo-rpc.ad[sb]`: generated serialization and response validation.
- `source/demo-connection.ad[sb]`: buffered newline framing.
- `../common/`: shared stdio stream, also used by the server.
- `run.sh`: Bash process and FIFO wiring, without JSON handling.
