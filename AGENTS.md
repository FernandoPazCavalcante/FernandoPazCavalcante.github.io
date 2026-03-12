# AGENTS.md - Development Guide for FernandoPazCavalcante.github.io

This file provides guidance for agentic coding agents working on this repository.

## Project Overview

This is a **Jekyll 4 static site** hosted on GitHub Pages. It uses the [`no-style-please`](https://github.com/riggraz/no-style-please) theme - a minimalist, monospace theme with dark mode by default.

## Build Commands

### With Docker (Recommended)
```bash
# Start the development server
docker compose up --build

# Site available at http://localhost:4000
```

If `Gemfile.lock` is missing, generate it first:
```bash
docker run --rm -v "$PWD":/app -w /app ruby:3.3.5-bullseye bundle lock
```

### Without Docker
```bash
# Install dependencies
bundle install

# Start development server
bundle exec jekyll serve
```

### NPM Scripts (package.json)
```bash
npm run app:install   # bundle install
npm run start:app    # bundle exec jekyll serve
npm run start        # docker-compose up
```

### Build for Production
```bash
bundle exec jekyll build --config _config.yaml
```

## CI/CD

GitHub Actions workflow at `.github/workflows/jekyll.yml` automatically builds and deploys to GitHub Pages on push to `master`. Uses Ruby 3.3.

## Architecture

### Layout Hierarchy
- `_layouts/default.html` - Base layout
- `_layouts/home.html` - Home page
- `_layouts/page.html` - Standard page
- `_layouts/post.html` - Blog posts
- `_layouts/archive.html` - Category archives

### Key Directories
- `_includes/` - Reusable HTML partials (menu_item.html, post_list.html, etc.)
- `_layouts/` - Page layouts
- `_posts/` - Blog posts (Markdown with front matter)
- `_sass/` - SASS stylesheets
- `assets/` - CSS and JavaScript files

### Configuration
- `_config.yaml` - Production config (real URL)
- `_config_docker.yaml` - Local development (url: "")

### Navigation
- `_data/menu.yaml` - Defines site navigation
- Categories are used for post filtering
- Archive pages (e.g., `nothing-archive.md`) use `layout: archive` with `which_category` front matter

## Code Style Guidelines

### Liquid Templates
- Use whitespace control (`-` in `{%-` and `-%}`) to minimize output
- Include parameters on separate lines for readability:
  ```liquid
  {%
    include post_list.html
      category=item.post_list.category
      limit=item.post_list.limit
  -%}
  ```
- Always use descriptive variable names: `include.collection`, `item.post_list`

### Front Matter (YAML)
```yaml
---
layout: post
title: "Post Title"
date: YYYY-MM-DD
category: something
---
```

### JavaScript
- Place in `assets/js/`
- Use vanilla JavaScript (no frameworks)
- Prefer const over let; avoid var

### CSS/SASS
- SASS files go in `_sass/`
- Main SCSS: `assets/css/main.scss`
- Theme SASS: `_sass/no-style-please.scss`

### General Conventions
- 2-space indentation for YAML and HTML
- Use meaningful file names (kebab-case)
- Keep includes modular and focused
- Test changes locally before committing
- Verify Docker build works if modifying Dockerfile (Ruby version must match CI: 3.3)

## Testing

This project has no formal test suite. Manual verification:

1. Run `docker compose up --build`
2. Visit http://localhost:4000
3. Verify:
   - Home page loads correctly
   - Navigation works
   - Posts display properly
   - Archive pages filter correctly
4. Check browser console for JavaScript errors
