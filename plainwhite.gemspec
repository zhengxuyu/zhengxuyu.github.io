# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "plainwhite"
  spec.version       = "0.9"
  spec.authors       = ["Samarjeet"]
  spec.email         = ["thelehhman@gmail.com"]

  spec.summary       = "A portfolio style jekyll theme for writers"
  spec.homepage      = "https://thelehhman.com/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|404.html|sitemap.xml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.3.0"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.8.0"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.4.0"

  spec.add_development_dependency "bundler", "~> 2.7.0"
  spec.add_development_dependency "rake", "~> 13.0"
end
