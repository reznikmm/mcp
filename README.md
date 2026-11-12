MCP
========

[![Build with Alire](https://github.com/reznikmm/mcp/actions/workflows/alire.yml/badge.svg)](https://github.com/reznikmm/mcp/actions/workflows/alire.yml)
[![REUSE status](https://api.reuse.software/badge/github.com/reznikmm/mcp)](https://api.reuse.software/info/github.com/reznikmm/mcp)

Ada project mcp packaged as an Alire crate.

## What Is Included

This repository is a minimal starting point for an Ada 2022 library project with:

- a library crate in the repository root
- a separate testsuite crate in `testsuite/`
- CI workflows for build/test (`alire.yml`) and REUSE compliance (`reuse.yml`)
- SPDX and [REUSE](https://reuse.software/) metadata (`REUSE.toml`, `LICENSES/`)
- helper script `rename.sh` to rename mcp identifiers in copied projects

Key directories and files:

- `source/` - library units (`MCP` package)
- `mcp.gpr` - root GPR project file for the library
- `alire.toml` - root crate metadata and test action
- `testsuite/` - separate Alire crate for tests
- `AGENTS.md` - repository-specific instructions for coding agents

## Requirements

- [Alire](https://alire.ada.dev/)
- GNAT toolchain compatible with Ada 2022

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

## Using This MCP

1. Create a new repository from this mcp.
2. Run `./rename.sh <your_project_name>` to rename `mcp`/`MCP`/`MCP` identifiers.
3. Adjust crate metadata in `alire.toml`.
4. Replace `source/mcp.ads` with your actual library units.

Use `./rename.sh --dry-run <your_project_name>` to preview changes.

## Maintainer

[Max Reznik](https://github.com/reznikmm)

## License

Licensed under Apache-2.0 WITH LLVM-exception. See `LICENSES/` and `REUSE.toml`.

