#!/bin/bash

# 本地开发服务器脚本

echo "启动Jekyll本地开发服务器..."

# 设置 Homebrew Ruby 的 PATH
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# 检查Docker是否可用
if command -v docker &> /dev/null; then
    echo "使用Docker启动开发服务器..."
    docker run --rm \
        -v "$PWD:/srv/jekyll" \
        -v "$PWD/vendor/bundle:/usr/local/bundle" \
        -p 4000:4000 \
        jekyll/jekyll:4.2.0 \
        jekyll serve --host 0.0.0.0 --port 4000
else
    echo "Docker不可用，使用本地Ruby启动开发服务器..."
    if command -v bundle &> /dev/null; then
        bundle exec jekyll serve --host 0.0.0.0 --port 4000
    else
        echo "错误：需要安装Docker或Ruby/Bundler"
        exit 1
    fi
fi 