#!/bin/bash
set -xe
OS=$(uname)

# macOS인 경우에만 실행
# if [ "$OS" == "Darwin" ]; then
#     sed -i '' 's|// swift-tools-version: 5.9|// swift-tools-version: 5.7.1|' apple_stats/Package.swift
#     sed -i '' 's|\.macOS(.v10_14)|\.macOS(.v10_13)|' apple_stats/Package.swift
# fi

${PYTHON} -m pip install . -vv
