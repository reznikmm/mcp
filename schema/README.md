# Generating the MCP binding

`schema.json` is the supplied MCP JSON Schema (Draft 2020-12, 155 definitions).
It is used directly, without rewriting or removing schema definitions.
The generator is `vss-extra/tools/json_schema`, in the sibling checkout.

## Regeneration

This binding needs the fixes in [generator.patch](generator.patch). They have
already been applied to the local `../vss-extra` checkout. For a matching,
unpatched checkout, apply them once from the MCP repository root:

```sh
patch -d ../vss-extra -p1 < schema/generator.patch
```

Build the generator from the common parent directory:

```sh
alr -C vss-extra/tools/json_schema/ build
```

Then, from the MCP repository root:

```sh
./schema/generate.sh ../vss-extra/.objs/release/tools/gen_json
alr build
alr -C testsuite run
```

Pass the actual executable path if your VSS build uses another object directory
(for example `.objs/development/tools/gen_json`). The script runs `gnatchop`
and `gnatformat` through the MCP Alire environment and replaces these six files:

- `source/mcp-types.ads` and `.adb`
- `source/mcp-types-inputs.ads` and `.adb`
- `source/mcp-types-outputs.ads` and `.adb`

The script selects `MCP.Types` as the root package, `Enum` as the nested
enumeration package, `MCP.Key_Lookups` for key lookup, and enables
`--additional-properties` to preserve extension fields in records.

## Generator fixes

The patch addresses four problems exposed by this schema:

1. Arrays with anonymous complex elements, including unions without a
   discriminator, caused `Program_Error`. They now use `Any_Value` to preserve
   the entire array as JSON events.
2. `type: ["string", "integer"]` was not recognized as `Integer_Or_String`
   because the generator expected the opposite order. Both orders now work,
   as do both orders of the nullable string type.
3. With `--additional-properties`, readers for anonymous records referred to a
   missing component. Their types now contain the component and their writers
   emit it, preserving nested extension fields.
4. Writers for negative numeric constants needed visibility of the
   `Integer_64` operators. This affects JSON-RPC error codes such as `-32700`.

`MCP.Key_Lookups` uses a linear lookup over each generated key list. It provides
the generator's required generic interface without an external hash helper.

## Mapping limitations

The generator advertises Draft 04–07 support. It reads this schema's `$defs`,
references and type declarations, but the generated binding is not a complete
Draft 2020-12 validator.

- Unions with a unique constant discriminator become Ada variant records,
  including `ClientRequest`, `ServerNotification` and `ContentBlock`.
- Seventeen unions have no supported discriminator; the generator reports
  their paths on stderr. Examples include `JSONRPCMessage`, `ServerResult`,
  `EmbeddedResource.resource`, and the elements of `ReadResourceResult.contents`.
  They use JSON event storage instead of typed alternatives. Named fallback
  types derive from `Any_Object`; their generated converters accept arbitrary
  JSON values despite that name. The contents array is stored as a whole.
- Simple named aliases do not get separate Ada declarations. For example,
  `RequestId` and `ProgressToken` fields use `Integer_Or_String`.
- Generated readers check encountered property types, enum values and constants,
  but do not check that every required property was present, nor enforce all
  schema constraints such as numeric bounds, patterns or formats.
- Optional booleans use a default value rather than a presence flag. Optional
  strings use `Is_Null`; empty optional string arrays may be omitted on output.
  The generator also treats explicit null as absent for many typed fields.
  Raw event values preserve nulls inside objects and arrays.

The runtime tests cover request IDs of both kinds, method/type discriminators,
Unicode text, content vectors, opaque resource arrays, JSON-RPC error constants,
and extension properties in both named and anonymous records.
