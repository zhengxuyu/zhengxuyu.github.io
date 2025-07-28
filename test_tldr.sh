#!/bin/bash

echo "🧪 TL;DR功能测试脚本"
echo "=================="

# 检查Jekyll服务器是否运行
echo "1. 检查Jekyll服务器状态..."
if curl -s -o /dev/null -w "%{http_code}" http://localhost:4000 | grep -q "200"; then
    echo "✅ Jekyll服务器运行正常 (http://localhost:4000)"
else
    echo "❌ Jekyll服务器未运行，请先启动服务器"
    exit 1
fi

# 检查生成的页面
echo ""
echo "2. 检查生成的页面..."

# 检查首页
if grep -q "post-tldr" _site/index.html; then
    echo "✅ 首页包含TL;DR内容"
else
    echo "❌ 首页缺少TL;DR内容"
fi

# 检查博客列表页面
if grep -q "post-tldr" _site/pages/blog/index.html; then
    echo "✅ 博客列表页面包含TL;DR内容"
else
    echo "❌ 博客列表页面缺少TL;DR内容"
fi

# 检查博客文章页面
if grep -q "post-tldr" _site/blog/tldr-test/index.html; then
    echo "✅ 博客文章页面包含TL;DR内容"
else
    echo "❌ 博客文章页面缺少TL;DR内容"
fi

# 检查CSS样式
echo ""
echo "3. 检查CSS样式..."
if grep -q "\.post-tldr" _site/assets/css/style.css; then
    echo "✅ TL;DR样式已生成"
else
    echo "❌ TL;DR样式未生成"
fi

# 检查具体样式属性
if grep -q "border-left: 4px solid #007bff" _site/assets/css/style.css; then
    echo "✅ TL;DR蓝色左边框样式正确"
else
    echo "❌ TL;DR左边框样式有问题"
fi

# 显示访问链接
echo ""
echo "4. 访问链接："
echo "🏠 首页: http://localhost:4000"
echo "📝 博客列表: http://localhost:4000/pages/blog/"
echo "📄 测试文章: http://localhost:4000/blog/tldr-test/"
echo "📄 示例文章: http://localhost:4000/blog/test-time-scaling-rl-in-context-learning/"

echo ""
echo "🎉 TL;DR功能测试完成！"
echo "请在浏览器中打开上述链接查看效果。" 