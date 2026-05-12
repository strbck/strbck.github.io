#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: newpost \"My Post Title\""
  exit 1
fi

TITLE="$1"
DATE=$(date +%Y-%m-%d)
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g' | sed -E 's/^-+|-+$//g')
FILENAME="${DATE}-${SLUG}.md"
POSTS_DIR="_posts"

cat > "$POSTS_DIR/$FILENAME" << EOF
---
layout: post
title:  "$TITLE"
date:   $DATE 00:00:00 -0500
categories:
---

# $TITLE

EOF

code "$POSTS_DIR/$FILENAME"
echo "Created $POSTS_DIR/$FILENAME"