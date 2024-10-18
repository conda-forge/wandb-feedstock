#!/bin/bash

set -o xtrace -o nounset -o pipefail -o errexit

pushd gpu_stats
cargo-bundle-licenses --format yaml --output ../THIRDPARTY.yml
popd

${PYTHON} -m pip install --no-deps --no-build-isolation -vv .

pushd core
rm LICENSE
cp ../LICENSE LICENSE
go-licenses save . --save_path="./license-files/"
popd
