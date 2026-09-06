#!/usr/bin/env python3
"""Check that clay-on-nim names every exported function and public ABI type."""

from __future__ import annotations

import re
import sys
from pathlib import Path


def fail(message: str, names: set[str]) -> None:
    if names:
        print(f"{message}: {', '.join(sorted(names))}", file=sys.stderr)
        raise SystemExit(1)


def main() -> None:
    if len(sys.argv) != 3:
        print("usage: check_api_coverage.py <clay.h> <clay.nim>", file=sys.stderr)
        raise SystemExit(2)

    header = Path(sys.argv[1]).read_text(encoding="utf-8")
    binding = Path(sys.argv[2]).read_text(encoding="utf-8")
    declarations = header.split("#ifdef CLAY_IMPLEMENTATION", 1)[0]
    public_types = declarations.split("// Function Forward Declarations", 1)[0]

    exported_functions = set(
        re.findall(
            r"^CLAY_DLL_EXPORT[^\n]*?\b(Clay_[A-Za-z0-9_]+)\s*\(",
            declarations,
            flags=re.MULTILINE,
        )
    )
    imported_symbols = set(re.findall(r'importc:\s*"([^"]+)"', binding))
    fail("missing exported functions", exported_functions - imported_symbols)
    imported_functions = set(
        re.findall(
            r"^proc\s+[^\n]*?importc:\s*\"([^\"]+)\"",
            binding,
            flags=re.MULTILINE,
        )
    )
    stale_functions = {
        name for name in imported_functions if name not in declarations
    }
    fail("imported functions absent from the supported header", stale_functions)

    tagged_types = set(
        re.findall(
            r"typedef\s+(?:struct|union)\s+(Clay_[A-Za-z0-9_]+)\b",
            public_types,
        )
    )
    anonymous_types = set(
        re.findall(r"}\s*(Clay_[A-Za-z0-9_]+)\s*;", public_types)
    )
    wrapper_inputs = set(
        re.findall(r"CLAY__WRAPPER_STRUCT\((Clay_[A-Za-z0-9_]+)\)", public_types)
    )
    wrapper_types = {f"Clay__{name}Wrapper" for name in wrapper_inputs}
    header_types = tagged_types | anonymous_types | wrapper_types

    explicit_binding_types = set(
        re.findall(
            r"^\s*[A-Za-z0-9_]+\*?\s*\{\.importc:\s*\"([^\"]+)\"",
            binding,
            flags=re.MULTILINE,
        )
    )
    implicit_binding_types = set(
        re.findall(
            r"^\s*(Clay_[A-Za-z0-9_]+)\*?\s*\{\.importc(?:,|\.)",
            binding,
            flags=re.MULTILINE,
        )
    )
    alias_binding_types = set(
        re.findall(
            r"^\s*(Clay_[A-Za-z0-9_]+)\*?\s*=",
            binding,
            flags=re.MULTILINE,
        )
    )
    bound_types = explicit_binding_types | implicit_binding_types | alias_binding_types
    fail("missing public ABI types", header_types - bound_types)

    print(
        f"API coverage OK: {len(exported_functions)} exported functions, "
        f"{len(header_types)} public ABI types"
    )


if __name__ == "__main__":
    main()
