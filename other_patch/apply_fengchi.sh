#!/bin/bash
cd kernel_workspace
if [ -f ../other_patch/fengchi.patch ]; then
  git apply --check ../other_patch/fengchi.patch
  git apply ../other_patch/fengchi.patch
  scripts/config --enable CONFIG_OPLUS_SCHED
  scripts/config --enable CONFIG_OPLUS_GAME_OPT
  echo "✅ 风驰补丁应用完成"
else
  echo "⚠️ 补丁文件不存在，跳过打补丁"
fi
