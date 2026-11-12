#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

set -euo pipefail

repository=$(cd "$(dirname "$0")/.." && pwd)
generator=${1:-"$repository/../vss-extra/.objs/release/tools/gen_json"}
generator=$(realpath "$generator")
temporary=$(mktemp -d)
trap 'rm -rf "$temporary"' EXIT

if [[ ! -x "$generator" ]]; then
    echo "Generator not executable: $generator" >&2
    echo "Build vss-extra/tools/json_schema, then pass its gen_json path." >&2
    exit 1
fi

cd "$repository"
"$generator" \
    --root-package MCP.Types \
    --enum-package Enum \
    --hash-package MCP.Key_Lookups \
    --additional-properties \
    --header-file schema/header.adt \
    schema/schema.json > "$temporary/generated.ada"

alr exec -- gnatchop -w -gnat2022 "$temporary/generated.ada" source
alr exec -- gnatformat --charset=utf-8 --no-subprojects -P mcp.gpr
