#!/bin/bash

set -o xtrace -o nounset -o pipefail -o errexit

# Bundle Rust licenses for symon (formerly xpu) and parquet-rust-wrapper
pushd symon
cargo-bundle-licenses --format yaml --output ../THIRDPARTY_SYMON.yml
popd

pushd parquet-rust-wrapper
cargo-bundle-licenses --format yaml --output ../THIRDPARTY_PARQUET.yml
popd

${PYTHON} -m pip install --no-deps --no-build-isolation -vv .

pushd core
rm LICENSE
cp ../LICENSE LICENSE
go-licenses save . --save_path="./license-files/"
popd
