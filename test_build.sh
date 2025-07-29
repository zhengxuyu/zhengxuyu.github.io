#!/bin/bash

echo "Testing Jekyll build for GitHub Pages compatibility..."

# Install dependencies
bundle install

# Test the build
bundle exec jekyll build --safe

if [ $? -eq 0 ]; then
    echo "✅ Build successful! The site should deploy to GitHub Pages without issues."
else
    echo "❌ Build failed. Please check the error messages above."
    exit 1
fi 