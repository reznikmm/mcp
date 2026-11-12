MCP
========

[![Build with Alire](https://github.com/reznikmm/mcp/actions/workflows/alire.yml/badge.svg)](https://github.com/reznikmm/mcp/actions/workflows/alire.yml)
[![REUSE status](https://api.reuse.software/badge/github.com/reznikmm/mcp)](https://api.reuse.software/info/github.com/reznikmm/mcp)

Ada 2022 types and JSON converters for the Model Context Protocol (MCP),
packaged as an Alire library crate.

## What Is Included

The binding is generated from the supplied `schema/schema.json`:

- `MCP.Types`: records, optional values, enumerations, unions and vectors
- `MCP.Types.Inputs`: `Input_<Type>` procedures using VSS JSON pull readers
- `MCP.Types.Outputs`: `Output_<Type>` procedures using VSS JSON content handlers

`MCP.Key_Lookups` supplies key lookup for the generated readers. The library
provides the data binding layer for clients and servers; the separate demos
implement a stdio exchange using that layer. See [schema/README.md](schema/README.md)
for regeneration, generator fixes and current mapping limitations.

## Requirements

- [Alire](https://alire.ada.dev/)
- GNAT toolchain compatible with Ada 2022 (tested with GNAT 16.1.0)
- To run the demos together: Bash, GNU `timeout`, `mkfifo` and `mktemp`
- To run the demo integration test suites: Python 3

## Build And Test

From repository root:

```sh
alr build
alr test
```

Run testsuite crate directly:

```sh
alr -C testsuite run
```

## Using the Binding

Add `with "mcp";` to your GPR project and import the generated packages.
For a VSS reader positioned on the first JSON value:

```ada
declare
   Value   : MCP.Types.ClientRequest;
   Success : Boolean := True;
begin
   MCP.Types.Inputs.Input_ClientRequest (Reader, Value, Success);
   if Success then
      MCP.Types.Outputs.Output_ClientRequest (Writer, Value);
   end if;
end;
```

The caller handles document boundaries and checks reader/writer errors.
The [JSON tests](testsuite/src/test_json.adb) show complete in-memory examples.

## Stdio Demos

The [server](demos/server/README.md) and [client](demos/client/README.md)
demos show both sides of the generated binding. The server provides an echo
tool; the Ada client discovers the server, lists tools, calls echo, and checks
its response. Both use the shared stdio stream adapted from Ada Language Server.

```sh
alr -C demos/server build
alr -C demos/client build
./demos/client/run.sh "Привіт з Ada!"
alr -C demos/server test
alr -C demos/client test
```

The Bash launcher connects the two Ada executables using FIFOs, checks their
exit statuses, and cleans up processes and temporary files on failure or timeout.
The protocol exchange runs in Ada. See [demos/README.md](demos/README.md) for
the source layout and transport setup.

## Maintainer

[Max Reznik](https://github.com/reznikmm)

## License

The library is licensed under Apache-2.0 WITH LLVM-exception.
See `LICENSES/` and `REUSE.toml`.

