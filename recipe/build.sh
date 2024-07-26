#!/bin/bash
set -xe
OS=$(uname)

# macOS인 경우에만 실행
if [ "$OS" == "Darwin" ]; then
    pwd
    ls -al
    xcode-select -p
    git clone https://github.com/alexey-lysiuk/macos-sdk.git
    mv ./macos-sdk/MacOSX14.5.sdk /Applications/Xcode_14.2.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/
    export CONDA_BUILD_SYSROOT='/Applications/Xcode_14.2.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX14.5.sdk'
    export SDKROOT='/Applications/Xcode_14.2.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX14.5.sdk'
    export MACOSX_DEPLOYMENT_TARGET='14.5'
    export MACOSX_SDK_VERSION='14.5'
    export c_stdlib_version='14.5'
    plutil -replace MinimumSDKVersion -string 14.5 /Applications/Xcode_14.2.app/Contents/Developer/Platforms/MacOSX.platform/Info.plist
    plutil -replace DTSDKName -string macosx14.5internal /Applications/Xcode_14.2.app/Contents/Developer/Platforms/MacOSX.platform/Info.plist
fi

${PYTHON} -m pip install . -vv
