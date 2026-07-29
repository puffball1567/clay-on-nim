# clay-on-nim

MIT-licensed Nim bindings for [Clay](https://github.com/nicbarker/clay) 0.14, a C UI layout library.
Clay itself is not included in this repository.

## Setup

1. Obtain the Clay release you want to use and place `clay.h` in a directory such as `third_party/clay/`.
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

With the setup above, compile the implementation to an object and run the smoke test:

```sh
cc -Ithird_party/clay -c third_party/clay/clay_impl.c -o /tmp/clay_impl.o
nim c -r --passC:-Ithird_party/clay --passL:/tmp/clay_impl.o --path:src tests/smoke.nim
```

## License

The Nim binding is distributed under the [MIT License](LICENSE).
Clay is created by Nic Barker and is distributed under the zlib/libpng license.
When you obtain or redistribute Clay itself, retain its upstream license notice.
