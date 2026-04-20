@echo on

PUSHD xpu
cargo-bundle-licenses --format yaml --output ../THIRDPARTY_XPU.yml || goto :error
POPD

PUSHD parquet-rust-wrapper
cargo-bundle-licenses --format yaml --output ../THIRDPARTY_PARQUET.yml || goto :error
POPD

PUSHD wandb\vendor\wandb_orjson
cargo-bundle-licenses --format yaml --output ..\..\..\THIRDPARTY_ORJSON.yml || goto :error
POPD

%PYTHON% -m pip install --no-deps --no-build-isolation -vv .

PUSHD core
del LICENSE
copy ..\LICENSE .
go-licenses save . --save_path="./license-files" || goto :error
POPD

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
