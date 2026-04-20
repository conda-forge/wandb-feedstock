#!/bin/bash

set -o xtrace -o nounset -o pipefail -o errexit

# Bundle Rust licenses for xpu (formerly gpu_stats) and parquet-rust-wrapper
pushd xpu
cargo-bundle-licenses --format yaml --output ../THIRDPARTY_XPU.yml
popd

pushd parquet-rust-wrapper
cargo-bundle-licenses --format yaml --output ../THIRDPARTY_PARQUET.yml
popd

if [[ "$(uname)" != "Darwin" ]]; then
    pushd wandb/vendor/wandb_orjson
    cargo-bundle-licenses --format yaml --output ../../../THIRDPARTY_ORJSON.yml
    popd
fi

# Unset CARGO_BUILD_TARGET: conda's rust compiler activation sets it, but
# xpu/hatch.py hardcodes "target/release/" and doesn't account for the
# target-triple subdirectory that CARGO_BUILD_TARGET introduces.
unset CARGO_BUILD_TARGET

# Skip vendored orjson pyo3 extension on macOS: conda-forge's LDFLAGS
# (-Wl,-dead_strip_dylibs) strip libpython symbols pyo3 resolves at
# runtime, causing a segfault on import. wandb falls back to stdlib json.
if [[ "$(uname)" == "Darwin" ]]; then
    export WANDB_BUILD_SKIP_ORJSON=true
fi

${PYTHON} -m pip install --no-deps --no-build-isolation -vv .

pushd core
rm LICENSE
cp ../LICENSE LICENSE
go-licenses save . --save_path="./license-files/"
popd
