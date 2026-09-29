<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en" class="scroll-smooth">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cart Details — Roséva Skincare | Verified Formulas</title>
        <meta name="description"
            content="Review your selected clean botanical skincare formulations, adjust quantities, and proceed to checkout.">

        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Arapey:ital@0;1&family=Manrope:wght@400;500;600;700&family=Oranienbaum&family=Quicksand:wght@300;400;500;600;700&family=Style+Script&display=swap"
            rel="stylesheet">

        <!-- Tailwind CSS CDN -->
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="js/tailwind-config.js"></script>

        <!-- Custom CSS Stylesheet -->
        <link rel="stylesheet" href="css/styles.css">
    </head>

    <body
        class="bg-roseva-bg text-roseva-text antialiased selection:bg-roseva-plum selection:text-white min-h-screen flex flex-col justify-between">

        <!-- ============================================== -->
        <!-- HEADER / NAVBAR                                -->
        <!-- ============================================== -->
        <header
            class="sticky top-0 z-50 bg-[#FFFAF0]/95 backdrop-blur-md transition-all duration-300 border-b border-[#7A2E47]/10">
            <div class="max-w-[1360px] mx-auto px-6 sm:px-10 lg:px-16 py-4 flex items-center justify-between">
                <!-- Brand Logo -->
                <a href="index.jsp" class="flex items-center gap-2 group focus:outline-none" aria-label="Roséva Home">
                    <img src="assets/logo.png" alt="Roséva Brand Logo"
                        class="h-14 sm:h-16 md:h-20 w-auto object-contain transition-transform duration-300 group-hover:scale-105" />
                </a>

                <!-- Desktop Navigation Links (Arapey Font) -->
                <nav class="hidden md:flex items-center gap-8 lg:gap-12 font-arapey text-lg tracking-wide text-roseva-text"
                    aria-label="Main Navigation">
                    <a href="index.jsp"
                        class="relative py-1 after:absolute after:bottom-0 after:left-0 after:w-full after:h-0.5 after:bg-roseva-plum after:scale-x-0 hover:after:scale-x-100 after:transition-transform">Home</a>
                    <a href="journal.jsp"
                        class="relative py-1 after:absolute after:bottom-0 after:left-0 after:w-full after:h-0.5 after:bg-roseva-plum after:scale-x-0 hover:after:scale-x-100 after:transition-transform">The
                        Journal</a>
                    <a href="products.jsp"
                        class="relative py-1 after:absolute after:bottom-0 after:left-0 after:w-full after:h-0.5 after:bg-roseva-plum after:scale-x-0 hover:after:scale-x-100 after:transition-transform">Products</a>
                    <div id="navAuthDesktop" class="relative">
                        <button type="button" onclick="openAuthModal('login')"
                            class="relative py-1 font-arapey text-lg tracking-wide text-roseva-text hover:text-roseva-plum transition-colors after:absolute after:bottom-0 after:left-0 after:w-full after:h-0.5 after:bg-roseva-plum after:scale-x-0 hover:after:scale-x-100 after:transition-transform cursor-pointer flex items-center gap-1.5 focus:outline-none">
                            <span>Login / Sign Up</span>
                        </button>
                    </div>
                </nav>

                <!-- Cart Action & Mobile Menu Toggle -->
                <div class="flex items-center gap-4 sm:gap-6">
                    <a href="cart.jsp"
                        class="relative p-1 text-roseva-plum transition-all duration-200 group focus:outline-none flex items-center justify-center"
                        aria-label="View Shopping Cart">
                        <img src="assets/cart icon.png" alt="Cart"
                            class="w-7 sm:w-8 h-7 sm:h-8 object-contain group-hover:scale-110 transition-transform duration-200" />
                        <span id="cartBadge"
                            class="absolute -top-1 -right-1 bg-roseva-plum text-white text-[10px] font-manrope font-bold rounded-full w-4 h-4 flex items-center justify-center shadow-sm">0</span>
                    </a>

                    <!-- Mobile Hamburger Button -->
                    <button id="mobileMenuBtn"
                        class="md:hidden text-roseva-text hover:text-roseva-plum p-1 focus:outline-none"
                        aria-label="Open Navigation Menu">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M4 6h16M4 12h16M4 18h16" />
                        </svg>
                    </button>
                </div>
            </div>

            <!-- Mobile Navigation Menu -->
            <div id="mobileMenu" class="hidden md:hidden bg-[#FFFAF0] border-b border-[#7A2E47]/10 px-6 py-5">
                <div class="flex flex-col gap-4 font-arapey text-xl text-roseva-text">
                    <a href="index.jsp" class="hover:text-roseva-plum transition-colors">Home</a>
                    <a href="journal.jsp" class="hover:text-roseva-plum transition-colors">The Journal</a>
                    <a href="products.jsp" class="hover:text-roseva-plum transition-colors">Products</a>
                    <div id="navAuthMobile">
                        <button type="button" onclick="openAuthModal('login')"
                            class="text-left hover:text-roseva-plum transition-colors focus:outline-none">
                            Login / Sign Up
                        </button>
                    </div>
                </div>
            </div>
        </header>


        <!-- ============================================== -->
        <!-- MAIN CART CONTENT                              -->
        <!-- ============================================== -->
        <main class="flex-grow max-w-[1360px] w-full mx-auto px-6 sm:px-10 lg:px-16 py-6 sm:py-10">

            <!-- Breadcrumb Navigation -->
            <nav class="mb-6 font-arapey text-sm sm:text-base text-roseva-text/60 flex items-center gap-2"
                aria-label="Breadcrumb">
                <a href="index.jsp" class="hover:text-roseva-plum transition-colors">Home</a>
                <span>/</span>
                <span class="text-roseva-text font-medium">My Cart</span>
            </nav>

            <!-- Page Title & Divider -->
            <div class="mb-8">
                <h1
                    class="font-oranienbaum text-3xl sm:text-4xl lg:text-[42px] text-roseva-plum tracking-normal pb-4 border-b border-roseva-text/20">
                    Cart Details
                </h1>
            </div>

            <!-- ============================================== -->
            <!-- EMPTY CART STATE (Default for guests / empty)  -->
            <!-- ============================================== -->
            <div id="cartEmptyState"
                class="hidden flex-col items-center justify-center py-20 px-6 text-center bg-[#EFEBE9]/60 rounded-2xl border border-[#7A2E47]/10 my-6 shadow-sm">
                <div
                    class="w-20 h-20 rounded-full bg-[#7A2E47]/10 flex items-center justify-center text-roseva-plum mb-6">
                    <svg class="w-10 h-10 stroke-[1.5]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round"
                            d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
                    </svg>
                </div>
                <h2 class="font-oranienbaum text-2xl sm:text-3xl text-roseva-plum mb-2.5">Your Cart is Currently Empty
                </h2>
                <p class="font-quicksand text-sm text-roseva-text/70 max-w-md mx-auto mb-8 leading-relaxed">
                    You have not added any skincare formulations to your cart yet. Explore our
                    collection to discover your skin's ideal formula.
                </p>
                <div class="flex flex-col sm:flex-row items-center gap-4">
                    <a href="products.jsp"
                        class="bg-roseva-plum hover:bg-[#100C08] text-white font-manrope font-semibold text-sm sm:text-base px-8 py-3 rounded-lg shadow-md hover:shadow-lg transition-all duration-300 transform hover:-translate-y-0.5">
                        Shop Products
                    </a>
                    <div id="cartSignInPrompt">
                        <button type="button" onclick="openAuthModal('login')"
                            class="font-manrope text-sm text-roseva-plum hover:text-[#100C08] hover:underline font-medium transition-colors">
                            Sign In to view saved cart &rarr;
                        </button>
                    </div>
                </div>
            </div>

            <!-- ============================================== -->
            <!-- ACTIVE CART CONTENT                            -->
            <!-- ============================================== -->
            <div id="cartContentWrapper">
                <!-- SELECT ALL & DELETE CONTROL BAR -->
                <div class="bg-[#EFEBE9] rounded-xl px-6 py-4 flex items-center justify-between mb-8 shadow-sm">
                    <label class="flex items-center gap-3 cursor-pointer select-none">
                        <input type="checkbox" id="selectAllCheckbox" checked onchange="toggleSelectAll(this)"
                            class="w-4 h-4 rounded border-[#D5CFC3] text-roseva-plum accent-roseva-plum focus:ring-0 cursor-pointer" />
                        <span class="font-quicksand text-xs sm:text-sm text-roseva-text/80">
                            Select All <span id="itemCountLabel" class="text-roseva-text/60">(0 Items)</span>
                        </span>
                    </label>

                    <button type="button" onclick="deleteSelectedItems()"
                        class="flex items-center gap-1.5 text-xs sm:text-sm font-quicksand text-roseva-text/70 hover:text-roseva-plum transition-colors focus:outline-none">
                        <svg class="w-4 h-4 stroke-[1.8]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                        </svg>
                        <span>Delete</span>
                    </button>
                </div>

                <!-- CART ITEMS TABLE / LIST -->
                <div class="mb-10">
                    <!-- Table Header Labels (Desktop) -->
                    <div class="hidden md:grid grid-cols-12 gap-4 px-6 mb-3 font-oranienbaum text-lg text-roseva-text">
                        <div class="col-span-6">Product</div>
                        <div class="col-span-2 text-center">Price</div>
                        <div class="col-span-2 text-center">Quantity</div>
                        <div class="col-span-2 text-right">Subtotal</div>
                    </div>

                    <!-- Items Container (Populated dynamically) -->
                    <div id="cartItemsList" class="space-y-4"></div>
                </div>

                <!-- BOTTOM ACTIONS & CHECKOUT -->
                <div class="flex flex-col sm:flex-row items-center justify-between gap-6 pt-4">
                    <a href="products.jsp"
                        class="font-quicksand text-sm text-roseva-text/75 hover:text-roseva-plum underline transition-colors inline-flex items-center gap-2">
                        <span>&larr;</span> Continue Shopping
                    </a>

                    <div class="flex items-center gap-4 sm:gap-6">
                        <div class="text-right flex items-baseline gap-1.5 sm:gap-2">
                            <span
                                class="font-quicksand text-sm sm:text-base font-semibold text-roseva-text/75">Total:</span>
                            <span id="selectedTotalAmount"
                                class="font-oranienbaum text-2xl sm:text-3xl text-roseva-plum font-bold">$0</span>
                        </div>
                        <button type="button" id="proceedCheckoutBtn" onclick="proceedToCheckout()"
                            class="bg-roseva-plum hover:bg-[#100C08] text-white font-manrope font-semibold text-sm sm:text-base px-7 py-3 rounded-lg shadow-md hover:shadow-lg transition-all duration-300 transform hover:-translate-y-0.5">
                            Proceed to Checkout
                        </button>
                    </div>
                </div>
            </div>

        </main>


        <!-- ============================================== -->
        <!-- FOOTER SECTION                                 -->
        <!-- ============================================== -->
        <footer class="bg-roseva-footer text-roseva-text pt-16 pb-12 mt-16 border-t border-[#7A2E47]/10">
            <div class="max-w-[1360px] mx-auto px-6 sm:px-10 lg:px-16">

                <!-- Footer Brand: Roseva in Style Script -->
                <div class="mb-10">
                    <a href="index.jsp" class="inline-block focus:outline-none" aria-label="Roséva Brand">
                        <span
                            class="font-stylescript text-5xl sm:text-6xl text-roseva-plum tracking-wide hover:opacity-90 transition-opacity">
                            Roséva
                        </span>
                    </a>
                </div>

                <!-- Footer Columns in Arapey Font (3 evenly-spaced columns) -->
                <div class="grid grid-cols-1 md:grid-cols-3 gap-8 lg:gap-12 font-arapey text-lg text-roseva-text/90">

                    <!-- Column 1: Flagship Store Address (Left) -->
                    <div class="flex flex-col gap-2 md:justify-self-start">
                        <div class="flex items-start gap-2.5">
                            <span class="text-roseva-plum text-xl leading-none mt-0.5">📍</span>
                            <div class="leading-relaxed">
                                <span class="font-medium text-roseva-text block">Flagship Store</span>
                                <span>45/A, Banani Avenue, Road 11</span><br>
                                <span>Banani, Dhaka-1213, Bangladesh</span>
                            </div>
                        </div>
                    </div>

                    <!-- Column 2: Quick Links / Care (Centered in Middle between Col 1 and Col 3) -->
                    <div class="flex flex-col gap-2.5 md:justify-self-center">
                        <a href="#store-locator" class="hover:text-roseva-plum transition-colors inline-block">Store
                            Locator</a>
                        <a href="#dermatologist" class="hover:text-roseva-plum transition-colors inline-block">Book a
                            Dermatologist</a>
                        <a href="#quiz" class="hover:text-roseva-plum transition-colors inline-block">Skin Quiz &amp;
                            Consultation</a>
                    </div>

                    <!-- Column 3: Customer Care & Policies (Shifted slightly left) -->
                    <div class="flex flex-col gap-2.5 md:justify-self-center">
                        <a href="#support" class="hover:text-roseva-plum transition-colors inline-block">Contact
                            Support</a>
                        <a href="#shipping" class="hover:text-roseva-plum transition-colors inline-block">Shipping &amp;
                            Returns</a>
                        <a href="#terms" class="hover:text-roseva-plum transition-colors inline-block">Terms &amp;
                            Conditions</a>
                    </div>

                </div>

                <!-- Bottom Divider & Copyright Note -->
                <div
                    class="mt-12 pt-6 border-t border-roseva-text/15 flex flex-col sm:flex-row items-center justify-between gap-4 font-arapey text-base text-roseva-text/75">
                    <p>&copy; <%= java.time.Year.now().getValue() %> Roséva Skincare. All rights reserved.</p>
                    <div class="flex gap-6 font-manrope text-xs tracking-wider uppercase text-roseva-text/70">
                        <a href="#privacy" class="hover:text-roseva-plum transition-colors">Privacy</a>
                        <span>•</span>
                        <a href="#cookies" class="hover:text-roseva-plum transition-colors">Cookies</a>
                        <span>•</span>
                        <a href="#sustainability" class="hover:text-roseva-plum transition-colors">Sustainability</a>
                    </div>
                </div>

            </div>
        </footer>


        <!-- External JS Logic -->
        <script src="js/main.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', () => {
                renderCartPage();
            });
        </script>
    </body>

    </html>