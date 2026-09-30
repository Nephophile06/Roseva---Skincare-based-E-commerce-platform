// Roséva Skincare - Main Application Logic

// ==========================================
// AUTHENTICATION & USER STATE MANAGEMENT
// ==========================================
const AUTH_STORAGE_KEY = 'roseva_user';
const GUEST_CART_STORAGE_KEY = 'roseva_guest_cart';

// Product Catalog metadata for uniform cart items
const PRODUCT_CATALOG = {
    'Roséva Hydro-Boost': { price: 20, size: '100ml', image: 'assets/hydro boost.png' },
    'Roséva Glow Restore': { price: 35, size: '320ml', image: 'assets/glow restore.png' },
    'Roséva Skin Renewal': { price: 40, size: '60ml', image: 'assets/skin renewal.png' },
    'Roséva Cloud Drench': { price: 15, size: '250ml', image: 'assets/cloud drench.png' },
    'Roséva Cloud Drench Intensive': { price: 58, size: '200ml', image: 'assets/cloud drench.png' },
    'Roséva Hydro-Boost Crème': { price: 46, size: '50ml', image: 'assets/hydro boost.png' },
    'Roséva Skin Renewal Concentrate': { price: 62, size: '30ml', image: 'assets/skin renewal.png' },
    'Roséva Glow Restore Milk': { price: 35, size: '150ml', image: 'assets/glow restore.png' },
    'Roséva Hydro-Boost Balm': { price: 48, size: '50ml', image: 'assets/hydro boost.png' },
    'Roséva Cloud Drench Mist': { price: 52, size: '120ml', image: 'assets/cloud drench.png' }
};

function getUserCartKey(user) {
    if (!user) user = getLoggedInUser();
    if (!user) return null;
    return 'roseva_cart_' + (user.email || user.name || 'user').replace(/[^a-zA-Z0-9_]/g, '_');
}

function getCartItems() {
    const user = getLoggedInUser();
    try {
        if (user) {
            const key = getUserCartKey(user);
            const data = localStorage.getItem(key);
            return data ? JSON.parse(data) : [];
        } else {
            let data = localStorage.getItem(GUEST_CART_STORAGE_KEY);
            // Backward-compatibility: migrate from sessionStorage if present
            if (!data) {
                const oldSessionData = sessionStorage.getItem(GUEST_CART_STORAGE_KEY);
                if (oldSessionData) {
                    localStorage.setItem(GUEST_CART_STORAGE_KEY, oldSessionData);
                    sessionStorage.removeItem(GUEST_CART_STORAGE_KEY);
                    data = oldSessionData;
                }
            }
            return data ? JSON.parse(data) : [];
        }
    } catch (e) {
        console.error('Error reading cart items:', e);
        return [];
    }
}

function saveCartItems(items) {
    const user = getLoggedInUser();
    try {
        if (user) {
            const key = getUserCartKey(user);
            localStorage.setItem(key, JSON.stringify(items));
        } else {
            localStorage.setItem(GUEST_CART_STORAGE_KEY, JSON.stringify(items));
        }
    } catch (e) {
        console.error('Error saving cart items:', e);
    }
    updateCartBadge();
}

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

        // Merge any temporary guest cart from localStorage into logged in user's cart
        try {
            const guestData = localStorage.getItem(GUEST_CART_STORAGE_KEY);
            if (guestData) {
                const guestItems = JSON.parse(guestData);
                if (Array.isArray(guestItems) && guestItems.length > 0) {
                    const userKey = getUserCartKey(user);
                    const userCart = JSON.parse(localStorage.getItem(userKey) || '[]');
                    guestItems.forEach(gItem => {
                        const existing = userCart.find(u => u.name === gItem.name);
                        if (existing) {
                            existing.quantity = (existing.quantity || 1) + (gItem.quantity || 1);
                        } else {
                            userCart.push(gItem);
                        }
                    });
                    localStorage.setItem(userKey, JSON.stringify(userCart));
                }
                localStorage.removeItem(GUEST_CART_STORAGE_KEY);
            }
        } catch (mergeErr) {
            console.error('Error merging guest cart:', mergeErr);
        }

        updateAuthUI();
        updateCartBadge();
        if (window.location.pathname.includes('cart.jsp')) {
            renderCartPage();
        }
        if (window.location.pathname.includes('checkout.jsp')) {
            renderCheckoutItems();
        }
        showAuthToast(`Welcome, ${user.name}!`);
    } catch (e) {
        console.error('Error saving user state:', e);
    }
}

function logoutUser() {
    localStorage.removeItem(AUTH_STORAGE_KEY);
    updateAuthUI();
    updateCartBadge();
    if (window.location.pathname.includes('cart.jsp')) {
        renderCartPage();
    }
    if (window.location.pathname.includes('checkout.jsp')) {
        window.location.href = 'cart.jsp?loginRequired=1';
    }
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

// Initialise Auth, Navbar & Cart on DOM load
document.addEventListener('DOMContentLoaded', () => {
    ensureAuthModal();
    updateAuthUI();
    updateCartBadge();
    if (window.location.pathname.includes('cart.jsp')) {
        renderCartPage();
    }
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

// ==========================================
// SHOPPING CART CORE LOGIC & OPERATIONS
// ==========================================

function updateCartBadge() {
    const badge = document.getElementById('cartBadge');
    if (!badge) return;
    const items = getCartItems();
    const count = items.length;
    badge.innerText = count;
    badge.classList.add('scale-125');
    setTimeout(() => badge.classList.remove('scale-125'), 200);
}

function addToCart(productName, price, quantity = 1, showToast = true) {
    const qty = typeof quantity === 'number' && quantity > 0 ? quantity : 1;
    const catalog = PRODUCT_CATALOG[productName] || {};
    const itemPrice = typeof price === 'number' && price > 0 ? price : (catalog.price || 20);
    const itemSize = catalog.size || '100ml';
    const itemImage = catalog.image || 'assets/logo.png';

    const items = getCartItems();
    const existingIndex = items.findIndex(item => item.name === productName);

    if (existingIndex > -1) {
        items[existingIndex].quantity = (items[existingIndex].quantity || 1) + qty;
        if (items[existingIndex].selected === undefined) {
            items[existingIndex].selected = true;
        }
    } else {
        items.push({
            id: 'item-' + Date.now() + '-' + Math.floor(Math.random() * 1000),
            name: productName,
            price: itemPrice,
            quantity: qty,
            size: itemSize,
            image: itemImage,
            selected: true
        });
    }

    saveCartItems(items);

    if (showToast) {
        showAuthToast(`Added ${qty} × ${productName} to cart!`);
    }

    if (window.location.pathname.includes('cart.jsp')) {
        renderCartPage();
    }
}

// Card Quantity Stepper & Direct Add-to-Cart helpers
function decrementCardQty(id) {
    const el = document.getElementById(id);
    if (el) {
        let val = parseInt(el.innerText, 10) || 1;
        if (val > 1) {
            el.innerText = val - 1;
        }
    }
}

function incrementCardQty(id) {
    const el = document.getElementById(id);
    if (el) {
        let val = parseInt(el.innerText, 10) || 1;
        el.innerText = val + 1;
    }
}

function addCardToCart(name, price, qtyId) {
    const el = document.getElementById(qtyId);
    const qty = el ? (parseInt(el.innerText, 10) || 1) : 1;
    addToCart(name, price, qty, true);
}

// Cart Page UI Rendering & Calculation Handler
function renderCartPage() {
    const emptyState = document.getElementById('cartEmptyState');
    const contentWrapper = document.getElementById('cartContentWrapper');
    const itemsList = document.getElementById('cartItemsList');
    const itemCountLabel = document.getElementById('itemCountLabel');
    const selectAllCheckbox = document.getElementById('selectAllCheckbox');
    const totalAmountEl = document.getElementById('selectedTotalAmount');
    const authPrompt = document.getElementById('cartSignInPrompt');

    if (!itemsList) return;

    const user = getLoggedInUser();
    const items = getCartItems();

    if (authPrompt) {
        authPrompt.style.display = user ? 'none' : 'block';
    }

    if (!items || items.length === 0) {
        if (emptyState) {
            emptyState.classList.remove('hidden');
            emptyState.classList.add('flex');
        }
        if (contentWrapper) {
            contentWrapper.classList.add('hidden');
        }
        if (itemCountLabel) itemCountLabel.innerText = '(0 Items)';
        if (selectAllCheckbox) selectAllCheckbox.checked = false;
        if (totalAmountEl) totalAmountEl.innerText = '$0';
        updateCartBadge();
        return;
    }

    if (emptyState) {
        emptyState.classList.add('hidden');
        emptyState.classList.remove('flex');
    }
    if (contentWrapper) {
        contentWrapper.classList.remove('hidden');
    }

    let html = '';
    items.forEach(item => {
        const isChecked = item.selected !== false;
        const subtotal = (item.price || 0) * (item.quantity || 1);
        html += `
            <div class="cart-item-row bg-[#EFEBE9] rounded-xl p-4 sm:p-6 flex flex-col md:grid md:grid-cols-12 gap-4 items-center shadow-sm transition-all duration-200"
                data-id="${item.id}" data-price="${item.price}">
                <!-- Left: Checkbox + Product Image + Title/Size/Wishlist -->
                <div class="w-full md:col-span-6 flex items-center gap-4">
                    <input type="checkbox" ${isChecked ? 'checked' : ''} onchange="handleItemCheckboxChange('${item.id}', this.checked)"
                        class="item-checkbox w-4 h-4 rounded border-[#D5CFC3] text-roseva-plum accent-roseva-plum focus:ring-0 cursor-pointer flex-shrink-0" />
                    <div class="w-16 h-16 sm:w-20 sm:h-20 rounded-lg overflow-hidden bg-white/70 border border-[#E0D7C9] flex-shrink-0">
                        <img src="${item.image || 'assets/logo.png'}" alt="${item.name}" class="w-full h-full object-cover">
                    </div>
                    <div class="flex flex-col gap-1">
                        <h3 class="font-oranienbaum text-base sm:text-lg text-roseva-text font-medium leading-snug">
                            ${item.name}
                        </h3>
                        <div class="flex items-center gap-3">
                            <span class="font-quicksand text-xs text-roseva-text/60">(${item.size || '100ml'})</span>
                            <button type="button" onclick="toggleItemWishlist(this)"
                                class="text-roseva-text/60 hover:text-roseva-plum transition-colors focus:outline-none"
                                aria-label="Save to wishlist">
                                <svg class="w-4 h-4 wishlist-heart" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8"
                                        d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Price -->
                <div class="w-full md:col-span-2 flex justify-between md:justify-center items-center font-quicksand text-sm sm:text-base font-semibold text-roseva-text">
                    <span class="md:hidden text-xs font-normal text-roseva-text/60">Price:</span>
                    <span>$${item.price}</span>
                </div>

                <!-- Quantity Controls: + QTY - -->
                <div class="w-full md:col-span-2 flex justify-between md:justify-center items-center">
                    <span class="md:hidden text-xs font-normal text-roseva-text/60">Quantity:</span>
                    <div class="flex items-center gap-3 font-manrope text-sm font-medium text-roseva-text">
                        <button type="button" onclick="changeItemQty('${item.id}', 1)"
                            class="w-6 h-6 flex items-center justify-center hover:text-roseva-plum transition-colors focus:outline-none text-base font-bold select-none cursor-pointer">+</button>
                        <span class="item-qty w-4 text-center font-semibold">${item.quantity}</span>
                        <button type="button" onclick="changeItemQty('${item.id}', -1)"
                            class="w-6 h-6 flex items-center justify-center hover:text-roseva-plum transition-colors focus:outline-none text-base font-bold select-none cursor-pointer">-</button>
                    </div>
                </div>

                <!-- Subtotal -->
                <div class="w-full md:col-span-2 flex justify-between md:justify-end items-center font-quicksand text-sm sm:text-base font-bold text-roseva-text">
                    <span class="md:hidden text-xs font-normal text-roseva-text/60">Subtotal:</span>
                    <span class="item-subtotal">$${subtotal}</span>
                </div>
            </div>
        `;
    });

    itemsList.innerHTML = html;
    updateCartCalculations();
}

function handleItemCheckboxChange(id, isChecked) {
    const items = getCartItems();
    const item = items.find(i => i.id === id);
    if (item) {
        item.selected = isChecked;
        saveCartItems(items);
        updateCartCalculations();
    }
}

function changeItemQty(id, delta) {
    const items = getCartItems();
    const item = items.find(i => i.id === id);
    if (!item) return;

    item.quantity = Math.max(1, (item.quantity || 1) + delta);
    saveCartItems(items);
    renderCartPage();
}

function toggleSelectAll(selectAllCheckbox) {
    const isChecked = selectAllCheckbox.checked;
    const items = getCartItems();
    items.forEach(item => {
        item.selected = isChecked;
    });
    saveCartItems(items);

    document.querySelectorAll('.item-checkbox').forEach(cb => {
        cb.checked = isChecked;
    });
    updateCartCalculations();
}

function updateCartCalculations() {
    const items = getCartItems();
    const selectAll = document.getElementById('selectAllCheckbox');
    const countLabel = document.getElementById('itemCountLabel');
    const totalAmountEl = document.getElementById('selectedTotalAmount');

    let totalSelectedPrice = 0;
    let totalCheckedCount = 0;

    items.forEach(item => {
        if (item.selected !== false) {
            totalSelectedPrice += ((item.price || 0) * (item.quantity || 1));
            totalCheckedCount++;
        }
    });

    if (selectAll) {
        selectAll.checked = items.length > 0 && totalCheckedCount === items.length;
    }

    if (countLabel) {
        countLabel.innerText = `(${items.length} Items)`;
    }

    if (totalAmountEl) {
        totalAmountEl.innerText = `$${totalSelectedPrice}`;
    }

    updateCartBadge();
}

function deleteSelectedItems() {
    let items = getCartItems();
    const selectedCount = items.filter(i => i.selected !== false).length;
    if (selectedCount === 0) {
        alert('Please select at least one item to delete.');
        return;
    }

    items = items.filter(i => i.selected === false);
    saveCartItems(items);
    renderCartPage();
    showAuthToast('Selected items removed from cart.');
}

function toggleItemWishlist(btn) {
    const heart = btn.querySelector('.wishlist-heart');
    if (heart) {
        heart.classList.toggle('text-roseva-plum');
        heart.classList.toggle('fill-current');
    }
}

function proceedToCheckout() {
    const user = getLoggedInUser();
    if (!user) {
        openAuthModal('login');
        showAuthToast('Please sign in to proceed to checkout!', 'error');
        return;
    }

    const items = getCartItems();
    const selectedItems = items.filter(i => i.selected !== false);
    if (selectedItems.length === 0) {
        alert('Please select at least one item to proceed.');
        return;
    }
    sessionStorage.setItem('roseva_checkout_items', JSON.stringify(selectedItems));
    window.location.href = 'checkout.jsp';
}

// ==========================================
// CHECKOUT PAGE RENDERING & CALCULATIONS
// ==========================================

function renderCheckoutItems() {
    const list = document.getElementById('checkoutOrderDetailsList');
    if (!list) return;

    // Auth Guard: Only logged-in users can access checkout
    const user = getLoggedInUser();
    if (!user) {
        sessionStorage.setItem('roseva_checkout_login_required', '1');
        window.location.href = 'cart.jsp?loginRequired=1';
        return;
    }

    // By default, no fields or payment methods are pre-filled or pre-selected
    const countLabel = document.getElementById('checkoutItemsCountLabel');
    const subtotalLabel = document.getElementById('checkoutSubtotalAmount');
    const shippingLabel = document.getElementById('checkoutShippingAmount');
    const discountLabel = document.getElementById('checkoutDiscountAmount');
    const totalLabel = document.getElementById('checkoutTotalAmount');

    let checkoutItems = [];
    try {
        const data = sessionStorage.getItem('roseva_checkout_items');
        if (data) {
            checkoutItems = JSON.parse(data);
        }
    } catch (e) {
        console.error('Error reading checkout items:', e);
    }

    checkoutItems = Array.isArray(checkoutItems) ? checkoutItems.filter(i => i && typeof i === 'object' && i.name) : [];

    // Fallback: If no session checkout items, get from active account cart
    if (checkoutItems.length === 0) {
        const cartItems = getCartItems();
        const selectedOnly = cartItems.filter(i => i && i.selected !== false);
        checkoutItems = selectedOnly.length > 0 ? selectedOnly : cartItems;
    }

    if (checkoutItems.length === 0) {
        list.innerHTML =
            '<div class="py-8 text-center bg-white/50 rounded-xl border border-[#7A2E47]/10 p-4">' +
            '<p class="text-roseva-text/70 italic text-sm mb-3">No products found in your cart.</p>' +
            '<a href="products.jsp" class="inline-block bg-roseva-plum text-white text-xs font-semibold px-4 py-2 rounded-md hover:bg-[#100C08] transition-colors">Shop Formulations</a>' +
            '</div>';
        if (countLabel) countLabel.innerText = '0 Items';
        if (subtotalLabel) subtotalLabel.innerText = '$0';
        if (shippingLabel) shippingLabel.innerText = '$0';
        if (discountLabel) discountLabel.innerText = '$0';
        if (totalLabel) totalLabel.innerText = '$0';
        return;
    }

    let html = '';
    let subtotal = 0;
    let totalQty = 0;

    checkoutItems.forEach((item, index) => {
        const catalog = PRODUCT_CATALOG[item.name] || {};
        const name = item.name || 'Roséva Botanical Formula';
        const size = (item.size && typeof item.size === 'string') ? item.size : (catalog.size || '100ml');
        const price = (typeof item.price === 'number' && item.price > 0) ? item.price : (catalog.price || 20);
        const quantity = (typeof item.quantity === 'number' && item.quantity > 0) ? item.quantity : 1;
        const itemSubtotal = price * quantity;

        subtotal += itemSubtotal;
        totalQty += quantity;

        html +=
            '<div class="flex items-baseline justify-between gap-4 pb-3 border-b border-[#7A2E47]/10 last:border-b-0">' +
            '<div class="leading-relaxed">' +
            '<span class="font-medium text-roseva-text block">' + (index + 1) + '. ' + name + '</span>' +
            '<span class="text-xs text-roseva-text/60">(' + size + ') &nbsp; × ' + quantity + '</span>' +
            '</div>' +
            '<span class="font-semibold text-roseva-text text-base">$' + itemSubtotal + '</span>' +
            '</div>';
    });

    list.innerHTML = html;

    // Requirement: Shipping fee is $10, Discount is $2, Total sum is $2 less than Subtotal + Shipping
    const shipping = 10;
    const discount = 2;
    const grandTotal = Math.max(0, subtotal + shipping - discount);

    if (countLabel) countLabel.innerText = totalQty + (totalQty === 1 ? ' Item' : ' Items');
    if (subtotalLabel) subtotalLabel.innerText = '$' + subtotal;
    if (shippingLabel) shippingLabel.innerText = '$' + shipping;
    if (discountLabel) discountLabel.innerText = '$' + discount;
    if (totalLabel) totalLabel.innerText = '$' + grandTotal;

    // Attach listeners for checkout validation
    initCheckoutFormListeners();
}

function handlePaymentMethodChange(method) {
    const cardAccordion = document.getElementById('cardDetailsAccordion');
    if (cardAccordion) {
        if (method === 'card') {
            cardAccordion.classList.remove('hidden');
        } else {
            cardAccordion.classList.add('hidden');
        }
    }
    validateCheckoutForm();
}

function validateCheckoutForm() {
    const emailInput = document.getElementById('checkoutEmail');
    const phoneInput = document.getElementById('checkoutPhone');
    const firstNameInput = document.getElementById('firstName');
    const lastNameInput = document.getElementById('lastName');
    const streetAddressInput = document.getElementById('streetAddress');
    const districtInput = document.getElementById('district');
    const cityLabel = document.getElementById('selectedCityLabel');
    const checkedPayment = document.querySelector('input[name="paymentMethod"]:checked');
    const confirmBtn = document.getElementById('confirmOrderBtn');

    if (!confirmBtn) return false;

    const email = emailInput ? emailInput.value.trim() : '';
    const phone = phoneInput ? phoneInput.value.trim() : '';
    const firstName = firstNameInput ? firstNameInput.value.trim() : '';
    const lastName = lastNameInput ? lastNameInput.value.trim() : '';
    const streetAddress = streetAddressInput ? streetAddressInput.value.trim() : '';
    const district = districtInput ? districtInput.value.trim() : '';
    const city = cityLabel ? cityLabel.innerText.trim().toLowerCase() : '';
    const isCitySelected = city && city !== 'select city' && city !== 'select';

    let isValid = (
        email.length > 0 &&
        phone.length > 0 &&
        firstName.length > 0 &&
        lastName.length > 0 &&
        streetAddress.length > 0 &&
        district.length > 0 &&
        isCitySelected &&
        checkedPayment !== null
    );

    // If Card payment is selected, card fields are also required
    if (isValid && checkedPayment && checkedPayment.value === 'card') {
        const cardHolder = document.getElementById('cardHolderName');
        const cardNumber = document.getElementById('cardNumber');
        const cardExpiry = document.getElementById('cardExpiry');
        const cardCvc = document.getElementById('cardCvc');

        const holderVal = cardHolder ? cardHolder.value.trim() : '';
        const numberVal = cardNumber ? cardNumber.value.trim() : '';
        const expiryVal = cardExpiry ? cardExpiry.value.trim() : '';
        const cvcVal = cardCvc ? cardCvc.value.trim() : '';

        if (!holderVal || !numberVal || !expiryVal || !cvcVal) {
            isValid = false;
        }
    }

    if (isValid) {
        confirmBtn.disabled = false;
        confirmBtn.className = 'bg-roseva-plum hover:bg-[#100C08] text-white font-manrope font-semibold text-sm sm:text-base px-8 py-3 rounded-lg shadow-md hover:shadow-lg transition-all duration-300 transform hover:-translate-y-0.5 cursor-pointer';
    } else {
        confirmBtn.disabled = true;
        confirmBtn.className = 'bg-[#C4A4A4] text-white/90 font-manrope font-semibold text-sm sm:text-base px-8 py-3 rounded-lg shadow-sm transition-all duration-300 cursor-not-allowed';
    }

    return isValid;
}

function initCheckoutFormListeners() {
    const inputIds = [
        'checkoutEmail', 'checkoutPhone', 'firstName', 'lastName',
        'streetAddress', 'district', 'cardHolderName', 'cardNumber',
        'cardExpiry', 'cardCvc'
    ];

    inputIds.forEach(id => {
        const el = document.getElementById(id);
        if (el) {
            el.addEventListener('input', validateCheckoutForm);
            el.addEventListener('change', validateCheckoutForm);
        }
    });

    const paymentRadios = document.querySelectorAll('input[name="paymentMethod"]');
    paymentRadios.forEach(radio => {
        radio.addEventListener('change', () => {
            handlePaymentMethodChange(radio.value);
        });
    });

    validateCheckoutForm();
}

function confirmOrder() {
    const user = getLoggedInUser();
    if (!user) {
        alert('Please log in to confirm your order.');
        window.location.href = 'cart.jsp?loginRequired=1';
        return;
    }

    if (!validateCheckoutForm()) {
        alert('Please fill out all required fields before confirming your order.');
        return;
    }

    try {
        let checkoutItems = [];
        const data = sessionStorage.getItem('roseva_checkout_items');
        if (data) {
            checkoutItems = JSON.parse(data);
        }
        if (!checkoutItems || checkoutItems.length === 0) {
            checkoutItems = getCartItems().filter(i => i.selected !== false);
        }

        const purchasedNames = new Set(checkoutItems.map(p => p.name));
        let cart = getCartItems();
        cart = cart.filter(item => !purchasedNames.has(item.name));
        saveCartItems(cart);
        sessionStorage.removeItem('roseva_checkout_items');
    } catch (e) {
        console.error('Error updating cart on order confirm:', e);
    }

    alert('Order placed successfully! Redirecting to your profile dashboard...');
    window.location.href = 'profile.jsp';
}

window.renderCheckoutItems = renderCheckoutItems;
window.confirmOrder = confirmOrder;
window.handlePaymentMethodChange = handlePaymentMethodChange;
window.validateCheckoutForm = validateCheckoutForm;

// Initialize checkout items on DOMContentLoaded
document.addEventListener('DOMContentLoaded', () => {
    if (document.getElementById('checkoutOrderDetailsList') || window.location.pathname.includes('checkout.jsp')) {
        renderCheckoutItems();
    }
});

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

// ==========================================
// PRODUCTS SEARCH, FILTER & SORT SYSTEM
// ==========================================
let currentSortMode = 'most-relevant'; // 'most-relevant' | 'low-to-high' | 'high-to-low'
let currentSearchQuery = '';
let currentCategoryFilter = '';

function getProductCards() {
    const grid = document.getElementById('productGrid');
    if (!grid) return [];
    return Array.from(grid.querySelectorAll('.product-card'));
}

function getCardData(card) {
    const name = (card.getAttribute('data-name') || (card.querySelector('h3') ? card.querySelector('h3').innerText : '')).trim();
    const tag = (card.getAttribute('data-tag') || (card.querySelector('p.font-quicksand') ? card.querySelector('p.font-quicksand').innerText : '')).trim();

    let price = parseFloat(card.getAttribute('data-price') || '0');
    if (!price || isNaN(price)) {
        const priceEl = card.querySelector('p.font-bold');
        if (priceEl) {
            price = parseFloat(priceEl.innerText.replace(/[^0-9.]/g, '')) || 0;
        }
    }

    const initialOrder = parseInt(card.getAttribute('data-initial-order') || '0', 10);
    return { name, tag, price, initialOrder };
}

function getCardRelevanceRank(name, tag) {
    // Priority order specified by user:
    // 1st: Glow Restore
    // 2nd: Anti-aging
    // 3rd: Moisturizer
    const text = `${name} ${tag}`.toLowerCase();
    if (text.includes('glow restore') || text.includes('lotion')) {
        return 1;
    }
    if (text.includes('anti-aging') || text.includes('serum') || text.includes('skin renewal')) {
        return 2;
    }
    if (text.includes('moisturizer') || text.includes('hydro-boost') || text.includes('hydro boost')) {
        return 3;
    }
    return 4;
}

function matchesProductCard(card, query, category) {
    const { name, tag } = getCardData(card);
    const clean = s => (s || '').toLowerCase().replace(/[\-_]/g, ' ').trim();
    const raw = s => (s || '').toLowerCase().trim();

    // Check category filter if set from sidebar
    if (category && category.toLowerCase() !== 'all products' && category.toLowerCase() !== 'browse products') {
        const catClean = clean(category);
        const catRaw = raw(category);
        const cardCombined = `${clean(name)} ${clean(tag)}`;
        const cardRaw = `${raw(name)} ${raw(tag)}`;
        if (!cardCombined.includes(catClean) && !cardRaw.includes(catRaw)) {
            return false;
        }
    }

    // Check search query if entered
    if (!query) return true;

    const qClean = clean(query);
    const qRaw = raw(query);
    const textClean = `${clean(name)} ${clean(tag)}`;
    const textRaw = `${raw(name)} ${raw(tag)}`;

    if (textRaw.includes(qRaw) || textClean.includes(qClean)) {
        return true;
    }

    const words = qClean.split(/\s+/).filter(w => w.length > 0);
    return words.every(word => textClean.includes(word));
}

function applyProductFilterAndSort() {
    const grid = document.getElementById('productGrid');
    if (!grid) return;

    const cards = getProductCards();
    if (cards.length === 0) return;

    const searchInput = document.getElementById('productSearchInput');
    const query = searchInput ? searchInput.value.trim() : currentSearchQuery;
    currentSearchQuery = query;

    const clearBtn = document.getElementById('clearSearchBtn');
    if (clearBtn) {
        if (query.length > 0) {
            clearBtn.classList.remove('hidden');
        } else {
            clearBtn.classList.add('hidden');
        }
    }

    // Sort cards according to currentSortMode
    cards.sort((cardA, cardB) => {
        const dataA = getCardData(cardA);
        const dataB = getCardData(cardB);

        if (currentSortMode === 'low-to-high') {
            if (dataA.price !== dataB.price) {
                return dataA.price - dataB.price;
            }
            return dataA.initialOrder - dataB.initialOrder;
        }

        if (currentSortMode === 'high-to-low') {
            if (dataA.price !== dataB.price) {
                return dataB.price - dataA.price;
            }
            return dataA.initialOrder - dataB.initialOrder;
        }

        // 'most-relevant': Anti-aging serum -> Glow restore -> Moisturizer
        const rankA = getCardRelevanceRank(dataA.name, dataA.tag);
        const rankB = getCardRelevanceRank(dataB.name, dataB.tag);
        if (rankA !== rankB) {
            return rankA - rankB;
        }
        return dataA.initialOrder - dataB.initialOrder;
    });

    // Re-append sorted cards into grid
    cards.forEach(card => grid.appendChild(card));

    // Filter visibility
    let visibleCount = 0;
    cards.forEach(card => {
        const isMatch = matchesProductCard(card, currentSearchQuery, currentCategoryFilter);
        if (isMatch) {
            card.style.display = '';
            visibleCount++;
        } else {
            card.style.display = 'none';
        }
    });

    // Handle empty state
    const noResults = document.getElementById('noProductsFound');
    if (noResults) {
        if (visibleCount === 0) {
            noResults.classList.remove('hidden');
            grid.appendChild(noResults);
        } else {
            noResults.classList.add('hidden');
        }
    }

    // Update total count
    const totalCountEl = document.getElementById('totalItemsCount');
    if (totalCountEl) {
        if (currentSearchQuery || currentCategoryFilter) {
            totalCountEl.innerText = `${visibleCount} of ${cards.length}`;
        } else {
            totalCountEl.innerText = `${cards.length}`;
        }
    }
}

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

    const lower = optionText.toLowerCase();
    if (lower.includes('low to high')) {
        currentSortMode = 'low-to-high';
    } else if (lower.includes('high to low')) {
        currentSortMode = 'high-to-low';
    } else {
        currentSortMode = 'most-relevant';
    }

    applyProductFilterAndSort();
}

function selectPageOption(pageNumber) {
    const pageNum = parseInt(pageNumber, 10);
    setProductPage(pageNum);
    const pageMenu = document.getElementById('pageDropdownMenu');
    const pageArrow = document.getElementById('pageArrow');
    if (pageMenu) pageMenu.classList.add('hidden');
    if (pageArrow) pageArrow.classList.remove('rotate-180');
}

function clearProductSearch() {
    const searchInput = document.getElementById('productSearchInput');
    const clearBtn = document.getElementById('clearSearchBtn');
    if (searchInput) {
        searchInput.value = '';
        searchInput.focus();
    }
    if (clearBtn) {
        clearBtn.classList.add('hidden');
    }
    currentSearchQuery = '';
    currentCategoryFilter = '';

    const breadcrumb = document.getElementById('activeCategoryBreadcrumb');
    if (breadcrumb) {
        breadcrumb.innerText = 'All Products';
    }

    // Reset category sidebar highlights
    const allCategoryItems = document.querySelectorAll('#productCategoryList li');
    allCategoryItems.forEach((li, idx) => {
        if (idx === 0) {
            li.classList.add('text-roseva-plum', 'font-semibold');
            li.classList.remove('hover:text-roseva-plum');
            const numSpan = li.querySelector('span:last-child');
            if (numSpan) {
                numSpan.classList.add('text-roseva-plum');
                numSpan.classList.remove('text-roseva-text/60');
            }
        } else {
            li.classList.remove('text-roseva-plum', 'font-semibold');
            li.classList.add('text-roseva-text/85', 'hover:text-roseva-plum');
            const numSpan = li.querySelector('span:last-child');
            if (numSpan) {
                numSpan.classList.remove('text-roseva-plum');
                numSpan.classList.add('text-roseva-text/60');
            }
        }
    });

    applyProductFilterAndSort();
}

function selectCategoryFilter(categoryName, clickedElement) {
    const searchInput = document.getElementById('productSearchInput');
    const clearBtn = document.getElementById('clearSearchBtn');
    const breadcrumb = document.getElementById('activeCategoryBreadcrumb');

    if (breadcrumb) {
        breadcrumb.innerText = categoryName;
    }

    // Highlight active category in sidebar
    const allCategoryItems = document.querySelectorAll('#productCategoryList li');
    let targetElement = clickedElement;

    if (!targetElement && categoryName) {
        allCategoryItems.forEach(li => {
            const catSpan = li.querySelector('span:first-child');
            if (catSpan && catSpan.innerText.trim().toLowerCase() === categoryName.trim().toLowerCase()) {
                targetElement = li;
            }
        });
    }

    allCategoryItems.forEach(li => {
        li.classList.remove('text-roseva-plum', 'font-semibold');
        li.classList.add('text-roseva-text/85', 'hover:text-roseva-plum');
        const numSpan = li.querySelector('span:last-child');
        if (numSpan) {
            numSpan.classList.remove('text-roseva-plum');
            numSpan.classList.add('text-roseva-text/60');
        }
    });

    if (targetElement) {
        targetElement.classList.add('text-roseva-plum', 'font-semibold');
        targetElement.classList.remove('hover:text-roseva-plum');
        const numSpan = targetElement.querySelector('span:last-child');
        if (numSpan) {
            numSpan.classList.add('text-roseva-plum');
            numSpan.classList.remove('text-roseva-text/60');
        }
    }

    if (categoryName.toLowerCase() === 'all products' || categoryName.toLowerCase() === 'browse products') {
        currentCategoryFilter = '';
        if (searchInput) searchInput.value = '';
        if (clearBtn) clearBtn.classList.add('hidden');
    } else {
        currentCategoryFilter = categoryName;
        if (searchInput) {
            searchInput.value = categoryName;
            if (clearBtn) clearBtn.classList.remove('hidden');
        }
    }

    applyProductFilterAndSort();
}

function initProductsBrowser() {
    const grid = document.getElementById('productGrid');
    if (!grid) return;

    const cards = Array.from(grid.querySelectorAll('.product-card'));
    cards.forEach((card, idx) => {
        if (!card.hasAttribute('data-initial-order')) {
            card.setAttribute('data-initial-order', idx);
        }
    });

    const searchInput = document.getElementById('productSearchInput');
    const clearBtn = document.getElementById('clearSearchBtn');

    if (searchInput) {
        searchInput.addEventListener('input', () => {
            currentSearchQuery = searchInput.value.trim();
            if (clearBtn) {
                if (currentSearchQuery.length > 0) {
                    clearBtn.classList.remove('hidden');
                } else {
                    clearBtn.classList.add('hidden');
                }
            }
            const breadcrumb = document.getElementById('activeCategoryBreadcrumb');
            if (breadcrumb) {
                breadcrumb.innerText = currentSearchQuery ? `Search: "${currentSearchQuery}"` : 'All Products';
            }
            applyProductFilterAndSort();
        });

        searchInput.addEventListener('keydown', (e) => {
            if (e.key === 'Enter') {
                searchInput.blur();
                applyProductFilterAndSort();
            }
        });
    }

    // Voice Search
    const voiceBtn = document.getElementById('voiceSearchBtn');
    if (voiceBtn && searchInput) {
        const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
        if (SpeechRecognition) {
            const recognition = new SpeechRecognition();
            recognition.continuous = false;
            recognition.interimResults = false;
            recognition.lang = 'en-US';

            let isListening = false;
            voiceBtn.addEventListener('click', () => {
                if (isListening) {
                    recognition.stop();
                    return;
                }
                try {
                    recognition.start();
                    isListening = true;
                    voiceBtn.classList.add('text-roseva-plum', 'animate-pulse');
                    showAuthToast('Listening... Speak a product name or category');
                } catch (err) {
                    console.error('Speech recognition error:', err);
                }
            });

            recognition.onresult = (evt) => {
                const transcript = evt.results[0][0].transcript;
                searchInput.value = transcript;
                if (clearBtn) clearBtn.classList.remove('hidden');
                const breadcrumb = document.getElementById('activeCategoryBreadcrumb');
                if (breadcrumb) breadcrumb.innerText = `Search: "${transcript}"`;
                applyProductFilterAndSort();
                showAuthToast(`Searching for: "${transcript}"`);
            };

            recognition.onend = () => {
                isListening = false;
                voiceBtn.classList.remove('text-roseva-plum', 'animate-pulse');
            };

            recognition.onerror = () => {
                isListening = false;
                voiceBtn.classList.remove('text-roseva-plum', 'animate-pulse');
            };
        } else {
            voiceBtn.addEventListener('click', () => {
                showAuthToast('Voice recognition is not supported in this browser.', 'error');
            });
        }
    }

    // Check URL parameters (e.g. ?search=hydro or ?category=Moisturizer)
    let hasUrlParam = false;
    try {
        const params = new URLSearchParams(window.location.search);
        const searchParam = params.get('search') || params.get('q');
        const catParam = params.get('category');
        if (searchParam && searchInput) {
            hasUrlParam = true;
            searchInput.value = searchParam;
            if (clearBtn) clearBtn.classList.remove('hidden');
            const breadcrumb = document.getElementById('activeCategoryBreadcrumb');
            if (breadcrumb) breadcrumb.innerText = `Search: "${searchParam}"`;
            applyProductFilterAndSort();
        } else if (catParam) {
            hasUrlParam = true;
            selectCategoryFilter(catParam);
        }
    } catch (e) {
        console.error('Error parsing URL params:', e);
    }

    // Default sort is Most Relevant
    currentSortMode = 'most-relevant';
    const sortLabel = document.getElementById('selectedSortLabel');
    if (sortLabel) {
        sortLabel.innerText = 'Most Relevant';
    }

    if (!hasUrlParam) {
        applyProductFilterAndSort();
    }
}

// Expose globally
window.selectSortOption = selectSortOption;
window.clearProductSearch = clearProductSearch;
window.selectCategoryFilter = selectCategoryFilter;
window.applyProductFilterAndSort = applyProductFilterAndSort;

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

// Initialise pagination and product browser on DOM Load
document.addEventListener('DOMContentLoaded', () => {
    renderPagination();
    initProductsBrowser();
});

