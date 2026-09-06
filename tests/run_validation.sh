#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "usage: tests/run_validation.sh <path-to-clay>" >&2
  exit 2
fi

clay_root="$1"
clay_header="$clay_root/clay.h"
if [[ ! -f "$clay_header" ]]; then
  echo "missing Clay header: $clay_header" >&2
  exit 2
fi

build_root="$(mktemp -d "${TMPDIR:-/tmp}/clayonnim-validation.XXXXXX")"
trap 'rm -rf "$build_root"' EXIT

python3 tools/check_api_coverage.py "$clay_header" src/clay.nim

cc -std=c11 -I"$clay_root" tests/abi.c -o "$build_root/abi-c"
"$build_root/abi-c" > "$build_root/abi-c.txt"
nim c -r --hints:off --warnings:off --path:src \
  --passC:"-I$clay_root" --nimcache:"$build_root/nimcache-abi" \
  --out:"$build_root/abi-nim" tests/abi.nim > "$build_root/abi-nim.txt"
diff -u "$build_root/abi-c.txt" "$build_root/abi-nim.txt"

cc -std=c11 -I"$clay_root" -c tests/clay_impl.c -o "$build_root/clay_impl.o"
nim c -r --hints:off --warnings:off --path:src \
  --passC:"-I$clay_root" --passL:"$build_root/clay_impl.o" \
  --nimcache:"$build_root/nimcache-smoke" --out:"$build_root/smoke" \
  tests/smoke.nim

echo "Clay API, ABI, and smoke validation passed"
