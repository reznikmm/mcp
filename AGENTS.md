# AGENTS.md

## Purpose

MCP is an Ada 2022 library providing generated Model Context Protocol types
and JSON converters for both clients and servers. Separate stdio demos show
request dispatch on the server and typed request/response handling on the client.

## Repository Map

- `source/`: Core library logic (`MCP.*` packages)
- `schema/`: Supplied JSON Schema, generator patch, regeneration script and notes
- `testsuite/`: Separate test suite crate
- `demos/server/`: Ada stdio echo server and its integration tests
- `demos/client/`: Ada stdio client, Bash launcher and its integration tests
- `demos/common/`: Shared stdio stream adapted from Ada Language Server
- `config/`: Build-time configuration artifacts written by Alire (do not edit manually)
- `.obj/`, `.lib/`: Build outputs (do not edit manually)

## Ground Rules

- Don't suppress exception with `null;` exception handler
   (one exception is `Libadalang.Common.Property_Error`).
- Don't introduce extra (sub-)type conversions, like Integer to Natural.
- Preserve existing style and naming conventions in nearby code. Don't use abbreviations.
- Keep protocol logic in Ada. Use Bash for launchers and simple process/file
  orchestration; do not introduce Python where Ada or shell tools suffice.
- Keep protocol stdout limited to JSON-RPC messages; write diagnostics to stderr.
- Preserve copyright and license notices in code adapted from other projects.

## Build And Test Commands

Run from repository root unless noted otherwise.

- Compile core library:
  - `alr build`
- Compile/check one file (`<unit>.adb`):
  - `alr exec -- gprbuild -q -f -c -u -gnatc -P mcp.gpr <unit>.adb '-cargs:ada' -gnatef`
- Fix code style warnings, force code style after edit:
  - `alr exec -- gnatformat --charset=utf-8 --no-subprojects -P mcp.gpr`
- Build and run testsuite:
  - `alr -C testsuite/ run`
- Build both demos before running their integration tests:
  - `alr -C demos/server build`
  - `alr -C demos/client build`
- Run the client against the server (Bash and GNU `timeout` required):
  - `./demos/client/run.sh "Привіт з Ada!"`
- Run demo integration tests (existing test suites use Python 3):
  - `alr -C demos/server test`
  - `alr -C demos/client test`
- Check launcher syntax:
  - `bash -n demos/client/run.sh`
- Format a demo after editing its Ada sources:
  - `alr -C demos/server exec -- gnatformat --charset=utf-8 --no-subprojects -P mcp_demo.gpr`
  - `alr -C demos/client exec -- gnatformat --charset=utf-8 --no-subprojects -P mcp_client_demo.gpr`

## Generated Binding

- `source/mcp-types*.ad[sb]` are generated. Change the generator and regenerate
  them instead of hand-editing generated code.
- Follow `schema/README.md` for the required generator fixes and known mapping
  limitations. Preserve the supplied `schema/schema.json`.
- Build the generator with `alr -C ../vss-extra/tools/json_schema build`, then
  run `./schema/generate.sh /path/to/gen_json` from this repository.
- After regeneration, build the library and run its JSON conversion tests.

## Change Workflow For Agents

1. Read relevant package spec/body before editing. Read `*.adb` only if reading of corresponding `*.ads` is not enough.
2. Implement the smallest viable patch.
3. Re-run compile check for touched units.
4. Run targeted runtime/test command when behavior changes.
   For launcher changes, also check failure/timeout cleanup and run the demos
   together. Changes to `demos/common/` require rebuilding both demos.
5. Report exactly what changed and what was validated.

## Ada-Specific Notes

- Use predefined Ada container packages
  (for example, `Ada.Containers.Hashed_Sets`). Don't use Indefinite containers.
- Use Ada 2022 syntax if you can.

## Output And Error Handling Expectations

- Diagnostics should be actionable and include path/context when possible.

## When Unsure

- Prefer conservative changes.
- Ask for clarification before large architectural rewrites.
- Document assumptions in the final update.
