---
layout: post
title: Blog
date:   2024-12-19 00:00:00 +0000
---

# Blog Posts

Here you can find all my blog posts and thoughts on research, technology, and industry insights:

{%- if site.blogs.size > 0 -%}
<ul class="posts">
    {%- for post in site.blogs -%}
    <li>
        {%- assign date_format = site.plainwhite.date_format | default: "%b %-d, %Y" -%}
        <a class="post-link" href="{{ post.url | relative_url }}">
            <h2 class="post-title">{{ post.title | escape }}</h2>
        </a>
        <div class="post-meta">
            <ul class="post-categories">
                {%- for tag in post.categories -%}
                <li>{{ tag }}</li>
                {%- endfor -%}
            </ul>
            <div class="post-date">
                <i class="icon-calendar"></i>
                {{ post.date | date: date_format }}
            </div>
        </div>
        <div class="post">
            {%- if site.show_excerpts -%}
            {{ post.excerpt }}
            {%- endif -%}
        </div>
    </li>
    {%- endfor -%}
</ul>
{%- else -%}
<p>No blog posts available yet.</p>
{%- endif -%} 