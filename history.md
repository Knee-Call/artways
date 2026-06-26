# Artways Playways — Website 2026 Project History

*Most recent entries at the top. Timestamps in local time.*

---

## 2026-06-22 — Categorized photo gallery (elleniya-style)

**Nicole:** "we gave you a whole shitload of photos - where can they go? Maybe make a photo gallery categorized? … just rip off what we did for ~/Developer/elleniya … take a shot at organizing the images we already have. Skip the images that seem abstract or have the word abstract in the name or folder" + "folder name"

**Claude:** Ported the elleniya gallery mechanism (thumbnail grid + lightbox with prev/next/keyboard nav) into the Artways brand, categorized by source-folder name:
- New `scripts/build-galleries.sh` — deterministically optimizes each photo into a full (≤1600px) + thumbnail (≤600px) under `assets/galleries/<slug>/`, generates each `gallery-<slug>.html` and the `gallery.html` index. Re-runnable.
- **5 galleries, 81 photos:** Play & Teaching (25), In the Classroom & Beyond (35), Early Childhood (10), Poetry Workshops (6), Outdoors & Makers (5).
- Added gallery CSS + lightbox JS; wired "Gallery" into nav + footer on all pages.
- **Skipped** per instruction: anything abstract (Abstract photos/text, Backgrounds, Textures) plus screenshots/logos. Also left out the clearly third-party "topical" folders (Bahareh Bisheh art, Sir Ken Robinson, Territory of Play film stills, Vox Video Lab, Play_humans/animals found photos, Brain/Maps/Human Pyramid/Interdisciplinary, Nature) — those need permission before publishing.
- **Open caveat:** galleries include children's faces (her own teaching photos); flagged for a blur/consent decision before wide promotion.

## 2026-06-22 — Added Resources page, Play Statements, and rhizome posters

**Nicole:** "add these to the mix in a way that makes sense: Nicole's Play Wheel_web work by Rebecca · Twitter_My Posters · My Play Statements copy.docx · Sumner_Play Resources list copy.docx"

**Claude:** Reviewed all four sources and folded each in where it fit:
- **New `resources.html`** — built from the Play Resources list: Films on Play, Films on School Change, Organizations & Journals, Frameworks & Institutes, and Books, with live links. Added "Resources" to the nav and footer of every page.
- **Play Statements** — added a dark "Play statements" band to `why-play.html` (arts→play→healing; play-informed vs. trauma-informed teaching; the Shawn Ginwright play-deficit stat callout) and a lighter "play-informed teaching" band to the home page.
- **Rhizome posters** — optimized her own "Rhizomatic Play" and "Play challenges us to know our privilege" posters into `assets/img/` and used them in the statements bands.
- **Rebecca's Play Wheel PDFs** — these are the outer-ring *print template* only; the existing photo shows the complete wheel, so it stays. The PDFs were kept as source.
- Moved all four sources into the project folder (gitignored, kept on disk). Verified all pages serve and assets resolve, then pushed.

## 2026-06-22 — Moved to ~/Developer/nicole-sumner2 and built the static site

**Nicole:** "Look at ~/Developer/nicole-sumner - we did a static site there the other day with similar content. Move this folder to ~/Developer/nicole-sumner2 and start building from there - do a similar thing with github pages"

**Claude:**
- Studied the companion site `~/Developer/nicole-sumner` (Courageous Teachers): plain HTML/CSS/vanilla JS, GitHub Pages from `main` root + `.nojekyll`, bold brand identity (red/black/cyan/orange; Archivo + Permanent Marker + Inter).
- Moved `/Users/nick/Downloads/Website_mine` → `~/Developer/nicole-sumner2` (1.7 GB archive).
- Curated and optimized Nicole's **own** images into `assets/img/` (Play Wheel, "I See a Song" collage, teaching/poetry photos), ≤1600px via `sips`; reused the ARTWAYS/PLAYWAYS logo from the companion repo.
- Built the site: **index.html** (hero with rotating "Play as if…", four audiences, Play Wheel feature), **why-play.html** (manifesto + "what play is"), **playshops.html** (7 featured Playshops + spoken-word section + full 6-theme menu), **about.html** (bio, publications, 5 testimonials), shared `css/style.css` + `js/main.js`. Contact = `mailto:` "Book a Playshop" throughout.
- Added `.nojekyll` + `.gitignore` that excludes the heavy source archive (only 24 site/doc files tracked). Rewrote `README.md` for the live site.
- Initialized git and deployed to GitHub Pages at `pianonik/nicole-sumner2`.

## 2026-06-22 — Playshops page, hosting comparison, and this history file

**Nicole:** "go ahead on all 3" (the three next-steps offered: pull the 8 finished workshop descriptions into a ready-to-paste Playshops page; compare 2026 hosting options against the old GreenGeeks bill; start history.md).

**Claude:**
- Read the 2025 GreenGeeks/WordPress cost files to ground the comparison.
- Created **`PLAYSHOPS_PAGE.md`** — ready-to-paste page copy: intro ("What are you doing about your play deficit?"), the 7 finished workshop descriptions (Improvisation Across the Arts; Jump Start Your Play Habits; Setting Up Play Areas — Adult; Setting Up Play Areas at Home for Children; Guided Play in Practice; Playful Schools; Applying a Play Rubric), plus the full ~35-Playshop menu organized into 6 themes, and a closing call-to-action. Kept in Nicole's voice; only obvious typos cleaned.
- Created **`HOSTING_COMPARISON_2026.md`**. Key facts recovered from the GreenGeeks chat: old plan was EcoSite Lite 50, 3-yr term, ~$155/yr at renewal + $19.95/yr domain (`nicolesumner.org`); intro promos are first-year only. Recommendation: Squarespace (~$200/yr, no upkeep, replaces host + designer) **or** a static site on Netlify/GitHub Pages (~$20/yr domain only, Claude can build it). Keep the domain renewing while deciding.
- Created this **`history.md`** and **`README.md`**.

---

## 2026-06-21 — Promo folder dropped in; content map enriched

**Nicole:** "I just dropped in the Promo folder - now look"

**Claude:** Found the new top-level `Promo/` folder. It restored 3 of the 4 previously-missing files (including `8 Play-Based Workshops.rtfd` with the finished workshop descriptions) plus bonus files (Descriptions, Play As If intro, video storyboard, sample mass email). Only `Playways_My Work Ways.rtf` remains missing (was at the top level of the old `Artways Playways/` folder, not in Promo — low priority). Updated `WEBSITE_CONTENT_MAP_2026.md` (real Playshop descriptions, "Play As If" home hook, stronger short bio + publications + mission paragraph) and `1_CONTENT LOG_Website 2026_paths-corrected.md` (marked Promo files resolved).

---

## 2026-06-21 — Path correction across computers

**Nicole:** "Quite sure we copied all of content mentioned in that layout file, but the relative path changed - it was on a different computer before - adjust if you can"

**Claude:** Verified all 29 items referenced in the content log against the new location (`/Users/nick/Downloads/Website_mine/`, formerly `/Users/nicolesumner/Documents/1_Nicole's Files_newer/Artways Playways/Website_mine/`). Result: 25 present (only the root prefix changed); 4 missing because they lived one level *above* `Website_mine` (the `Promo/` folder and `Playways_My Work Ways.rtf`). Created **`1_CONTENT LOG_Website 2026_paths-corrected.md`** with corrected relative paths and the missing items flagged. (Original RTF left untouched as the historical record.)

---

## 2026-06-21 — Initial review and content+image map

**Nicole:** "study the contents of this file: 1_CONTENT LOG_Website 2026.rtf and suggest a way we can organize into a website" — then, after the image library arrived: "hang on we have some more files coming - they are in the folder: Images file_edited they are used for background purposes for webpages and to illustrate points --- look at all the files again and ask me what you were going to ask"

**Claude:** Read the content log (a series of planning prompts) and the real folders. Identified the project as **Artways Playways**, Nicole Sumner's play-based, multi-arts education consulting practice, with content accumulated across 2007 / 2015–18 / 2019 site attempts. Proposed a sitemap (Home · Why Play? · About · Playshops [Educators/Youth Leaders/Organizations/Artists] · In Practice · Blog · Testimonials & Press · Contact) and mapped existing files to each page. Surveyed the ~376-image library (already sorted by purpose: headers, backgrounds, illustrative photos, Play Wheels) and flagged that many illustrative images are third-party (need permission for public use).

**Decisions captured (via questions):** next step = build a content+image map; image rights = plan with all images for now, flag the ones needing permission.

**Deliverable:** **`WEBSITE_CONTENT_MAP_2026.md`** — page-by-page blueprint with real text per page and specific image files per slot, each tagged ✅ MINE / 🔒 PRIVACY / ⚠️ PERMISSION.
