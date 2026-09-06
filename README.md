# clay-on-nim

MIT-licensed Nim bindings for [Clay](https://github.com/nicbarker/clay), a C UI layout library.
Clay itself is not included in this repository.

Version `0.1.1` targets Clay revision
[`e6cc36941ab2af5d81107617039d6f527a1c660b`](https://github.com/nicbarker/clay/commit/e6cc36941ab2af5d81107617039d6f527a1c660b).
This is a post-0.14 development revision containing API additions such as
transitions. It is not ABI-compatible with the `v0.14` release header, so use
the exact supported revision.

## Setup

1. Obtain the supported Clay revision and place `clay.h` in a directory such as `third_party/clay/`.
2. Create one C source file in your application, for example `third_party/clay/clay_impl.c`:

```c
#define CLAY_IMPLEMENTATION
#include "clay.h"
```

3. Compile that file once, add its directory to the C include path, and import the binding:

```nim
{.compile: "third_party/clay/clay_impl.c".}
import clay

let requiredBytes = CLAY.minMemorySize()
```

For a command-line build, make the header visible to the C compiler:

```sh
nim c --passC:-Ithird_party/clay --path:src app.nim
```

The Clay implementation must be compiled in exactly one translation unit.

## Verification

Run the complete API-name, C/Nim ABI, and runtime smoke validation against a
checkout of the supported Clay revision:

```sh
tests/run_validation.sh <path-to-clay>
```

The ABI test compares the size and alignment of all 74 complete public value
types, plus representative field offsets, between C and Nim. The API coverage
check verifies all 42 exported Clay functions and all 75 public ABI type names,
including the opaque `Clay_Context` type.

## License

The Nim binding is distributed under the [MIT License](LICENSE).
Clay is created by Nic Barker and is distributed under the zlib/libpng license.
When you obtain or redistribute Clay itself, retain its upstream license notice.
