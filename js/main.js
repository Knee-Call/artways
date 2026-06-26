/* Artways Playways — small vanilla JS: mobile nav + hero line rotation */
(function () {
  // Mobile nav toggle
  var burger = document.querySelector('.hamburger');
  var links = document.querySelector('.nav-links');
  if (burger && links) {
    burger.addEventListener('click', function () { links.classList.toggle('open'); });
    links.addEventListener('click', function (e) {
      if (e.target.tagName === 'A') links.classList.remove('open');
    });
  }

  // Rotating "Play as if your ___ depended on it" word, if present
  var el = document.getElementById('playWord');
  if (el) {
    var words = ['learning', 'relationships', 'mental health', 'creative capacity'];
    var i = 0;
    setInterval(function () {
      i = (i + 1) % words.length;
      el.style.opacity = 0;
      setTimeout(function () { el.textContent = words[i]; el.style.opacity = 1; }, 350);
    }, 2600);
  }

  // Footer year
  var y = document.getElementById('yr');
  if (y) y.textContent = new Date().getFullYear();

  // Lightbox (gallery pages) — ported/adapted from the elleniya pattern
  var lightbox = document.getElementById('lightbox');
  if (lightbox) {
    var lbImg = lightbox.querySelector('.lightbox-img');
    var items = document.querySelectorAll('.gallery-item');
    var idx = 0;
    function open(i) { idx = i; lbImg.src = items[i].getAttribute('data-full'); lightbox.classList.add('active'); document.body.style.overflow = 'hidden'; }
    function close() { lightbox.classList.remove('active'); document.body.style.overflow = ''; }
    function prev() { idx = idx > 0 ? idx - 1 : items.length - 1; lbImg.src = items[idx].getAttribute('data-full'); }
    function next() { idx = idx < items.length - 1 ? idx + 1 : 0; lbImg.src = items[idx].getAttribute('data-full'); }
    items.forEach(function (it, i) { it.addEventListener('click', function () { open(i); }); });
    lightbox.querySelector('.lightbox-close').addEventListener('click', close);
    lightbox.querySelector('.lightbox-prev').addEventListener('click', prev);
    lightbox.querySelector('.lightbox-next').addEventListener('click', next);
    lightbox.addEventListener('click', function (e) { if (e.target === lightbox) close(); });
    document.addEventListener('keydown', function (e) {
      if (!lightbox.classList.contains('active')) return;
      if (e.key === 'Escape') close();
      if (e.key === 'ArrowLeft') prev();
      if (e.key === 'ArrowRight') next();
    });
  }
})();
