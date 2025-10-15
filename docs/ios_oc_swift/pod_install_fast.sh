#!/bin/bash

# 文件夹路径
DIRECTORY="$HOME/.cocoapods/repos/trunk/Specs"
# DIRECTORY="$HOME/.cocoapods/repos/tsinghua-git-cocoapods/Specs"
# 要替换的字符串
OLD_STRING='": "https://github.com/'
# 替换成的新字符串
NEW_STRING='": "https://githubfast.com/'
# NEW_STRING='": "https://ghproxy.net/https://github.com/'

# 第一步：查找所有需要替换的文件并打印它们的路径
echo "Searching for .podspec.json files under $DIRECTORY..."
FILES=$(find "$DIRECTORY" -type f -name "*.podspec.json")

# 如果未找到文件，则打印消息并退出脚本
if [ -z "$FILES" ]; then
    echo "No .podspec.json files found in $DIRECTORY."
    exit 0
fi

# 第二步：对找到的文件执行替换操作
echo "Replacing strings in the found files..."
for FILE in $FILES; do
    sed -i '' "s|${OLD_STRING}|${NEW_STRING}|g" "$FILE"
    echo "Updated: $FILE"
done

# 替换完成后打印消息
echo "All occurrences of '${OLD_STRING}' have been replaced with '${NEW_STRING}' in the found .podspec.json files."
