// Roséva Skincare - Main Application Logic

document.addEventListener('DOMContentLoaded', () => {
    // Mobile Menu Toggle
    const mobileMenuBtn = document.getElementById('mobileMenuBtn');
    const mobileMenu = document.getElementById('mobileMenu');

    if (mobileMenuBtn && mobileMenu) {
        mobileMenuBtn.addEventListener('click', () => {
            mobileMenu.classList.toggle('hidden');
        });

        // Close on link click
        mobileMenu.querySelectorAll('a').forEach(link => {
            link.addEventListener('click', () => {
                mobileMenu.classList.add('hidden');
            });
        });
    }

    // Carousel Elements
    const track = document.getElementById('productTrack');
    const prevBtn = document.getElementById('prevBtn');
    const nextBtn = document.getElementById('nextBtn');
    const progressBar = document.getElementById('carouselProgress');

    if (track && prevBtn && nextBtn && progressBar) {
        const getScrollAmount = () => {
            const firstCard = track.querySelector('.snap-start');
            if (!firstCard) return 260;
            const computedStyle = window.getComputedStyle(track);
            const gap = parseFloat(computedStyle.gap || computedStyle.columnGap) || 24;
            return firstCard.offsetWidth + gap;
        };

        const updateProgress = () => {
            const maxScroll = track.scrollWidth - track.clientWidth;
            if (maxScroll <= 0) {
                progressBar.style.width = '100%';
                progressBar.style.left = '0%';
                prevBtn.disabled = true;
                nextBtn.disabled = true;
                return;
            }

            const currentScroll = track.scrollLeft;
            const scrollFraction = Math.min(Math.max(currentScroll / maxScroll, 0), 1);

            // Responsive progress thumb width
            const visibleRatio = track.clientWidth / track.scrollWidth;
            const thumbWidth = Math.max(Math.min(visibleRatio * 100, 35), 20);
            const maxLeft = 100 - thumbWidth;
            const leftPos = scrollFraction * maxLeft;

            progressBar.style.width = thumbWidth + '%';
            progressBar.style.left = leftPos + '%';

            prevBtn.disabled = currentScroll <= 2;
            nextBtn.disabled = currentScroll >= maxScroll - 2;
        };

        prevBtn.addEventListener('click', () => {
            track.scrollBy({ left: -getScrollAmount(), behavior: 'smooth' });
        });

        nextBtn.addEventListener('click', () => {
            track.scrollBy({ left: getScrollAmount(), behavior: 'smooth' });
        });

        track.addEventListener('scroll', updateProgress, { passive: true });
        window.addEventListener('resize', updateProgress);

        // Initial progress check
        updateProgress();
    }
});

// Shopping Cart Notification feedback
let cartCount = 0;
function addToCart(productName, price) {
    cartCount++;
    const badge = document.getElementById('cartBadge');
    if (badge) {
        badge.innerText = cartCount;
        badge.classList.add('scale-125');
        setTimeout(() => badge.classList.remove('scale-125'), 200);
    }
}

// ==========================================
// CUSTOM DROPDOWNS LOGIC (Sort & Page Size)
// ==========================================
document.addEventListener('DOMContentLoaded', () => {
    // Sort Dropdown
    const sortBtn = document.getElementById('sortDropdownBtn');
    const sortMenu = document.getElementById('sortDropdownMenu');
    const sortArrow = document.getElementById('sortArrow');

    if (sortBtn && sortMenu) {
        sortBtn.addEventListener('click', (e) => {
            e.stopPropagation();
            // Close other dropdown if open
            const pageMenu = document.getElementById('pageDropdownMenu');
            if (pageMenu) pageMenu.classList.add('hidden');

            sortMenu.classList.toggle('hidden');
            if (sortArrow) {
                sortArrow.classList.toggle('rotate-180');
            }
        });
    }

    // Page ("Go to") Dropdown
    const pageBtn = document.getElementById('pageDropdownBtn');
    const pageMenu = document.getElementById('pageDropdownMenu');
    const pageArrow = document.getElementById('pageArrow');

    if (pageBtn && pageMenu) {
        pageBtn.addEventListener('click', (e) => {
            e.stopPropagation();
            // Close other dropdown if open
            if (sortMenu) sortMenu.classList.add('hidden');

            pageMenu.classList.toggle('hidden');
            if (pageArrow) {
                pageArrow.classList.toggle('rotate-180');
            }
        });
    }

    // Close dropdowns on outside click
    document.addEventListener('click', (e) => {
        if (sortMenu && !sortMenu.contains(e.target) && !sortBtn.contains(e.target)) {
            sortMenu.classList.add('hidden');
            if (sortArrow) sortArrow.classList.remove('rotate-180');
        }
        if (pageMenu && !pageMenu.contains(e.target) && !pageBtn.contains(e.target)) {
            pageMenu.classList.add('hidden');
            if (pageArrow) pageArrow.classList.remove('rotate-180');
        }
    });
});

// Selection Handlers
function selectSortOption(optionText) {
    const label = document.getElementById('selectedSortLabel');
    if (label) {
        label.innerText = optionText;
    }
    const sortMenu = document.getElementById('sortDropdownMenu');
    const sortArrow = document.getElementById('sortArrow');
    if (sortMenu) sortMenu.classList.add('hidden');
    if (sortArrow) sortArrow.classList.remove('rotate-180');
}

function selectPageOption(pageNumber) {
    const label = document.getElementById('selectedPageLabel');
    if (label) {
        label.innerText = `${pageNumber} / page`;
    }
    const pageMenu = document.getElementById('pageDropdownMenu');
    const pageArrow = document.getElementById('pageArrow');
    if (pageMenu) pageMenu.classList.add('hidden');
    if (pageArrow) pageArrow.classList.remove('rotate-180');
}

// ==========================================
// SCROLL REVEAL & ENTRANCE ANIMATION OBSERVER
// ==========================================
document.addEventListener('DOMContentLoaded', () => {
    const reveals = document.querySelectorAll('.reveal-on-scroll');
    if (reveals.length > 0) {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('reveal-active');
                }
            });
        }, {
            threshold: 0.15,
            rootMargin: '0px 0px -50px 0px'
        });

        reveals.forEach(el => observer.observe(el));
    }
});


