#!/usr/bin/env bash
# Builds docs/index.html (the GitHub Pages site) from index.html (the Claude Artifact source).
# index.html has no <!doctype>/<html>/<head> because the Artifact platform adds them;
# this script adds them so the page also works as a standalone website.
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p docs
{
  printf '<!doctype html>\n<html lang="ko">\n<meta charset="utf-8">\n'
  printf '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
  printf '<meta name="description" content="직접 볶는 원두와 정원 좌석이 있는 경기도 안성의 로스터리 카페 공주의 정원">\n'
  printf '<style>body{margin:0}img{max-width:100%%}[hidden]{display:none!important}</style>\n'
  cat index.html
  printf '\n</html>\n'
} > docs/index.html
echo "Built docs/index.html"
