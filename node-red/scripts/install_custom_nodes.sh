#!/bin/sh
TARGET_DIR="$1"
[ -z "$TARGET_DIR" ] && TARGET_DIR="/data"

for dir in "$TARGET_DIR/custom-nodes"/*/ ; do
    if [ -d "$dir" ]; then
        echo "Installing custom node from $dir..."
        npm install --prefix "$TARGET_DIR" "$dir"
    fi
done
