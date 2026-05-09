# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Install dependencies
bundle install

# Local development server (http://localhost:4000)
bundle exec jekyll serve

# Build static site to _site/
bundle exec jekyll build
```

## Architecture

This is a Jekyll-based GitHub Pages site using the [`jekyll-theme-console`](https://github.com/b2a3e8/jekyll-theme-console) remote theme with `style: dark`.

**Navigation** is controlled by `header_pages` in `_config.yml` — add a page filename there to include it in the header nav.

**Layouts** in `_layouts/` override the theme defaults:
- `default.html` — base layout; wraps everything, contains the CSP headers
- `home.html` — extends default; renders page content then auto-lists all posts by date
- `page.html` and `post.html` — standard content pages/posts

**Posts** live in `_posts/` with the naming convention `YYYY-MM-DD-slug.md` and frontmatter `layout: post`. A blank `template.md` is included for reference.

**Apps submodule** — `apps/` is a git submodule pointing to [strbck/simple-html](https://github.com/strbck/simple-html), a collection of self-contained HTML/JS applets. The `/apps/` page (`apps.md`) auto-discovers HTML files under `apps/` using a Liquid `where_exp` filter on `site.static_files`. To add metadata (title/description) for a new applet, add an entry to `_data/apps.yml` (keyed by `file` = filename).

**Content Security Policy** is defined inline in `_layouts/default.html`. If a page needs to load external resources (scripts, iframes, fonts), the CSP there must be updated to allow the new source.

**Google Analytics** is wired via the `google_analytics` key in `_config.yml` — the theme handles injection automatically.
