# MCP demos

The generated library supports both sides of JSON-RPC communication:

| Directory | Purpose |
| --- | --- |
| [server](server/README.md) | Read generated requests and write generated results for an echo tool |
| [client](client/README.md) | Write generated requests, read responses, and check the returned text |
| `common/` | Shared POSIX stdio stream adapted from Ada Language Server |

From the repository root:

```sh
alr -C demos/server build
alr -C demos/client build
./demos/client/run.sh "Привіт з Ada!"
```

Expected terminal output:

```text
Protocol: 2026-07-28
Tool: echo
Echo: Привіт з Ada!
```

The Bash launcher starts the two Ada executables and connects their stdin and
stdout with FIFOs in a temporary directory. The Ada programs perform all JSON serialization,
parsing, request dispatch, and response validation. Human-readable client output
goes to stderr. When the client exits, its pipe closes and the server receives
EOF and exits normally.

Running the demos requires Bash, GNU `timeout`, `mkfifo` and `mktemp`.
Python 3 is only used by the integration test suites.

Both demos use the supplied schema's `server/discover` and per-request metadata
model and target version `2026-07-28`. They are synchronous POSIX examples,
tested on Linux. They do not implement subscriptions or the older initialization
handshake.

Run the tests after building both demos:

```sh
alr -C demos/server test
alr -C demos/client test
```
