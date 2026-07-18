# Artways Playways — Nicole Sumner

The website for **Artways Playways**, Nicole Sumner's play-based, multi-arts education consulting practice — professional development *Playshops* for educators, youth leaders, organizations and artists.

**Live:** https://knee-call.github.io/artways/ — hosted on GitHub Pages from the `main` branch (root) of **`Knee-Call/artways`** (Nicole's own account; this is the canonical deploy target — `git push origin main` here). Any push to `main` auto-publishes; a `.nojekyll` file makes Pages serve the files as-is.

> Older URL `https://pianonik.github.io/nicole-sumner2/` (repo `pianonik/nicole-sumner2`) is **frozen** — it lives on an account we don't control and can no longer be updated. Do not point new links there.

## Stack

Plain HTML + CSS + a little vanilla JS — no build step, no dependencies. Same bold brand identity as the companion *Courageous Teachers* site (`~/Developer/nicole-sumner`): red / black / cyan / orange, activist-poster energy, hand-lettered accents. Fonts: **Archivo** (poster sans) + **Permanent Marker** (hand accent) + **Inter** (body), via Google Fonts.

## Pages

```
nicole-sumner2/
├── index.html        # Home: hero, "what is it", four audiences, Play Wheel, play-statement band, CTA
├── why-play.html     # "Why Play?" manifesto + "what play is" + Play Statements (+ rhizome poster)
├── playshops.html    # 7 featured Playshops + spoken-word section + full 6-theme menu
├── resources.html    # Play library: films, organizations & journals, frameworks, books
├── gallery.html      # Photo gallery index (category cards)
├── gallery-*.html    # GENERATED per-category galleries (grid + lightbox)
├── about.html        # Bio, publications, testimonials
├── css/style.css     # Brand palette + all components
├── js/main.js        # Mobile nav, rotating hero word, lightbox, footer year
├── scripts/
│   └── build-galleries.sh  # Optimizes photos + generates gallery pages from folders
└── assets/
    ├── img/          # Logo + curated, optimized photos (her own work)
    └── galleries/    # GENERATED per-gallery full + thumbnail images
```

## Photo galleries

`scripts/build-galleries.sh` builds the galleries from Nicole's own photo folders in the (gitignored) source archive — categorized by **folder name**. It optimizes each photo to a full (≤1600px) + thumbnail (≤600px), then generates `gallery-<slug>.html` (grid + lightbox, mechanism adapted from `~/Developer/elleniya`) and the `gallery.html` index. Re-run it whenever the source folders change:

```
bash scripts/build-galleries.sh
```

Current galleries: Play & Teaching · In the Classroom & Beyond · Early Childhood · Poetry Workshops · Outdoors & Makers (81 photos). Abstract/background/screenshot images and third-party "topical" folders are excluded.

> The galleries include children's faces from Nicole's own teaching photos — confirm consent (or blur) before promoting widely.

Contact is a `mailto:sumnernicole@gmail.com` throughout (the "Book a Playshop" button); a dedicated contact form can be added later.

## Content & images

Page copy is drawn from the planning documents in this repo (kept for reference):

- `WEBSITE_CONTENT_MAP_2026.md` — the page-by-page blueprint (text + image plan).
- `PLAYSHOPS_PAGE.md` — finished Playshop descriptions + full menu.
- `HOSTING_COMPARISON_2026.md` — hosting options vs. the old GreenGeeks bill.
- `1_CONTENT LOG_Website 2026_paths-corrected.md` — original content log, paths fixed.
- `history.md` — running work log (newest first).

**Images currently used are Nicole's own work** (the Play Wheel, student collage, her teaching/poetry photos), optimized to ≤1600px. The large source archive (`2015_18 Website/`, `Images file_edited/`, `Promo/`, etc.) lives on disk but is **gitignored** — not published.

> Before adding more photos: third-party images need permission/licensing, and any showing children's faces should be cropped or blurred (see the content map's image tags).

## Local preview

```
cd ~/Developer/nicole-sumner2
python3 -m http.server 8732
```

then open <http://127.0.0.1:8732/index.html>.

## Deploy

```
git add -A && git commit -m "…" && git push
```

GitHub Pages rebuilds on every push to `main`. No build step.
