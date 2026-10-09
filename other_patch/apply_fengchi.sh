#!/bin/bash
# 当前位置：仓库根目录 $GITHUB_WORKSPACE
# 进入内核源码目录 kernel_workspace
cd kernel_workspace

PATCH_FILE="$GITHUB_WORKSPACE/other_patch/fengchi.patch"

echo "=== 开始应用风驰补丁 ==="
if [ -f "$PATCH_FILE" ]; then
    echo "找到补丁文件：$PATCH_FILE"
    git apply --check "$PATCH_FILE"
    git apply "$PATCH_FILE"
    scripts/config --enable CONFIG_OPLUS_SCHED
    scripts/config --enable CONFIG_OPLUS_GAME_OPT
    echo "✅ 风驰补丁应用完成"
else
    echo "⚠️ 补丁文件不存在，跳过打补丁"
fi
