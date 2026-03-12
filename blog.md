---
layout: page
title: Blog
---

{%- assign posts = site.posts -%}

{%- if posts.size > 0 -%}
<ul class="blog-list">
  {%- for post in posts -%}
    <li>
      <span class="blog-date">{{ post.date | date: site.theme_config.date_format }}</span>
      <a href="{{ post.url | relative_url }}">{{ post.title | downcase }}</a>
      {%- if post.category -%}
        <span class="blog-category">[{{ post.category }}]</span>
      {%- endif -%}
    </li>
  {%- endfor -%}
</ul>
{%- else -%}
<p>No posts yet. Check back soon.</p>
{%- endif -%}
