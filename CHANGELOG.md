# Changelog

## v0.1.1 — 2026-09-06

- Correct the supported upstream target from the `v0.14` release to the exact
  post-0.14 Clay revision used by the binding.
- Pin CI to that revision instead of testing against a moving default branch.
- Add automated coverage checks for all exported functions and public ABI
  types.
- Compare every public value type's size and alignment, plus representative
  field offsets, between C and Nim before running the integration smoke test.

## v0.1.0 — 2026-07-30

- Initial MIT-licensed Nim bindings for Clay 0.14.
- Covers Clay's public C API, packed enum ABI, callbacks, and sizing helpers.
- Clay is intentionally not bundled; see the README for integration instructions.
