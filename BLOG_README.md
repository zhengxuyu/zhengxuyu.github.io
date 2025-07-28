# 博客使用说明

## 概述
我已经为您的网站添加了博客功能。现在您可以通过以下方式管理您的博客：

## 文件结构
- `pages/blog.md` - 博客主页，显示所有博客文章
- `_blogs/` - 存放所有博客文章的目录
- `_posts/` - 存放新闻更新的目录（原有功能）
- `BLOG_README.md` - 本说明文档

## 如何添加新的博客文章

1. 在 `_blogs/` 目录中创建一个新的markdown文件
2. 文件名格式：`YYYY-MM-DD-title.markdown`
3. 文件开头必须包含以下YAML前置信息：

```yaml
---
layout: blog
title: 文章标题
date:   YYYY-MM-DD HH:MM:SS +0000
categories: 分类名称
---
```

4. 在YAML前置信息后添加您的文章内容

## 示例博客文章

我已经创建了示例文章：
- `_blogs/2024-12-19-welcome-to-my-blog.markdown`
- `_blogs/2024-12-19-reinforcement-learning-thoughts.markdown`

## 导航

博客页面已经添加到网站导航中，访问者可以通过点击导航栏中的"Blog"链接访问。

## 功能特性

- 自动按日期排序显示文章
- 显示文章分类标签
- 显示发布日期
- 支持文章摘要（如果启用）
- 响应式设计

## 自定义

您可以通过修改以下文件来自定义博客外观：
- `pages/blog.md` - 博客页面布局
- `_layouts/post.html` - 单篇文章的布局
- `_sass/` 目录中的样式文件

## 注意事项

- 确保所有markdown文件都使用UTF-8编码
- 文章日期格式必须正确
- 分类名称会显示在文章下方
- 如果启用了 `show_excerpts`，文章摘要会自动显示
- `_posts/` 目录用于新闻更新，`_blogs/` 目录用于博客文章
- 博客文章使用 `layout: blog`，新闻使用 `layout: post` 