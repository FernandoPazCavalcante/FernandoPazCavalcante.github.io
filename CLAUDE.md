# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Running the Site

**With Docker (preferred):**
```bash
docker compose up --build
```
Site available at http://localhost:4000. Uses `_config_docker.yaml` which sets `url: ""` for local dev.

If `Gemfile.lock` is missing, generate it first:
```bash
docker run --rm -v "$PWD":/app -w /app ruby:3.3.5-bullseye bundle lock
```

**Without Docker:**
```bash
bundle install
bundle exec jekyll serve
```

## Architecture

This is a Jekyll 4 static site using the [`no-style-please`](https://github.com/riggraz/no-style-please) theme — minimalist, monospace, dark mode by default.

**Layout hierarchy:** `default.html` is the base. All other layouts (`home`, `page`, `post`, `archive`) extend it.

**Navigation** is driven by `_data/menu.yaml`. Menu entries can link to pages or render inline post lists filtered by category. The `menu_item.html` include is recursive and supports nesting.

**Post categories** are used for filtering. Category-specific archives are separate pages (e.g. `nothing-archive.md`) using `layout: archive` with a `which_category` front matter variable.

**Config split:** `_config.yaml` is production (with the real URL). `_config_docker.yaml` overrides only `url: ""` for local development.

**Styling** lives in `_sass/no-style-please.scss`. Dark mode uses CSS filter inversion. The `.w` class sets the max-width container (640px).

## CI/CD

GitHub Actions workflow at `.github/workflows/jekyll.yml` builds and deploys to GitHub Pages on push to `master`. Uses `ruby/setup-ruby@v1` with Ruby 3.3 (must match the Dockerfile Ruby version).
