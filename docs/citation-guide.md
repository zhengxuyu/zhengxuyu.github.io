# Citation System Guide

This guide explains how to use the citation system in your blog posts on GitHub Pages.

## Overview

Since GitHub Pages doesn't support custom Ruby plugins, we've implemented a static citation system using:
- YAML data files for storing references
- Liquid includes for formatting citations and references
- Markdown-compatible syntax

## Adding References

### 1. Add to References Database

Edit `_data/references.yml` to add new references:

```yaml
your_reference_key:
  title: "Your Paper Title"
  authors: "Author, A., & Author, B."
  journal: "Journal Name"
  volume: "1"
  number: "1"
  pages: "1-10"
  year: "2024"
  doi: "10.1234/example"
  url: "https://example.com"
  type: "article"  # article, inproceedings, incollection, thesis
```

### 2. Use in Blog Posts

In your blog post front matter, add the references you want to cite:

```yaml
---
layout: blog-post
title: "Your Blog Post"
references:
  - your_reference_key
  - another_reference_key
---
```

### 3. Cite in Content

Use the citation include in your markdown content:

```markdown
This is a citation {% include citation.html key="your_reference_key" %}.

Another citation {% include citation.html key="another_reference_key" %}.
```

### 4. Display References

Add this at the end of your blog post content:

```markdown
{% include references.html %}
```

## Citation Styles

The system supports different citation styles:

### APA Style (Default)
```liquid
{% include reference_formatter.html key="your_reference_key" style="apa" %}
```

### BibTeX Style
```liquid
{% include reference_formatter.html key="your_reference_key" style="bibtex" %}
```

## Example Blog Post

```markdown
---
layout: blog-post
title: "Example Blog Post"
references:
  - beck_tutorial_2025
  - wang_learning_2016
---

## Introduction

This is an example blog post that demonstrates the citation system.

The work by {% include citation.html key="beck_tutorial_2025" %} provides a comprehensive overview of meta-reinforcement learning.

Another important contribution is {% include citation.html key="wang_learning_2016" %}, which explores learning to reinforcement learn.

## Conclusion

This demonstrates how to use the citation system effectively.

{% include references.html %}
```

## Benefits

1. **GitHub Pages Compatible**: No custom plugins required
2. **Consistent Formatting**: All citations follow the same style
3. **Easy Maintenance**: Centralized reference database
4. **Multiple Styles**: Support for different citation formats
5. **Automatic Linking**: Citations link to references section

## Tips

- Keep reference keys short and descriptive
- Use consistent author formatting
- Include DOIs when available for better linking
- Test your citations locally before pushing to GitHub 