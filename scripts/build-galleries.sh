#!/usr/bin/env bash
# Build categorized photo galleries (static) from Nicole's own photo folders.
# - Optimizes each photo to a full (<=1600px) + thumbnail (<=600px) under assets/galleries/<slug>/
# - Generates gallery-<slug>.html pages (grid + lightbox) and gallery.html (index)
# - Skips files whose name suggests abstract/screenshot/logo/text
# Re-run any time the source folders change. Deterministic (sequential names).
set -euo pipefail
cd "$(dirname "$0")/.."

OUT="assets/galleries"
SKIP_RE='abstract|screen ?shot|screenshot|logo|\btext\b|\.ds_store'

# slug | Title | source dir(s, ; separated)
MANIFEST='
play-teaching|Play & Teaching|Images file_edited/1 HEADER SLIDES_best
in-action|In the Classroom & Beyond|Images file_edited/3 Photos_Realistic to illustrate web pages
early-childhood|Early Childhood|Images file_edited/AES EC collages;Images file_edited/AES classroom pics
poetry|Poetry Workshops|Images file_edited/Word Warriors_Nepal
outdoors-makers|Outdoors & Makers|photos for new website/Design & Build;photos for new website/Play Outdoors;photos for new website/Poetry
'

nav_html () { # $1 = active slug-or-empty (gallery pages pass "gallery")
cat <<NAV
  <header class="site">
    <div class="nav-inner">
      <a href="index.html" class="brand"><img src="assets/img/logo.png" alt="" class="brand-logo"> Artways Playways</a>
      <button class="hamburger" aria-label="Menu"><span></span><span></span><span></span></button>
      <ul class="nav-links">
        <li><a href="index.html">Home</a></li>
        <li><a href="about.html">About</a></li>
        <li><a href="why-play.html">Why Play?</a></li>
        <li><a href="playshops.html">Playshops</a></li>
        <li><a href="resources.html">Resources</a></li>
        <li><a href="gallery.html"$([ "${1:-}" = gallery ] && echo ' class="active"')>Gallery</a></li>
        <li><a href="mailto:sumnernicole@gmail.com" class="nav-cta">Book a Playshop</a></li>
      </ul>
    </div>
  </header>
NAV
}

footer_html () {
cat <<'FOOT'
  <footer class="site">
    <div class="wrap">
      <div class="foot-grid">
        <div>
          <div class="foot-brand">Artways Playways</div>
          <p>Co-constructing inter-arts and play opportunities. Professional development and play advocacy across the learning spectrum, in schools and workplaces.</p>
        </div>
        <div>
          <h4>Explore</h4>
          <ul>
            <li><a href="why-play.html">Why Play?</a></li>
            <li><a href="playshops.html">Playshops</a></li>
            <li><a href="resources.html">Resources</a></li>
            <li><a href="gallery.html">Gallery</a></li>
            <li><a href="about.html">About Nicole</a></li>
          </ul>
        </div>
        <div>
          <h4>Contact</h4>
          <ul>
            <li>Nicole Sumner, MA</li>
            <li><a href="mailto:sumnernicole@gmail.com">sumnernicole@gmail.com</a></li>
          </ul>
        </div>
      </div>
      <div class="foot-bottom">
        <span class="inprogress-badge">✺ A work in progress — like play itself.</span>
        <span>© <span id="yr">2026</span> Nicole Sumner · Artways Playways</span>
      </div>
    </div>
  </footer>
FOOT
}

page_head () { # $1 = <title>
cat <<HEAD
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>$1</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Archivo:wght@500;600;700;800;900&family=Permanent+Marker&family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
HEAD
}

lightbox_html () {
cat <<'LB'
  <div class="lightbox" id="lightbox">
    <button class="lightbox-close" aria-label="Close">&times;</button>
    <button class="lightbox-prev" aria-label="Previous">&lsaquo;</button>
    <button class="lightbox-next" aria-label="Next">&rsaquo;</button>
    <img src="" alt="" class="lightbox-img">
  </div>
LB
}

rm -rf "$OUT"; mkdir -p "$OUT"
INDEX_CARDS=""
COLORS=(red cyan orange black cyan-deep)
ci=0

echo "$MANIFEST" | while IFS='|' read -r slug title dirs; do
  [ -z "$slug" ] && continue
  mkdir -p "$OUT/$slug"
  n=0
  grid=""
  seen=""   # md5s already used in this gallery, to skip content-identical dupes
  IFS=';' read -ra DARR <<< "$dirs"
  for d in "${DARR[@]}"; do
    [ -d "$d" ] || continue
    while IFS= read -r f; do
      base=$(basename "$f")
      echo "$base" | grep -qiE "$SKIP_RE" && continue
      # skip the same photo saved twice (source files left untouched)
      hash=$(md5 -q "$f")
      case " $seen " in *" $hash "*) echo "  skip duplicate: $base"; continue ;; esac
      seen="$seen $hash"
      n=$((n+1)); nn=$(printf "%02d" "$n")
      full="$OUT/$slug/$slug-$nn.jpg"; thumb="$OUT/$slug/$slug-$nn-thumb.jpg"
      sips -s format jpeg -s formatOptions 72 -Z 1600 "$f" --out "$full" >/dev/null 2>&1
      sips -s format jpeg -s formatOptions 66 -Z 600 "$f" --out "$thumb" >/dev/null 2>&1
      grid="$grid      <div class=\"gallery-item\" data-full=\"$full\"><img src=\"$thumb\" alt=\"$title $n\" loading=\"lazy\"></div>"$'\n'
    done < <(find "$d" -maxdepth 1 -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \) | sort)
  done

  # gallery page
  {
    page_head "$title — Artways Playways"
    nav_html gallery
    cat <<PH
  <section class="page-hero">
    <div class="wrap">
      <a href="gallery.html" class="gal-back">&lsaquo; All galleries</a>
      <h1>$title</h1>
    </div>
  </section>
  <section class="block" style="padding-top:2rem;">
    <div class="wrap">
      <div class="gallery-grid">
PH
    printf '%s' "$grid"
    cat <<'PF'
      </div>
    </div>
  </section>
PF
    lightbox_html
    footer_html
    echo '  <script src="js/main.js"></script>'
    echo '</body></html>'
  } > "gallery-$slug.html"

  color="${COLORS[$((ci % ${#COLORS[@]}))]}"; ci=$((ci+1))
  cover="$OUT/$slug/$slug-01-thumb.jpg"
  INDEX_CARDS="$INDEX_CARDS    <a class=\"gal-cat\" href=\"gallery-$slug.html\" style=\"--gc:var(--$color)\"><div class=\"cover\"><img src=\"$cover\" alt=\"$title\" loading=\"lazy\"></div><div class=\"meta\"><h3>$title</h3><div class=\"cnt\">$n photos</div></div></a>"$'\n'
  echo "  built gallery '$title' ($n photos)"
  # stash card line for the index (written after loop via temp file, since while-subshell)
  printf '%s' "$INDEX_CARDS" > /tmp/gal_cards.txt
done

# gallery index page
CARDS=$(cat /tmp/gal_cards.txt 2>/dev/null || true)
{
  page_head "Gallery — Artways Playways"
  nav_html gallery
  cat <<'GH'
  <section class="page-hero">
    <div class="wrap">
      <h1>Gallery</h1>
      <p>Moments from Playshops, classrooms and poetry workshops — play in action across ages, arts and continents.</p>
    </div>
  </section>
  <section class="block" style="padding-top:2rem;">
    <div class="wrap">
      <div class="gal-cards">
GH
  printf '%s' "$CARDS"
  cat <<'GF'
      </div>
    </div>
  </section>
GF
  footer_html
  echo '  <script src="js/main.js"></script>'
  echo '</body></html>'
} > gallery.html

echo "done. total gallery images: $(find "$OUT" -name '*-thumb.jpg' | wc -l | tr -d ' ')"
