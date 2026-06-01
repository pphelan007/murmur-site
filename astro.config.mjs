import { defineConfig } from 'astro/config';

// Hosted as a project page on GitHub Pages:
// https://pphelan007.github.io/murmur-site/
// `site` is used for canonical URLs and sitemap; `base` is prepended to every
// asset path Astro emits so links resolve under the /murmur-site/ subpath.
// Switch both to the apex domain (and drop `base`) once murmur.app DNS points
// at pphelan007.github.io.
export default defineConfig({
  site: 'https://pphelan007.github.io',
  base: '/murmur-site',
  server: {
    port: 4321,
    host: true,
  },
  devToolbar: {
    enabled: false,
  },
});
