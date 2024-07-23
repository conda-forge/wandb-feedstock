#!/bin/bash
set -xe
OS=$(uname)

# macOS인 경우에만 실행
if [ "$OS" == "Darwin" ]; then
    XCODE_DOWNLOAD_URL="https://developer.apple.com/services-account/download?path=/Developer_Tools/Xcode_15/Xcode_15.xip"
    XCODE_FILE_NAME="Xcode_15.xip"
    XCODE_APP_NAME="Xcode.app"
    DOWNLOAD_DIR="$HOME/Downloads"
    mkdir -p "$DOWNLOAD_DIR"
    curl -s -L $XCODE_DOWNLOAD_URL -o "$DOWNLOAD_DIR/$XCODE_FILE_NAME"
    unzip "$DOWNLOAD_DIR/$XCODE_FILE_NAME" -d "$DOWNLOAD_DIR"
    mv "$DOWNLOAD_DIR/$XCODE_APP_NAME" /Applications/
    ls "/Applications/$XCODE_APP_NAME"
    ls "/Applications/$XCODE_APP_NAME/Contents"
    ls "/Applications/$XCODE_APP_NAME/Contents/Developer"
    ls "/Applications/$XCODE_APP_NAME/Contents/Developer/Platforms"
    ls "/Applications/$XCODE_APP_NAME/Contents/Developer/Platforms/MacOSX.platform"
    ls "/Applications/$XCODE_APP_NAME/Contents/Developer/Platforms/MacOSX.platform/Developer"
    ls "/Applications/$XCODE_APP_NAME/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs"

fi

${PYTHON} -m pip install . -vv
