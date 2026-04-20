#!/bin/bash

set -o xtrace -o nounset -o pipefail -o errexit

# Bundle Rust licenses for xpu (formerly gpu_stats), parquet-rust-wrapper, and vendored orjson
pushd xpu
cargo-bundle-licenses --format yaml --output ../THIRDPARTY_XPU.yml
popd

pushd parquet-rust-wrapper
cargo-bundle-licenses --format yaml --output ../THIRDPARTY_PARQUET.yml
popd

pushd wandb/vendor/wandb_orjson
cargo-bundle-licenses --format yaml --output ../../../THIRDPARTY_ORJSON.yml
popd

${PYTHON} -m pip install --no-deps --no-build-isolation -vv .

pushd core
rm LICENSE
cp ../LICENSE LICENSE
go-licenses save . --save_path="./license-files/"
popd
