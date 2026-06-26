# Artways Playways — TODO

Latest open items for the website. Newest concerns near the top of each section.
See history.md for the narrative and README.md for how things are built/deployed.

## Decisions needed (from Nicole)

- Children's faces in the photo galleries: confirm consent, or blur/crop, before
  promoting the site widely. Galleries currently publish her own teaching photos
  as-is (per "put the images up so we can preview, we will edit later").
- Third-party "topical" images (Bahareh Bisheh art, Sir Ken Robinson, Territory
  of Play film stills, Vox Video Lab, found Play_humans/animals/Nature, Brain/
  Maps/Human Pyramid/Interdisciplinary): need permission/licensing before any go
  public. Left out of galleries for now.
- Custom domain: point `nicolesumner.org` at GitHub Pages? (Domain was ~$20/yr on
  the old GreenGeeks setup — see HOSTING_COMPARISON_2026.md.)

## Content to add / finish

### Awaiting content from Nicole (her 2026-06-22 email edits)
HTML-comment markers are already in place at each insertion point — just drop the
content in when she sends it.
- Resources: "Featured Resources" group (~19 current videos, films, podcasts,
  websites & print publications on Play & Arts Integration, e.g. Destiny Youth
  Arts film). Marker at top of `resources.html`, above "Films on Play".
- About: updated bio to replace the "She is…" and "Nicole holds…" paragraphs.
  Marker above those paragraphs in `about.html`.
- About: "Selected International Presentations" section from her résumé. Marker
  below the publications list in `about.html`.

- Gallery edits: prune/reorder photos, move between galleries, fold in more of
  her own folders (e.g. Play_Messy, Play_Snow) if wanted. Re-run
  `scripts/build-galleries.sh` after changing source folders.
- About page: the "Download Nicole's CV (PDF)" link is referenced in the content
  map but there is no CV PDF on the site yet — produce and link one.
- In Practice page: the "What If" kindergarten design-thinking project + the
  Play-Based Assessment slides. Needs face-blurring first (real KG students).
- Blog page: finished blog pieces exist (Drive-Through Play, Paper Buildings,
  1st Play Blog, You Exist Within the Marble, Article w Natasha, Music blog).
- Contact: currently a `mailto:` "Book a Playshop" button everywhere — add a real
  contact form when the server/CMS is set up.
- Yick Wo Lullaby project (CD track titles) — not yet placed anywhere on the site.

## Infrastructure

- Server / CMS (elleniya-style PHP admin) so galleries + content stay editable
  without redeploys. The folder-per-gallery layout already matches what an
  upload-based CMS expects.
- Dead-link audit on resources.html — links are from Nicole's 2018 resource list,
  some may have moved (companion site `~/Developer/nicole-sumner` has a dead-link
  audit pattern to copy).

## Source material

- MISSING: `Playways_My Work Ways.rtf` (business/admin task list) — was at the top
  level of the old `Artways Playways/` folder, not in Promo, so it didn't get
  copied. Copy from the old machine if still wanted (low priority).

## Fixes / work that landed

- 2026-06-22 — Nicole's email edits (the doable subset): About page now carries a
  cultural-humility "shoulders I stand on" paragraph (drawn from the Courageous
  Teachers site's Brave Voices & Cultural Humility slides); "Writing &
  Publications" renamed to "Selected Publications" with publication years removed.
  Markers left in place for the three NS-will-provide items (see above).
- 2026-06-22 — Categorized photo gallery (grid + lightbox), 5 galleries / 81
  photos, build-galleries.sh; "Gallery" in nav + footer. Commit 1f176f5.
- 2026-06-22 — Resources page, Play Statements bands, rhizome posters. Commit 5182896.
- 2026-06-22 — Initial static site built + deployed to GitHub Pages
  (pianonik/nicole-sumner2): Home, Why Play?, Playshops, About. Commit f5cd712.
- 2026-06-21 — Planning docs: content+image map, paths-corrected content log,
  Playshops page copy, hosting comparison (pre-repo, in history.md).
