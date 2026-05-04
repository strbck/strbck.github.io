---
title: /apps
layout: page
permalink: /apps/
---

Simple, self-contained HTML applets. Click any to open directly in your browser — no install, no dependencies.

Source: [strbck/simple-html](https://github.com/strbck/simple-html)

---

{% assign app_files = site.static_files | where_exp: "f", "f.path contains '/apps/'" | where_exp: "f", "f.extname == '.html'" %}
{% for file in app_files %}
{% assign meta = site.data.apps | where: "file", file.name | first %}
{% assign display_title = meta.title | default: file.basename %}
{% assign display_desc = meta.desc | default: "" %}
[{{ display_title }}]({{ file.path | relative_url }}){% if display_desc != "" %} — {{ display_desc }}{% endif %}
{% endfor %}
