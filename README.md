# Murmur marketing site

Astro static site for [Murmur](https://github.com/pphelan007/murmur), the local push-to-talk dictation app for macOS. Deployed to GitHub Pages via [`.github/workflows/deploy.yml`](.github/workflows/deploy.yml) — live at <https://pphelan007.github.io/murmur-site/>.

## Run locally

```sh
npm install
npm run dev
# → http://localhost:4321
```

Or just double-click `start.command` from Finder.

## Stack

- Astro 4 (zero JS by default)
- Google Fonts: Fraunces (serif) + Inter (sans)
- Single-page, single-file build — edit `src/pages/index.astro`

## Brand

- Background: `#faf8f4` (warm off-white)
- Forest green accent: `#0c5b3f`
- Headlines: Fraunces (serif, italic accent for emphasis)
- Body: Inter
