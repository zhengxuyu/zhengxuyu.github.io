#!/bin/bash

# 本地构建脚本 - 使用Docker避免Ruby环境问题

echo "开始构建Jekyll网站..."

# 检查Docker是否可用
if command -v docker &> /dev/null; then
    echo "使用Docker构建..."
    docker run --rm \
        -v "$PWD:/srv/jekyll" \
        -v "$PWD/vendor/bundle:/usr/local/bundle" \
        jekyll/jekyll:4.2.0 \
        jekyll build --destination _site
else
    echo "Docker不可用，尝试使用本地Ruby..."
    if command -v bundle &> /dev/null; then
        bundle exec jekyll build
    else
        echo "错误：需要安装Docker或Ruby/Bundler"
        echo "请选择以下选项之一："
        echo "1. 安装Docker: https://docs.docker.com/get-docker/"
        echo "2. 安装Ruby和Bundler"
        echo "3. 推送到GitHub让GitHub Pages自动构建"
        exit 1
    fi
fi

echo "构建完成！"
echo "您可以在浏览器中打开 _site/index.html 查看结果" 