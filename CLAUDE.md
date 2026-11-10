# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A one-page introduction site for **공주의 정원 (Princess Garden)**, a roastery café in 경기도 안성시 삼죽로. Everything — markup, CSS, and the falling-petal canvas script — lives in `index.html`. There is no build step, package manager, linter, or test suite.

## Publishing

`index.html` is published as a Claude Artifact at https://claude.ai/artifact/W8z4DMGwFA4HfrEDFGy2S1. After editing, republish to that same URL (pass it as `url`; read the artifact first if this session has not published it) so the link stays the same.

Because the Artifact platform wraps the file in its own document skeleton, `index.html` intentionally has **no** `<!doctype>`, `<html>`, `<head>`, or `<body>` tags — it starts with `<title>`, the fonts `<link>`, and `<style>`. Don't add them. Opening `index.html` directly in a browser renders in quirks mode with no viewport meta.

The same page is also a website, served by GitHub Pages from the `docs/` folder of https://github.com/herzoojoe/cafe (branch `main`). `docs/index.html` is generated, never edited by hand:

```bash
bash build.sh
```

`build.sh` prepends the doctype, `<html lang="ko">`, charset, viewport and description metas, and the small reset the Artifact platform normally supplies. After every change to `index.html`: republish the artifact, run `build.sh`, then commit and push both `index.html` and `docs/index.html`.

## Structure of index.html

- Design tokens (colors, fonts) are on `:root` at the top of `<style>`, with dark-mode overrides repeated under `@media (prefers-color-scheme: dark)` and `:root[data-theme="dark"]`. Change colors in all three places.
- Sections in order: hero (`header.hero`) → sticky nav → `#story` → `#roasting` (4 numbered steps, each with a Korean `h3` and an English `.en` subtitle) → `#beans` (3 bean cards) → `#menu` → `#visit` → footer. The nav links target those ids.
- Bean cards show the roast level as an Agtron number. The `.pin` `left:` percentage is set by hand to match the number on the scale (#85 light to #45 dark).

## Content decisions the owner made

- Palette is warm coffee brown: latte-foam background, espresso text, caramel accent (`--rose` holds the caramel accent and `--leaf` holds mocha; the token names are left over from an earlier green/pink palette). The exception is the hero (first screen with the title), which the owner wanted in garden green: forest-green background (`--hero-bg`), pale leaf-green `--hero-accent` on "정원", and leaf-green/cream falling pieces (the `colors` array in the script). The hero is dark in both themes. The rest of the page stays brown.
- Body text is 18px. The owner asked for larger text, so don't shrink sizes back down.

- Title is `공주의 <span>정원</span>` followed by a smaller `Princess Garden`.
- Use **정원 좌석** (not 가든 좌석) everywhere. There are 16 seats.
- Spell it **블렌드** (라벤더 블렌드, 오후의 정원 블렌드), even if a request writes 블랜드.
- Bean card order: 오후의 정원 블렌드, 예가체프 코체레, 라벤더 블렌드. Bean cards show no prices.
- The 디개싱 step's figure says 숙성 (not 휴지).
- Hours: 화–금 12:00–21:00, 토–일 11:00–21:00, 월 휴무. The note under the visit info reads "여는 시간은 계절에 따라 달라질 수 있습니다."

## Still placeholder

These were made up and have not been confirmed by the owner: the phone number (`000-0000-0000`), Instagram handle, parking info, drink and dessert prices, the story text, and the bean origins and tasting notes.
