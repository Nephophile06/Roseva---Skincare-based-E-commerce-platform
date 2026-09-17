// Roséva Skincare - Main Application Logic

// ==========================================
// AUTHENTICATION & USER STATE MANAGEMENT
// ==========================================
const AUTH_STORAGE_KEY = 'roseva_user';

function getLoggedInUser() {
    try {
        const data = localStorage.getItem(AUTH_STORAGE_KEY);
        return data ? JSON.parse(data) : null;
    } catch (e) {
        console.error('Error reading user state:', e);
        return null;
    }
}

function setLoggedInUser(user) {
    try {
        localStorage.setItem(AUTH_STORAGE_KEY, JSON.stringify(user));
        updateAuthUI();
        showAuthToast(`Welcome, ${user.name}!`);
    } catch (e) {
        console.error('Error saving user state:', e);
    }
}

function logoutUser() {
    localStorage.removeItem(AUTH_STORAGE_KEY);
    updateAuthUI();
    showAuthToast('Successfully signed out.');

    // If on profile page, refresh or show logged-out view
    if (window.location.pathname.includes('profile.jsp')) {
        setTimeout(() => {
            window.location.href = 'index.jsp';
        }, 1200);
    }
}

function quickDemoLogin() {
    const demoUser = {
        name: 'Tousif Tasrik',
        email: 'tousif.tasrik@roseva.com',
        phone: '+880 1712 345678',
        role: 'VIP Member'
    };
    setLoggedInUser(demoUser);
    closeAuthModal();
}

// Toast notification helper
function showAuthToast(message, type = 'success') {
    let toast = document.getElementById('rosevaToast');
    if (!toast) {
        toast = document.createElement('div');
        toast.id = 'rosevaToast';
        toast.className = 'fixed bottom-6 right-6 z-[9999] transform transition-all duration-300 translate-y-20 opacity-0 pointer-events-none';
        document.body.appendChild(toast);
    }

    const iconBg = type === 'success' ? 'bg-[#7A2E47] text-white' : 'bg-red-600 text-white';
    toast.innerHTML = `
        <div class="flex items-center gap-3 bg-[#FFFAF0] border border-[#7A2E47]/20 shadow-2xl rounded-xl px-5 py-3.5 text-roseva-text font-manrope text-sm">
            <span class="w-6 h-6 rounded-full ${iconBg} flex items-center justify-center text-xs font-bold shadow-sm">
                ✓
            </span>
            <span class="font-medium text-roseva-plum">${message}</span>
        </div>
    `;

    // Animate In
    toast.classList.remove('translate-y-20', 'opacity-0', 'pointer-events-none');
    toast.classList.add('translate-y-0', 'opacity-100');

    // Animate Out
    setTimeout(() => {
        toast.classList.remove('translate-y-0', 'opacity-100');
        toast.classList.add('translate-y-20', 'opacity-0', 'pointer-events-none');
    }, 3500);
}

// Update Navbar Desktop & Mobile Auth options
function updateAuthUI() {
    const user = getLoggedInUser();
    const desktopContainer = document.getElementById('navAuthDesktop');
    const mobileContainer = document.getElementById('navAuthMobile');

    if (desktopContainer) {
        if (user) {
            desktopContainer.innerHTML = `
                <div class="relative group/auth py-1">
                    <a href="profile.jsp" class="relative py-1 flex items-center gap-2 text-roseva-plum font-medium tracking-wide hover:text-[#100C08] transition-colors">
                        <span class="w-7 h-7 rounded-full bg-[#7A2E47]/10 text-roseva-plum flex items-center justify-center text-xs font-manrope font-bold border border-[#7A2E47]/20 shadow-sm">
                            ${user.name ? user.name.charAt(0).toUpperCase() : 'U'}
                        </span>
                        <span class="font-arapey text-lg">${user.name}</span>
                        <svg class="w-3.5 h-3.5 text-roseva-plum/70 group-hover/auth:rotate-180 transition-transform duration-200" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                        </svg>
                    </a>
                    <!-- Dropdown Menu -->
                    <div class="absolute right-0 top-full pt-2 opacity-0 invisible group-hover/auth:opacity-100 group-hover/auth:visible transition-all duration-200 z-50 min-w-[210px]">
                        <div class="bg-[#FFFAF0] border border-[#7A2E47]/15 rounded-xl shadow-2xl py-2 font-manrope text-sm text-roseva-text backdrop-blur-md">
                            <div class="px-4 py-2 border-b border-[#7A2E47]/10">
                                <p class="text-[10px] uppercase tracking-wider text-roseva-text/50 font-bold">Signed in as</p>
                                <p class="text-xs font-semibold text-roseva-plum truncate">${user.email || user.name}</p>
                            </div>
                            <a href="profile.jsp" class="flex items-center gap-2.5 px-4 py-2.5 hover:bg-[#7A2E47]/10 text-roseva-text hover:text-roseva-plum transition-colors">
                                <svg class="w-4 h-4 text-roseva-plum" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/></svg>
                                <span>My Profile</span>
                            </a>
                            <a href="#wishlist" class="flex items-center gap-2.5 px-4 py-2.5 hover:bg-[#7A2E47]/10 text-roseva-text hover:text-roseva-plum transition-colors">
                                <svg class="w-4 h-4 text-roseva-plum" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"/></svg>
                                <span>Wishlist</span>
                            </a>
                            <div class="border-t border-[#7A2E47]/10 my-1"></div>
                            <button type="button" onclick="logoutUser()" class="w-full text-left flex items-center gap-2.5 px-4 py-2 text-roseva-plum hover:bg-[#7A2E47]/10 hover:text-red-700 transition-colors">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"/></svg>
                                <span>Sign Out</span>
                            </button>
                        </div>
                    </div>
                </div>
            `;
        } else {
            desktopContainer.innerHTML = `
                <button type="button" onclick="openAuthModal('login')" class="relative py-1 font-arapey text-lg tracking-wide text-roseva-text hover:text-roseva-plum transition-colors after:absolute after:bottom-0 after:left-0 after:w-full after:h-0.5 after:bg-roseva-plum after:scale-x-0 hover:after:scale-x-100 after:transition-transform cursor-pointer flex items-center gap-1.5 focus:outline-none">
                    <span>Login / Sign Up</span>
                </button>
            `;
        }
    }

    if (mobileContainer) {
        if (user) {
            mobileContainer.innerHTML = `
                <div class="flex flex-col gap-3 pt-3 border-t border-[#7A2E47]/15">
                    <a href="profile.jsp" class="text-roseva-plum font-semibold flex items-center gap-2.5">
                        <span class="w-6 h-6 rounded-full bg-roseva-plum text-white flex items-center justify-center text-xs font-bold">${user.name.charAt(0)}</span>
                        <span>My Profile (${user.name})</span>
                    </a>
                    <a href="#wishlist" class="hover:text-roseva-plum transition-colors flex items-center gap-2">
                        <svg class="w-4 h-4 text-roseva-plum" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"/></svg>
                        <span>Wishlist</span>
                    </a>
                    <button type="button" onclick="logoutUser()" class="text-left text-sm text-red-700 font-manrope font-medium hover:underline">
                        Sign Out
                    </button>
                </div>
            `;
        } else {
            mobileContainer.innerHTML = `
                <button type="button" onclick="openAuthModal('login')" class="text-left hover:text-roseva-plum transition-colors focus:outline-none">
                    Login / Sign Up
                </button>
            `;
        }
    }

    // If profile page has dynamic name elements
    const profileHeading = document.getElementById('profileGreetingName');
    if (profileHeading) {
        profileHeading.innerText = user ? `Hello, ${user.name}!` : 'Hello, Guest!';
    }
    const profileInputName = document.getElementById('profileInputName');
    if (profileInputName && user && user.name) {
        profileInputName.value = user.name;
    }
    const profileInputEmail = document.getElementById('profileInputEmail');
    if (profileInputEmail && user && user.email) {
        profileInputEmail.value = user.email;
    }

    // If checkout page has name fields
    const checkoutFirstName = document.getElementById('firstName');
    const checkoutLastName = document.getElementById('lastName');
    if (checkoutFirstName && checkoutLastName && user && user.name) {
        const parts = user.name.trim().split(' ');
        if (!checkoutFirstName.value) checkoutFirstName.value = parts[0] || '';
        if (!checkoutLastName.value) checkoutLastName.value = parts.slice(1).join(' ') || '';
    }
}

// Modal open / close logic
function openAuthModal(defaultTab = 'login') {
    ensureAuthModal();
    const modal = document.getElementById('authModal');
    if (modal) {
        switchAuthTab(defaultTab);
        modal.classList.remove('hidden');
        modal.classList.add('flex');
        document.body.classList.add('overflow-hidden');
    }
}

function closeAuthModal() {
    const modal = document.getElementById('authModal');
    if (modal) {
        modal.classList.add('hidden');
        modal.classList.remove('flex');
        document.body.classList.remove('overflow-hidden');
    }
}

function switchAuthTab(tab) {
    const loginForm = document.getElementById('loginFormContainer');
    const signupForm = document.getElementById('signupFormContainer');
    const tabLogin = document.getElementById('tabLoginBtn');
    const tabSignup = document.getElementById('tabSignupBtn');

    if (!loginForm || !signupForm) return;

    if (tab === 'login') {
        loginForm.classList.remove('hidden');
        signupForm.classList.add('hidden');
        tabLogin.className = 'flex-1 py-2.5 text-center font-manrope font-semibold text-sm rounded-lg bg-roseva-plum text-white shadow-sm transition-all';
        tabSignup.className = 'flex-1 py-2.5 text-center font-manrope font-medium text-sm text-roseva-text/70 hover:text-roseva-plum transition-all';
    } else {
        loginForm.classList.add('hidden');
        signupForm.classList.remove('hidden');
        tabSignup.className = 'flex-1 py-2.5 text-center font-manrope font-semibold text-sm rounded-lg bg-roseva-plum text-white shadow-sm transition-all';
        tabLogin.className = 'flex-1 py-2.5 text-center font-manrope font-medium text-sm text-roseva-text/70 hover:text-roseva-plum transition-all';
    }
}

// Ensure the Auth Modal HTML is present in DOM
function ensureAuthModal() {
    if (document.getElementById('authModal')) return;

    const modalHtml = `
    <div id="authModal" class="fixed inset-0 z-[9990] hidden items-center justify-center p-4 bg-black/60 backdrop-blur-sm transition-opacity duration-300">
        <div class="relative bg-[#FFFAF0] border border-[#7A2E47]/20 rounded-2xl w-full max-w-md p-6 sm:p-8 shadow-2xl overflow-hidden animate-enter-bottom">
            <!-- Close Button -->
            <button onclick="closeAuthModal()" class="absolute top-4 right-4 p-1.5 text-roseva-text/60 hover:text-roseva-plum rounded-full hover:bg-[#7A2E47]/10 transition-colors focus:outline-none" aria-label="Close modal">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                </svg>
            </button>

            <!-- Brand Header -->
            <div class="text-center mb-6">
                <h2 class="font-stylescript text-5xl sm:text-6xl text-roseva-plum tracking-wide leading-none pb-1">Roséva</h2>
                <p class="font-arapey text-sm text-roseva-text/70 mt-1">The Proof is in Your Reflection</p>
            </div>

            <!-- Tabs Switcher -->
            <div class="flex bg-[#F5EFE6] p-1 rounded-xl mb-6 border border-[#7A2E47]/10">
                <button type="button" id="tabLoginBtn" onclick="switchAuthTab('login')" class="flex-1 py-2.5 text-center font-manrope font-semibold text-sm rounded-lg bg-roseva-plum text-white shadow-sm transition-all">
                    Sign In
                </button>
                <button type="button" id="tabSignupBtn" onclick="switchAuthTab('signup')" class="flex-1 py-2.5 text-center font-manrope font-medium text-sm text-roseva-text/70 hover:text-roseva-plum transition-all">
                    Create Account
                </button>
            </div>

            <!-- Sign In Form -->
            <div id="loginFormContainer">
                <form id="signInForm" onsubmit="handleSignIn(event)" class="space-y-4 font-quicksand text-sm">
                    <div>
                        <label class="block text-roseva-text/80 mb-1 font-medium">Email or Username</label>
                        <input type="text" id="loginEmail" required placeholder="tousif.tasrik@roseva.com" class="w-full px-4 py-2.5 bg-white border border-[#D5CFC3] rounded-lg text-roseva-text focus:outline-none focus:border-roseva-plum focus:ring-1 focus:ring-roseva-plum transition-colors shadow-sm" />
                    </div>
                    <div>
                        <div class="flex justify-between items-center mb-1">
                            <label class="text-roseva-text/80 font-medium">Password</label>
                            <a href="javascript:void(0)" onclick="alert('Password reset link sent to your registered email!')" class="text-xs text-roseva-plum hover:underline">Forgot password?</a>
                        </div>
                        <input type="password" id="loginPassword" required placeholder="••••••••" class="w-full px-4 py-2.5 bg-white border border-[#D5CFC3] rounded-lg text-roseva-text focus:outline-none focus:border-roseva-plum focus:ring-1 focus:ring-roseva-plum transition-colors shadow-sm" />
                    </div>
                    <div class="flex items-center gap-2 pt-1">
                        <input type="checkbox" id="rememberMe" checked class="w-4 h-4 text-roseva-plum accent-roseva-plum rounded cursor-pointer" />
                        <label for="rememberMe" class="text-xs text-roseva-text/80 cursor-pointer select-none">Remember this device</label>
                    </div>

                    <button type="submit" class="w-full bg-roseva-plum hover:bg-[#100C08] text-white font-manrope font-semibold text-sm py-3 rounded-lg shadow-sm transition-all mt-2">
                        Sign In
                    </button>
                </form>

                <!-- Divider -->
                <div class="relative my-5 text-center">
                    <div class="absolute inset-0 flex items-center"><div class="w-full border-t border-[#7A2E47]/15"></div></div>
                    <span class="relative bg-[#FFFAF0] px-3 font-arapey text-xs text-roseva-text/60">Quick Demo Access</span>
                </div>

                <!-- One-click Demo Login -->
                <button type="button" onclick="quickDemoLogin()" class="w-full flex items-center justify-center gap-2 py-2.5 px-4 bg-white border border-[#7A2E47]/25 rounded-lg text-roseva-plum hover:bg-[#7A2E47]/5 font-manrope font-medium text-xs transition-all shadow-sm">
                    <span>✨</span>
                    <span>One-Click Login as <strong>Tousif Tasrik</strong></span>
                </button>
            </div>

            <!-- Sign Up Form -->
            <div id="signupFormContainer" class="hidden">
                <form id="signUpForm" onsubmit="handleSignUp(event)" class="space-y-4 font-quicksand text-sm">
                    <div>
                        <label class="block text-roseva-text/80 mb-1 font-medium">Full Name</label>
                        <input type="text" id="regName" required placeholder="Tousif Tasrik" class="w-full px-4 py-2.5 bg-white border border-[#D5CFC3] rounded-lg text-roseva-text focus:outline-none focus:border-roseva-plum focus:ring-1 focus:ring-roseva-plum transition-colors shadow-sm" />
                    </div>
                    <div>
                        <label class="block text-roseva-text/80 mb-1 font-medium">Email Address</label>
                        <input type="email" id="regEmail" required placeholder="tousif@example.com" class="w-full px-4 py-2.5 bg-white border border-[#D5CFC3] rounded-lg text-roseva-text focus:outline-none focus:border-roseva-plum focus:ring-1 focus:ring-roseva-plum transition-colors shadow-sm" />
                    </div>
                    <div>
                        <label class="block text-roseva-text/80 mb-1 font-medium">Create Password</label>
                        <input type="password" id="regPassword" required placeholder="At least 6 characters" class="w-full px-4 py-2.5 bg-white border border-[#D5CFC3] rounded-lg text-roseva-text focus:outline-none focus:border-roseva-plum focus:ring-1 focus:ring-roseva-plum transition-colors shadow-sm" />
                    </div>
                    <div class="flex items-start gap-2 pt-1">
                        <input type="checkbox" id="termsCheck" required class="w-4 h-4 mt-0.5 text-roseva-plum accent-roseva-plum rounded cursor-pointer" />
                        <label for="termsCheck" class="text-xs text-roseva-text/80 cursor-pointer">
                            I agree to Roséva's <a href="journal.jsp" class="text-roseva-plum hover:underline">Transparency Terms</a> and Privacy Policy.
                        </label>
                    </div>

                    <button type="submit" class="w-full bg-roseva-plum hover:bg-[#100C08] text-white font-manrope font-semibold text-sm py-3 rounded-lg shadow-sm transition-all mt-2">
                        Create My Account
                    </button>
                </form>
            </div>
        </div>
    </div>
    `;

    document.body.insertAdjacentHTML('beforeend', modalHtml);

    // Close on backdrop click
    const modal = document.getElementById('authModal');
    modal.addEventListener('click', (e) => {
        if (e.target === modal) {
            closeAuthModal();
        }
    });

    // Close on Escape
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && !modal.classList.contains('hidden')) {
            closeAuthModal();
        }
    });
}

function handleSignIn(e) {
    e.preventDefault();
    const emailInput = document.getElementById('loginEmail').value.trim();
    let name = emailInput.split('@')[0];
    if (name.includes('.')) {
        name = name.split('.').map(part => part.charAt(0).toUpperCase() + part.slice(1)).join(' ');
    } else {
        name = name.charAt(0).toUpperCase() + name.slice(1);
    }

    // If it's tousif email, use formatted name
    if (emailInput.toLowerCase().includes('tousif')) {
        name = 'Tousif Tasrik';
    }

    setLoggedInUser({
        name: name || 'Valued Member',
        email: emailInput.includes('@') ? emailInput : `${emailInput}@roseva.com`
    });
    closeAuthModal();
}

function handleSignUp(e) {
    e.preventDefault();
    const name = document.getElementById('regName').value.trim();
    const email = document.getElementById('regEmail').value.trim();

    setLoggedInUser({
        name: name,
        email: email
    });
    closeAuthModal();
}

// Initialise Auth & Navbar on DOM load
document.addEventListener('DOMContentLoaded', () => {
    ensureAuthModal();
    updateAuthUI();
});

// ==========================================
// EXISTING ROSÉVA LOGIC (Mobile Menu, Carousel, Dropdowns)
// ==========================================
document.addEventListener('DOMContentLoaded', () => {
    // Mobile Menu Toggle
    const mobileMenuBtn = document.getElementById('mobileMenuBtn');
    const mobileMenu = document.getElementById('mobileMenu');

    if (mobileMenuBtn && mobileMenu) {
        mobileMenuBtn.addEventListener('click', () => {
            mobileMenu.classList.toggle('hidden');
        });

        // Close on link click
        mobileMenu.querySelectorAll('a, button').forEach(link => {
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
    const pageNum = parseInt(pageNumber, 10);
    setProductPage(pageNum);
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

// ==========================================
// PRODUCTS PAGINATION SYSTEM
// ==========================================
let currentProductPage = 1;
const totalProductPages = 10;

function renderPagination() {
    const container = document.getElementById('paginationButtons');
    if (!container) return;

    const total = totalProductPages;
    const current = currentProductPage;

    // Sync "Go to" button label
    const label = document.getElementById('selectedPageLabel');
    if (label) {
        label.innerText = `Page ${current}`;
    }

    // Calculate smart page range with ellipsis
    let pages = [];
    if (total <= 7) {
        for (let i = 1; i <= total; i++) pages.push(i);
    } else {
        pages.push(1);

        let start = Math.max(2, current - 2);
        let end = Math.min(total - 1, current + 2);

        if (current <= 4) {
            start = 2;
            end = 5;
        } else if (current >= total - 3) {
            start = total - 4;
            end = total - 1;
        }

        if (start > 2) {
            pages.push('...');
        }

        for (let i = start; i <= end; i++) {
            pages.push(i);
        }

        if (end < total - 1) {
            pages.push('...');
        }

        pages.push(total);
    }

    // Previous Arrow (<)
    const prevDisabled = current <= 1;
    let html = `
        <button type="button" onclick="changeProductPage(-1)" ${prevDisabled ? 'disabled' : ''}
            class="w-8 h-8 sm:w-9 sm:h-9 rounded-lg flex items-center justify-center border ${prevDisabled ? 'border-[#EBE3D7]/60 text-roseva-text/30 cursor-not-allowed bg-white/40' : 'border-[#D5CFC3] text-roseva-text/80 hover:border-roseva-plum hover:text-roseva-plum hover:bg-white bg-white/80 cursor-pointer'} transition-all font-medium text-sm shadow-sm focus:outline-none"
            title="Previous page" aria-label="Previous Page">
            <svg class="w-3.5 h-3.5 sm:w-4 sm:h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
            </svg>
        </button>
    `;

    // Numeric Buttons & Ellipsis
    pages.forEach(p => {
        if (p === '...') {
            html += `<span class="w-6 sm:w-8 h-8 sm:h-9 flex items-center justify-center text-roseva-text/40 font-medium select-none">...</span>`;
        } else {
            const isActive = p === current;
            if (isActive) {
                html += `
                    <button type="button" onclick="setProductPage(${p})"
                        class="w-8 h-8 sm:w-9 sm:h-9 rounded-lg bg-roseva-plum text-white font-semibold flex items-center justify-center shadow-md transition-all scale-105 focus:outline-none font-manrope text-xs sm:text-sm">
                        ${p}
                    </button>
                `;
            } else {
                html += `
                    <button type="button" onclick="setProductPage(${p})"
                        class="w-8 h-8 sm:w-9 sm:h-9 rounded-lg border border-[#D5CFC3] bg-white/80 text-roseva-text/80 hover:border-roseva-plum hover:text-roseva-plum hover:bg-white font-medium flex items-center justify-center transition-all shadow-sm focus:outline-none font-manrope text-xs sm:text-sm">
                        ${p}
                    </button>
                `;
            }
        }
    });

    // Next Arrow (>)
    const nextDisabled = current >= total;
    html += `
        <button type="button" onclick="changeProductPage(1)" ${nextDisabled ? 'disabled' : ''}
            class="w-8 h-8 sm:w-9 sm:h-9 rounded-lg flex items-center justify-center border ${nextDisabled ? 'border-[#EBE3D7]/60 text-roseva-text/30 cursor-not-allowed bg-white/40' : 'border-[#D5CFC3] text-roseva-text/80 hover:border-roseva-plum hover:text-roseva-plum hover:bg-white bg-white/80 cursor-pointer'} transition-all font-medium text-sm shadow-sm focus:outline-none"
            title="Next page" aria-label="Next Page">
            <svg class="w-3.5 h-3.5 sm:w-4 sm:h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
            </svg>
        </button>
    `;

    container.innerHTML = html;
}

function changeProductPage(delta) {
    setProductPage(currentProductPage + delta);
}

function setProductPage(newPage) {
    if (newPage < 1 || newPage > totalProductPages) return;
    currentProductPage = newPage;
    renderPagination();
}

// Initialise pagination on DOM Load
document.addEventListener('DOMContentLoaded', () => {
    renderPagination();
});

