#!/bin/bash

# 检查是否提供了 YAML 文件路径参数
if [ $# -eq 0 ]; then
    echo "错误：请提供 YAML 文件路径作为参数"
    echo "用法：$0 <yaml文件路径>"
    exit 1
fi

# 获取 YAML 文件路径
yaml_file="$1"

# 检查文件是否存在
if [ ! -f "$yaml_file" ]; then
    echo "错误：文件 '$yaml_file' 不存在"
    exit 1
fi

# 使用 rendercv 构建 CV
echo "正在使用 rendercv 构建 CV..."
rendercv render $yaml_file

# 检查 rendercv 命令是否成功执行
if [ $? -eq 0 ]; then
    echo "CV 构建成功完成"
else
    echo "错误：CV 构建失败"
    exit 1
fi
