#!/bin/bash
OS=$(uname)

# macOS인 경우에만 실행
if [ "$OS" == "Darwin" ]; then
    XCODE_DOWNLOAD_URL="https://developer.apple.com/services-account/download?path=/Developer_Tools/Xcode_15/Xcode_15.xip"
    XCODE_FILE_NAME="Xcode_15.xip"
    XCODE_APP_NAME="Xcode.app"
    DOWNLOAD_DIR="$HOME/Downloads"
    curl -L $XCODE_DOWNLOAD_URL -o "$DOWNLOAD_DIR/$XCODE_FILE_NAME"
    unzip "$DOWNLOAD_DIR/$XCODE_FILE_NAME" -d "$DOWNLOAD_DIR"
    mv "$DOWNLOAD_DIR/$XCODE_APP_NAME" /Applications/
fi

${PYTHON} -m pip install . -vv
