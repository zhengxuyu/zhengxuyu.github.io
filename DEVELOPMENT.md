# 开发指南

这个项目是一个基于 Jekyll 的个人网站。以下是本地开发和构建的说明。

## 环境要求

- macOS (推荐)
- Ruby 3.4+ (通过 Homebrew 安装)
- Bundler

## 快速开始

### 1. 安装依赖

如果您还没有安装 Ruby，请先安装：

```bash
brew install ruby
```

然后安装项目依赖：

```bash
bundle install
```

### 2. 构建网站

使用构建脚本：

```bash
./build_local.sh
```

或者手动构建：

```bash
bundle exec jekyll build
```

### 3. 本地开发服务器

启动本地开发服务器（支持实时重载）：

```bash
./serve_local.sh
```

然后在浏览器中访问 `http://localhost:4000`

## 脚本说明

- `build_local.sh` - 构建静态网站到 `_site` 目录
- `serve_local.sh` - 启动本地开发服务器

## 故障排除

### 权限错误

如果遇到权限错误，请确保使用 Homebrew 安装的 Ruby：

```bash
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
```

### 依赖问题

如果遇到依赖问题，请删除 `vendor/bundle` 和 `Gemfile.lock`，然后重新安装：

```bash
rm -rf vendor/bundle Gemfile.lock
bundle install
```

## 部署

网站可以部署到 GitHub Pages。只需将代码推送到 GitHub 仓库，GitHub Pages 会自动构建和部署。

## 文件结构

- `_posts/` - 博客文章
- `_blogs/` - 博客页面
- `_layouts/` - 页面布局模板
- `_includes/` - 可重用的 HTML 片段
- `assets/` - 静态资源（CSS、JS、图片等）
- `pages/` - 静态页面
- `_site/` - 构建输出目录（自动生成） 