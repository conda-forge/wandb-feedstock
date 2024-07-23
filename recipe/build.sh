#!/bin/bash
set -xe
OS=$(uname)

# macOS인 경우에만 실행
if [ "$OS" == "Darwin" ]; then
    git clone https://github.com/alexey-lysiuk/macos-sdk.git
    mv ./macos-sdk/MacOSX14.5.sdk /Applications/Xcode_14.2.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/
    export CONDA_BUILD_SYSROOT='/Applications/Xcode_14.2.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX14.5.sdk'
    export MACOSX_DEPLOYMENT_TARGET='14.5'
fi

${PYTHON} -m pip install . -vv
