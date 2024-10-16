#!/bin/bash

set -o xtrace -o nounset -o pipefail -o errexit

pushd nvidia_gpu_stats 
cargo-bundle-licenses --format yaml --output ../THIRDPARTY.yml
popd

${PYTHON} -m pip install --no-deps --no-build-isolation -vv .

pushd core 
cp ../LICENSE .
ls
go-licenses save . --save_path="./license-files/"
popd
