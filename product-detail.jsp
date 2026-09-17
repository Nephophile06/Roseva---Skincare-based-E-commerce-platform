<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en" class="scroll-smooth">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Roséva Cloud Drench — Verified Clean Hydration | Roséva Skincare</title>
        <meta name="description"
            content="Roséva Cloud Drench is an ultra-lightweight water gel with 5% pure Hyaluronic Acid and soothing Centella asiatica, clinically tested for 72-hour deep hydration.">

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
                        class="relative py-1 after:absolute after:bottom-0 after:left-0 after:w-full after:h-0.5 after:bg-roseva-plum after:scale-x-100 font-medium">Products</a>
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
                        class="relative p-1 text-roseva-text hover:text-roseva-plum transition-all duration-200 group focus:outline-none flex items-center justify-center"
                        aria-label="View Shopping Cart">
                        <img src="assets/cart icon.png" alt="Cart"
                            class="w-7 sm:w-8 h-7 sm:h-8 object-contain group-hover:scale-110 transition-transform duration-200" />
                        <span id="cartBadge"
                            class="absolute -top-1 -right-1 bg-roseva-plum text-white text-[10px] font-manrope font-bold rounded-full w-4 h-4 flex items-center justify-center shadow-sm">3</span>
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
                    <a href="products.jsp" class="text-roseva-plum font-semibold">Products</a>
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
        <!-- MAIN CONTAINER                                 -->
        <!-- ============================================== -->
        <main class="flex-grow max-w-[1360px] w-full mx-auto px-6 sm:px-10 lg:px-16 py-6 sm:py-10">

            <!-- Breadcrumb Navigation -->
            <nav class="mb-6 font-arapey text-sm sm:text-base text-roseva-text/60 flex items-center gap-2"
                aria-label="Breadcrumb">
                <a href="index.jsp" class="hover:text-roseva-plum transition-colors">Home</a>
                <span>/</span>
                <a href="products.jsp" class="hover:text-roseva-plum transition-colors">Browse Products</a>
                <span>/</span>
                <span class="text-roseva-text/80 font-medium">Roséva Cloud Drench</span>
            </nav>


            <!-- ============================================== -->
            <!-- PRODUCT HERO & GALLERY SECTION                 -->
            <!-- ============================================== -->
            <section class="grid grid-cols-1 lg:grid-cols-12 gap-8 lg:gap-12 items-start mb-16 sm:mb-20">

                <!-- Left: Gallery with Thumbnails & Tags -->
                <div class="lg:col-span-6 flex flex-col gap-3">
                    <!-- Searchable Product Tags -->
                    <div class="flex items-center gap-2 text-xs sm:text-sm font-manrope text-roseva-text/80">
                        <span class="font-normal text-roseva-text/60"></span>
                        <a href="products.jsp?search=gel-cream"
                            class="hover:text-roseva-plum hover:underline transition-colors">[gel-cream]</a>
                        <a href="products.jsp?search=hydrating"
                            class="hover:text-roseva-plum hover:underline transition-colors">[hydrating]</a>
                        <a href="products.jsp?search=hyaluronic"
                            class="hover:text-roseva-plum hover:underline transition-colors">[hyaluronic]</a>
                    </div>

                    <div class="flex flex-col-reverse sm:flex-row gap-3 items-stretch">
                        <!-- Vertical Thumbnails -->
                        <div
                            class="flex sm:flex-col gap-2.5 overflow-x-auto sm:overflow-visible no-scrollbar flex-shrink-0">
                            <button onclick="changeMainImage('assets/cloud drench.png', this)"
                                class="thumbnail-btn w-16 h-16 sm:w-20 sm:h-20 overflow-hidden bg-[#F8F5EE] focus:outline-none transition-all border border-transparent opacity-100">
                                <img src="assets/cloud drench.png" alt="Cloud Drench Angle 1"
                                    class="w-full h-full object-cover">
                            </button>
                            <button onclick="changeMainImage('assets/hydro boost.png', this)"
                                class="thumbnail-btn w-16 h-16 sm:w-20 sm:h-20 overflow-hidden bg-[#F8F5EE] focus:outline-none transition-all border border-transparent opacity-70 hover:opacity-100">
                                <img src="assets/hydro boost.png" alt="Cloud Drench Angle 2"
                                    class="w-full h-full object-cover">
                            </button>
                            <button onclick="changeMainImage('assets/glow restore.png', this)"
                                class="thumbnail-btn w-16 h-16 sm:w-20 sm:h-20 overflow-hidden bg-[#F8F5EE] focus:outline-none transition-all border border-transparent opacity-70 hover:opacity-100">
                                <img src="assets/glow restore.png" alt="Cloud Drench Angle 3"
                                    class="w-full h-full object-cover">
                            </button>
                            <button onclick="changeMainImage('assets/skin renewal.png', this)"
                                class="thumbnail-btn w-16 h-16 sm:w-20 sm:h-20 overflow-hidden bg-[#F8F5EE] focus:outline-none transition-all border border-transparent opacity-70 hover:opacity-100">
                                <img src="assets/skin renewal.png" alt="Cloud Drench Angle 4"
                                    class="w-full h-full object-cover">
                            </button>
                        </div>

                        <!-- Main Preview Image (Frameless with Navigation Arrows) -->
                        <div class="flex-1 aspect-square overflow-hidden bg-[#F8F5EE] relative group">
                            <img id="mainProductImg" src="assets/cloud drench.png" alt="Roséva Cloud Drench Full View"
                                class="w-full h-full object-cover img-zoom transition-all duration-300">

                            <!-- Left Arrow Button -->
                            <button type="button" onclick="navigateGallery(-1)" aria-label="Previous Image"
                                class="absolute left-2.5 top-1/2 -translate-y-1/2 w-8 h-8 rounded-full bg-white/80 hover:bg-white text-roseva-text hover:text-roseva-plum shadow-md flex items-center justify-center transition-all duration-200 focus:outline-none opacity-80 group-hover:opacity-100">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M15 19l-7-7 7-7" />
                                </svg>
                            </button>

                            <!-- Right Arrow Button -->
                            <button type="button" onclick="navigateGallery(1)" aria-label="Next Image"
                                class="absolute right-2.5 top-1/2 -translate-y-1/2 w-8 h-8 rounded-full bg-white/80 hover:bg-white text-roseva-text hover:text-roseva-plum shadow-md flex items-center justify-center transition-all duration-200 focus:outline-none opacity-80 group-hover:opacity-100">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M9 5l7 7-7 7" />
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Right: Product Information & Purchase Actions (Pushed down with ample spacing) -->
                <div class="lg:col-span-6 flex flex-col justify-between h-full lg:pt-8">
                    <div>
                        <h1
                            class="font-oranienbaum text-3xl sm:text-4xl lg:text-5xl text-roseva-text tracking-normal mb-3 font-normal leading-tight">
                            Roséva Cloud Drench
                        </h1>

                        <!-- Rating and Review count (Enlarged & Styled) -->
                        <div class="flex items-center gap-2.5 mb-6">
                            <div class="flex text-roseva-text text-base sm:text-lg tracking-wider">
                                <span>★</span><span>★</span><span>★</span><span>★</span><span
                                    class="text-roseva-text/30">★</span>
                            </div>
                            <span class="font-quicksand text-sm sm:text-base text-roseva-text/80 font-medium">(20
                                Reviews)</span>
                        </div>

                        <!-- Product Description (With Generous Bottom Gap) -->
                        <p
                            class="font-quicksand text-sm sm:text-base text-roseva-text/85 leading-relaxed mb-12 sm:mb-16 lg:mb-20">
                            A cloud-like, ultra-lightweight water gel that instantly drenches your skin in deep
                            hydration
                            without a hint of greasiness. Formulated with 5% pure Hyaluronic Acid and soothing Centella
                            asiatica,
                            it actively repairs your skin barrier while locking in moisture for 24 hours. True to
                            Roséva’s
                            philosophy of radical transparency, 100% of this clean formula is fully disclosed and
                            clinically
                            proven to enhance skin resilience, leaving a soft, velvet-dewy finish.
                        </p>
                    </div>

                    <!-- Lower Purchase Block (Lowered to align with the product image) -->
                    <div class="pt-2 sm:pt-4">
                        <!-- Pricing & Stepper Row -->
                        <div class="flex items-center justify-between gap-4 mb-6">
                            <div class="flex items-baseline gap-3">
                                <span
                                    class="font-manrope text-2xl sm:text-3xl text-roseva-text font-bold tracking-tight">$15</span>
                                <span
                                    class="font-quicksand text-sm sm:text-base text-roseva-text/80 font-normal">(250ml)</span>
                            </div>

                            <!-- Quantity Stepper -->
                            <div class="flex items-center gap-3 font-quicksand text-sm sm:text-base">
                                <span class="text-roseva-text/80">Quantity:</span>
                                <div
                                    class="flex items-center border border-[#D5CFC3] rounded-sm bg-white overflow-hidden">
                                    <button type="button" onclick="adjustQty(1)"
                                        class="w-8 h-8 flex items-center justify-center bg-[#EAE5DC]/60 hover:bg-[#EAE5DC] text-roseva-text text-sm transition-colors focus:outline-none font-medium">+</button>
                                    <input id="productQty" type="text" value="3" readonly
                                        class="w-10 h-8 text-center text-sm font-semibold bg-white border-x border-[#D5CFC3] focus:outline-none text-roseva-text">
                                    <button type="button" onclick="adjustQty(-1)"
                                        class="w-8 h-8 flex items-center justify-center bg-[#EAE5DC]/60 hover:bg-[#EAE5DC] text-roseva-text text-sm transition-colors focus:outline-none font-medium">-</button>
                                </div>
                            </div>
                        </div>

                        <!-- Action Buttons: Rating Star, Wishlist Heart, Add to Cart -->
                        <div class="flex items-center gap-3">
                            <!-- Rating Icon Button (Outlined by default, Black filled on click) -->
                            <button id="ratingBtn" onclick="toggleRating()"
                                class="w-12 h-11 flex items-center justify-center border border-[#D5CFC3] rounded-md bg-white hover:border-black text-roseva-text transition-all shadow-sm focus:outline-none"
                                aria-label="Rate Product" title="Rate this product">
                                <svg id="ratingStarIcon" data-filled="false"
                                    class="w-5 h-5 text-roseva-text transition-all duration-200" fill="none"
                                    stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8"
                                        d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.922-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.176 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.784-.57-.38-1.81.588-1.81h4.914a1 1 0 00.951-.69l1.519-4.674z" />
                                </svg>
                            </button>

                            <!-- Wishlist Heart Button -->
                            <button id="wishlistBtn" onclick="toggleWishlist()"
                                class="w-12 h-11 flex items-center justify-center border border-[#D5CFC3] rounded-md bg-white hover:border-roseva-plum text-roseva-text hover:text-roseva-plum transition-all shadow-sm focus:outline-none"
                                aria-label="Add to Wishlist" title="Save to Wishlist">
                                <svg id="wishlistHeartIcon" data-filled="false"
                                    class="w-5 h-5 transition-all duration-200" fill="none" stroke="currentColor"
                                    viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8"
                                        d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                                </svg>
                            </button>

                            <!-- Add to Cart Button -->
                            <button onclick="addToCartFromDetail('Roséva Cloud Drench', 15)"
                                class="flex-1 h-11 bg-roseva-plum hover:bg-[#5C2335] text-white font-manrope font-medium text-sm sm:text-base tracking-wide rounded-md shadow-sm hover:shadow transition-all duration-200 flex items-center justify-center">
                                Add to Cart
                            </button>
                        </div>
                    </div>

                </div>

            </section>


            <!-- ============================================== -->
            <!-- DERMATOLOGIST & LAB VALIDATIONS               -->
            <!-- ============================================== -->
            <section class="space-y-10 sm:space-y-12 py-10 border-t border-[#EAE2D5]">

                <!-- Section 1: Dermatologist Reviewed Validation -->
                <div>
                    <h2 class="font-quicksand text-2xl sm:text-3xl text-roseva-text mb-3">
                        Dermatologist Reviewed Validation
                    </h2>
                    <p
                        class="font-quicksand text-sm sm:text-base text-roseva-text/85 leading-relaxed max-w-4xl text-justify sm:text-left">
                        This formulation has undergone rigorous, independent clinical trials overseen by certified
                        dermatologists. Tested on a diverse cohort of sensitive skin types, Roséva Cloud Drench
                        demonstrated a 0.0% irritation index. Our scientific validation process guarantees that each
                        drop actively supports the skin barrier while remaining entirely non-comedogenic and free from
                        volatile synthetics.
                    </p>
                </div>

                <!-- Section 2: Lab Verification Tags -->
                <div>
                    <div class="flex flex-wrap items-baseline gap-2.5 mb-3">
                        <h2 class="font-quicksand text-2xl sm:text-3xl text-roseva-text">
                            Lab Verification Tags
                        </h2>
                        <span class="font-quicksand text-sm sm:text-base text-roseva-text/75 font-medium">
                            (For Quality Assurance)
                        </span>
                    </div>
                    <p
                        class="font-quicksand text-sm sm:text-base text-roseva-text/85 leading-relaxed max-w-4xl text-justify sm:text-left">
                        Every production batch undergoes strict analytical testing in our certified laboratories to
                        guarantee chemical safety and maximum stability. We trace and verify our ingredients from origin
                        to bottle, ensuring zero contamination. Scan the QR code on your product packaging to view the
                        exact multi-point quality assurance and purity report for your specific batch number.
                    </p>
                </div>

            </section>


            <!-- ============================================== -->
            <!-- INGREDIENTS & FORMULA CLINICAL TABLE           -->
            <!-- ============================================== -->
            <section class="py-10 border-t border-[#EAE2D5]">
                <h2 class="font-quicksand text-2xl sm:text-3xl text-roseva-text mb-1">
                    Ingredients &amp; Formula
                </h2>
                <p class="font-quicksand text-xs sm:text-sm text-roseva-text/60 mb-6">
                    Highlighted active ingredients &amp; their functions:
                </p>

                <!-- Clinical Results Table (With Compact Column Width & Minimal Border) -->
                <div class="overflow-x-auto mb-8 max-w-2xl">
                    <table
                        class="w-full text-left font-quicksand text-xs sm:text-sm border border-[#EBE3D7] rounded-md overflow-hidden border-collapse">
                        <thead>
                            <tr
                                class="bg-[#F8F5EE] border-b border-[#EBE3D7] font-manrope font-semibold text-roseva-text">
                                <th class="py-2.5 px-3.5 border-r border-[#EBE3D7]/70">Target Concern</th>
                                <th class="py-2.5 px-3.5 border-r border-[#EBE3D7]/70">Clinical Result</th>
                                <th class="py-2.5 px-3.5">Timeline</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-[#EBE3D7] text-roseva-text/85">
                            <tr class="hover:bg-white/40 transition-colors">
                                <td class="py-2.5 px-3.5 font-medium border-r border-[#EBE3D7]/70">Skin Hydration</td>
                                <td class="py-2.5 px-3.5 border-r border-[#EBE3D7]/70">94.5% Moisture Increase</td>
                                <td class="py-2.5 px-3.5">Instant (15 Mins)</td>
                            </tr>
                            <tr class="hover:bg-white/40 transition-colors">
                                <td class="py-2.5 px-3.5 font-medium border-r border-[#EBE3D7]/70">Barrier Redness</td>
                                <td class="py-2.5 px-3.5 border-r border-[#EBE3D7]/70">82% Soothing Relief</td>
                                <td class="py-2.5 px-3.5">3 Days</td>
                            </tr>
                            <tr class="hover:bg-white/40 transition-colors">
                                <td class="py-2.5 px-3.5 font-medium border-r border-[#EBE3D7]/70">Uneven Texture /
                                    Flakiness</td>
                                <td class="py-2.5 px-3.5 border-r border-[#EBE3D7]/70">54% Texture Softening</td>
                                <td class="py-2.5 px-3.5">1 Week</td>
                            </tr>
                            <tr class="hover:bg-white/40 transition-colors">
                                <td class="py-2.5 px-3.5 font-medium border-r border-[#EBE3D7]/70">Trans-epidermal Water
                                    Loss</td>
                                <td class="py-2.5 px-3.5 border-r border-[#EBE3D7]/70">78% Moisture Retention</td>
                                <td class="py-2.5 px-3.5">2 Weeks</td>
                            </tr>
                            <tr class="hover:bg-white/40 transition-colors">
                                <td class="py-2.5 px-3.5 font-medium border-r border-[#EBE3D7]/70">Skin Irritation Index
                                </td>
                                <td class="py-2.5 px-3.5 border-r border-[#EBE3D7]/70">0.0% (Non-Irritant)</td>
                                <td class="py-2.5 px-3.5 font-semibold text-roseva-plum">Certified</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Accordion Items (Without bottom content divider) -->
                <div class="space-y-2 max-w-3xl">
                    <!-- Accordion 1 -->
                    <div class="border-b border-[#EAE2D5]/70 pb-2">
                        <button onclick="toggleAccordion('acc1')"
                            class="w-full py-2 flex items-center justify-between text-left font-manrope text-sm font-semibold text-roseva-text hover:text-roseva-plum transition-colors focus:outline-none">
                            <span>Full Ingredients Transparency (INCI List)</span>
                            <span class="text-roseva-plum text-base font-bold">✓</span>
                        </button>
                        <div id="acc1" class="hidden font-quicksand text-xs text-roseva-text/75 py-2 leading-relaxed">
                            Aqua (Purified Glacial Water), Hyaluronic Acid (Multi-Molecular Weight 5%), Centella
                            Asiatica Extract, Glycerin (Plant-derived), Niacinamide (Vitamin B3), Panthenol (Pro-Vitamin
                            B5), Aloe Barbadensis Leaf Juice, Rosa Damascena Flower Water, Sodium PCA, Allantoin,
                            Camellia Sinensis Leaf Extract, Ethylhexylglycerin.
                        </div>
                    </div>

                    <!-- Accordion 2 -->
                    <div class="border-b border-[#EAE2D5]/70 pb-2">
                        <button onclick="toggleAccordion('acc2')"
                            class="w-full py-2 flex items-center justify-between text-left font-manrope text-sm font-semibold text-roseva-text hover:text-roseva-plum transition-colors focus:outline-none">
                            <span>Results &amp; Efficacy</span>
                            <span class="text-roseva-plum text-base font-bold">✓</span>
                        </button>
                        <div id="acc2" class="hidden font-quicksand text-xs text-roseva-text/75 py-2 leading-relaxed">
                            Proven to boost deep hydration immediately and lock in moisture for up to 72 hours without
                            causing excess sebum production.
                        </div>
                    </div>

                    <!-- Accordion 3 -->
                    <div class="border-b border-[#EAE2D5]/70 pb-2">
                        <button onclick="toggleAccordion('acc3')"
                            class="w-full py-2 flex items-center justify-between text-left font-manrope text-sm font-semibold text-roseva-text hover:text-roseva-plum transition-colors focus:outline-none">
                            <span>Cruelty Free &amp; Vegan Testing</span>
                            <span class="text-roseva-plum text-base font-bold">✓</span>
                        </button>
                        <div id="acc3" class="hidden font-quicksand text-xs text-roseva-text/75 py-2 leading-relaxed">
                            100% Leaping Bunny certified cruelty-free and certified vegan. Never tested on animals at
                            any stage of development.
                        </div>
                    </div>

                    <!-- Accordion 4 (No bottom line divider) -->
                    <div class="pb-2">
                        <button onclick="toggleAccordion('acc4')"
                            class="w-full py-2 flex items-center justify-between text-left font-manrope text-sm font-semibold text-roseva-text hover:text-roseva-plum transition-colors focus:outline-none">
                            <span>Usage &amp; Safety Instructions</span>
                            <span class="text-roseva-plum text-base font-bold">✓</span>
                        </button>
                        <div id="acc4" class="hidden font-quicksand text-xs text-roseva-text/75 py-2 leading-relaxed">
                            Apply 2-3 pumps morning and night to cleansed, damp skin. Gently press into face, neck, and
                            décolletage until fully absorbed. Follow with sunscreen during daytime.
                        </div>
                    </div>
                </div>

            </section>


            <!-- ============================================== -->
            <!-- REVIEWS & DISCUSSION TABS                      -->
            <!-- ============================================== -->
            <section class="py-12">
                <!-- Centered 3-Button Tab Toolbar (Separated Individual Pill Buttons) -->
                <div class="flex items-center justify-center gap-3 sm:gap-4 mb-10 sm:mb-12 flex-wrap">
                    <button type="button" onclick="switchProductTab('reviews', this)"
                        class="tab-btn rounded-md px-6 sm:px-8 py-3 bg-roseva-plum text-white font-manrope text-xs sm:text-sm font-bold uppercase tracking-wider transition-all duration-200 shadow-sm hover:bg-[#100C08] hover:text-white focus:outline-none">
                        Reviews
                    </button>
                    <button type="button" onclick="switchProductTab('routine', this)"
                        class="tab-btn rounded-md px-6 sm:px-8 py-3 bg-[#E5DFD7] text-[#4A3B32] font-manrope text-xs sm:text-sm font-bold uppercase tracking-wider transition-all duration-200 shadow-sm hover:bg-[#100C08] hover:text-white focus:outline-none">
                        Skin Care Routine
                    </button>
                    <button type="button" onclick="switchProductTab('qa', this)"
                        class="tab-btn rounded-md px-6 sm:px-8 py-3 bg-[#E5DFD7] text-[#4A3B32] font-manrope text-xs sm:text-sm font-bold uppercase tracking-wider transition-all duration-200 shadow-sm hover:bg-[#100C08] hover:text-white focus:outline-none">
                        Q &amp; A
                    </button>
                </div>

                <!-- Reviews Content Tab -->
                <div id="tabContentReviews" class="max-w-4xl mx-auto space-y-8 sm:space-y-10 mb-10">
                    <!-- Review 1 -->
                    <div class="flex items-start gap-4">
                        <svg class="w-5 h-5 text-roseva-text/60 mt-0.5 flex-shrink-0" fill="none" stroke="currentColor"
                            viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8"
                                d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                        </svg>
                        <div class="flex-1">
                            <div class="flex items-center gap-3 mb-1">
                                <span class="font-manrope text-sm font-medium text-roseva-text/90">Tousif</span>
                                <span class="font-quicksand text-xs text-roseva-text/45">3 days ago</span>
                            </div>
                            <p class="font-quicksand text-sm sm:text-[15px] text-roseva-text/85 leading-relaxed">
                                Absolute lifesaver for my oily skin! I was skeptical at first, but the water-gel texture
                                absorbs instantly without any sticky residue. My skin feels incredibly plump, and the
                                redness around my cheeks completely subsided in just three days. Love the ingredient
                                transparency!
                            </p>
                        </div>
                    </div>

                    <!-- Review 2 -->
                    <div class="flex items-start gap-4">
                        <svg class="w-5 h-5 text-roseva-text/60 mt-0.5 flex-shrink-0" fill="none" stroke="currentColor"
                            viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8"
                                d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                        </svg>
                        <div class="flex-1">
                            <div class="flex items-center gap-3 mb-1">
                                <span class="font-manrope text-sm font-medium text-roseva-text/90">Mr. Perfecto</span>
                                <span class="font-quicksand text-xs text-roseva-text/45">1 week ago</span>
                            </div>
                            <p class="font-quicksand text-sm sm:text-[15px] text-roseva-text/85 leading-relaxed">
                                Absolute lifesaver for my oily skin! I was skeptical at first, but the water-gel texture
                                absorbs instantly without any sticky residue. My skin feels incredibly plump, and the
                                redness around my cheeks completely subsided in just three days. Love the ingredient
                                transparency!
                            </p>
                        </div>
                    </div>

                    <!-- Review 3 -->
                    <div class="flex items-start gap-4">
                        <svg class="w-5 h-5 text-roseva-text/60 mt-0.5 flex-shrink-0" fill="none" stroke="currentColor"
                            viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8"
                                d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                        </svg>
                        <div class="flex-1">
                            <div class="flex items-center gap-3 mb-1">
                                <span class="font-manrope text-sm font-medium text-roseva-text/90">Sunshine</span>
                                <span class="font-quicksand text-xs text-roseva-text/45">2 weeks ago</span>
                            </div>
                            <p class="font-quicksand text-sm sm:text-[15px] text-roseva-text/85 leading-relaxed">
                                As someone with a heavily damaged skin barrier, finding a moisturizer that doesn't burn
                                is rare. This formula is incredibly soothing and feel like a splash of fresh water. The
                                fact that they disclose every single safety rating gave me the confidence to buy it, and
                                I'm so glad I did!
                            </p>
                        </div>
                    </div>

                    <!-- Review 4 -->
                    <div class="flex items-start gap-4">
                        <svg class="w-5 h-5 text-roseva-text/60 mt-0.5 flex-shrink-0" fill="none" stroke="currentColor"
                            viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8"
                                d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                        </svg>
                        <div class="flex-1">
                            <div class="flex items-center gap-3 mb-1">
                                <span class="font-manrope text-sm font-medium text-roseva-text/90">Tasrik</span>
                                <span class="font-quicksand text-xs text-roseva-text/45">2 months ago</span>
                            </div>
                            <p class="font-quicksand text-sm sm:text-[15px] text-roseva-text/85 leading-relaxed">
                                Outstanding texture! It melts right into the skin and keeps my face hydrated throughout
                                my entire 9-to-5 shift in an air-conditioned office. It has completely fixed my dry
                                patches. <strong class="font-medium text-roseva-text">Roséva</strong> has officially
                                replaced my high-end imported gel-creams.
                            </p>
                        </div>
                    </div>
                    <!-- Post a Review / Comment Form (Only in Reviews tab) -->
                    <div class="flex items-start gap-4 pt-6 border-t border-[#EAE2D5]">
                        <svg class="w-5 h-5 text-roseva-text/60 mt-3 flex-shrink-0" fill="none" stroke="currentColor"
                            viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8"
                                d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                        </svg>
                        <div class="flex-1 flex flex-col gap-2">
                            <div class="relative">
                                <textarea id="reviewInput" rows="3" maxlength="500" placeholder="Share your thoughts..."
                                    oninput="updateCharCount(this)"
                                    class="w-full p-3.5 bg-white border border-[#D5CFC3] rounded-sm text-sm font-quicksand text-roseva-text placeholder-roseva-text/40 focus:outline-none focus:border-roseva-plum transition-colors shadow-sm resize-none"></textarea>
                                <span id="charCounter"
                                    class="absolute bottom-2.5 right-3 text-xs text-roseva-text/40 font-quicksand select-none">0/500</span>
                            </div>
                            <div>
                                <button type="button" onclick="submitReview()"
                                    class="px-5 py-2 bg-roseva-plum hover:bg-[#100C08] text-white font-manrope text-xs font-semibold rounded-sm transition-colors shadow-sm focus:outline-none">
                                    Add Comment
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Routine Content Tab (Alternative Tab View) -->
                <div id="tabContentRoutine"
                    class="max-w-4xl mx-auto hidden space-y-6 mb-10 text-sm font-quicksand text-roseva-text/85 leading-relaxed">
                    <div class="bg-white/60 border border-[#EBE3D7] p-6 rounded-md shadow-sm">
                        <h3 class="font-manrope font-semibold text-base text-roseva-plum mb-2">Step 1: Gentle Cleansing
                        </h3>
                        <p>Wash face thoroughly with lukewarm water using a pH-balanced cleanser.</p>
                    </div>
                    <div class="bg-white/60 border border-[#EBE3D7] p-6 rounded-md shadow-sm">
                        <h3 class="font-manrope font-semibold text-base text-roseva-plum mb-2">Step 2: Roséva Cloud
                        </h3>
                        <p>Apply 2 pumps of Cloud Drench onto damp skin. Gently press until fully absorbed into deeper
                            skin layers.</p>
                    </div>
                    <div class="bg-white/60 border border-[#EBE3D7] p-6 rounded-md shadow-sm">
                        <h3 class="font-manrope font-semibold text-base text-roseva-plum mb-2">Step 3: Sun Protection /
                            Night Seal</h3>
                        <p>Follow with lightweight SPF during the day or a nourishing oil for overnight
                            recovery.</p>
                    </div>
                </div>

                <!-- Q&A Content Tab -->
                <div id="tabContentQA" class="max-w-4xl mx-auto hidden space-y-8 mb-10">
                    <!-- Q&A Accordion List (Collapsible Questions & Answers) -->
                    <div class="space-y-3.5">
                        <!-- QA Item 1 (Open by default) -->
                        <div
                            class="bg-white border border-[#E5DFD7] rounded-md shadow-sm overflow-hidden transition-all">
                            <button type="button" onclick="toggleQA('qaAns1', 'qaIcon1')"
                                class="w-full flex items-center justify-between p-4 sm:p-5 text-left font-manrope font-semibold text-sm sm:text-base text-roseva-text hover:text-roseva-plum transition-colors focus:outline-none">
                                <span>Is Roséva Cloud Drench safe for fungal acne?</span>
                                <svg id="qaIcon1"
                                    class="w-4 h-4 text-roseva-plum transition-transform duration-200 flex-shrink-0 rotate-180"
                                    fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.2"
                                        d="M19 9l-7 7-7-7" />
                                </svg>
                            </button>
                            <div id="qaAns1"
                                class="px-4 sm:px-5 pb-5 pt-1 text-xs sm:text-sm font-quicksand text-roseva-text/80 leading-relaxed border-t border-[#F3EFEA]">
                                Yes, 100% of our ingredients are non-comedogenic and completely free from triggering
                                fatty acids, polysorbates, and heavy lipid esters. It has passed independent
                                dermatological fungal-acne safety screenings.
                            </div>
                        </div>

                        <!-- QA Item 2 -->
                        <div
                            class="bg-white border border-[#E5DFD7] rounded-md shadow-sm overflow-hidden transition-all">
                            <button type="button" onclick="toggleQA('qaAns2', 'qaIcon2')"
                                class="w-full flex items-center justify-between p-4 sm:p-5 text-left font-manrope font-semibold text-sm sm:text-base text-roseva-text hover:text-roseva-plum transition-colors focus:outline-none">
                                <span>Can I layer this under retinol &amp; vitamin C?</span>
                                <svg id="qaIcon2"
                                    class="w-4 h-4 text-roseva-plum transition-transform duration-200 flex-shrink-0"
                                    fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.2"
                                        d="M19 9l-7 7-7-7" />
                                </svg>
                            </button>
                            <div id="qaAns2"
                                class="hidden px-4 sm:px-5 pb-5 pt-1 text-xs sm:text-sm font-quicksand text-roseva-text/80 leading-relaxed border-t border-[#F3EFEA]">
                                Absolutely. Applying Cloud Drench first creates a soothing moisture barrier that helps
                                buffer aggressive actives like tretinoin, retinol, and L-ascorbic acid, significantly
                                reducing peeling and irritation.
                            </div>
                        </div>

                        <!-- QA Item 3 -->
                        <div
                            class="bg-white border border-[#E5DFD7] rounded-md shadow-sm overflow-hidden transition-all">
                            <button type="button" onclick="toggleQA('qaAns3', 'qaIcon3')"
                                class="w-full flex items-center justify-between p-4 sm:p-5 text-left font-manrope font-semibold text-sm sm:text-base text-roseva-text hover:text-roseva-plum transition-colors focus:outline-none">
                                <span>How long does one 250ml bottle typically last?</span>
                                <svg id="qaIcon3"
                                    class="w-4 h-4 text-roseva-plum transition-transform duration-200 flex-shrink-0"
                                    fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.2"
                                        d="M19 9l-7 7-7-7" />
                                </svg>
                            </button>
                            <div id="qaAns3"
                                class="hidden px-4 sm:px-5 pb-5 pt-1 text-xs sm:text-sm font-quicksand text-roseva-text/80 leading-relaxed border-t border-[#F3EFEA]">
                                With recommended twice-daily usage (2-3 pumps morning and evening), one 250ml bottle
                                will comfortably last approximately 3 to 4 months.
                            </div>
                        </div>
                    </div>

                    <!-- Ask a Question Form (Matching Design) -->
                    <div class="bg-white/80 border border-[#D5CFC3] rounded-md p-5 sm:p-6 shadow-sm">
                        <h4 class="font-manrope font-semibold text-sm sm:text-base text-roseva-text mb-4">
                            Your Question <span
                                class="font-quicksand text-xs text-roseva-text/60 font-normal ml-1">(Please don't use
                                any links or special symbols)</span>
                        </h4>
                        <div class="space-y-3 font-quicksand">
                            <div>
                                <input type="text" id="qaNameInput" placeholder="Name"
                                    class="w-full p-3 bg-white border border-[#D5CFC3] rounded-sm text-sm text-roseva-text placeholder-roseva-text/40 focus:outline-none focus:border-roseva-plum transition-colors shadow-sm">
                            </div>
                            <div>
                                <textarea id="qaQuestionInput" rows="3" placeholder="Question"
                                    class="w-full p-3 bg-white border border-[#D5CFC3] rounded-sm text-sm text-roseva-text placeholder-roseva-text/40 focus:outline-none focus:border-roseva-plum transition-colors shadow-sm resize-none"></textarea>
                            </div>
                            <div>
                                <button type="button" onclick="submitQuestion()"
                                    class="px-6 py-2.5 bg-roseva-plum hover:bg-[#100C08] text-white font-manrope text-xs font-semibold rounded-sm transition-colors shadow-sm focus:outline-none">
                                    Submit Question
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            </section>


            <!-- ============================================== -->
            <!-- RELEVANT PRODUCTS SECTION                      -->
            <!-- ============================================== -->
            <section class="py-12 border-t border-[#EAE2D5]">
                <div class="flex items-center justify-between mb-8">
                    <h2 class="font-quicksand text-2xl sm:text-3xl text-roseva-text">
                        Relevant Products
                    </h2>
                    <a href="products.jsp"
                        class="font-arapey text-sm sm:text-base text-roseva-text hover:text-roseva-plum transition-colors font-medium">
                        See More →
                    </a>
                </div>

                <!-- 4 Compact Product Cards Grid -->
                <div class="grid grid-cols-2 sm:grid-cols-2 lg:grid-cols-4 gap-4 sm:gap-6">
                    <!-- Product 1 -->
                    <div
                        class="bg-white rounded-lg border border-[#EBE3D7] p-3.5 sm:p-4 flex flex-col justify-between shadow-sm hover:shadow-md transition-all duration-300 group">
                        <div
                            class="aspect-square w-full rounded-md overflow-hidden bg-[#F7F3EC] mb-3.5 flex items-center justify-center">
                            <img src="assets/glow restore.png" alt="Roséva Glow Restore"
                                class="w-full h-full object-cover img-zoom" loading="lazy">
                        </div>
                        <div>
                            <h3
                                class="font-oranienbaum text-base sm:text-lg text-roseva-text group-hover:text-roseva-plum transition-colors font-medium">
                                Roséva Glow Restore</h3>
                            <p class="font-quicksand text-xs text-roseva-text/60 mt-0.5">Lotion</p>
                            <p class="font-quicksand font-bold text-sm sm:text-base text-roseva-text mt-1.5">$35</p>
                            <a href="product-detail.jsp"
                                class="inline-flex items-center text-xs font-manrope text-roseva-text/75 hover:text-roseva-plum font-semibold mt-2.5 transition-colors group-hover:translate-x-1 duration-200">
                                See Details <span class="ml-1 text-sm font-light">→</span>
                            </a>
                        </div>
                    </div>

                    <!-- Product 2 -->
                    <div
                        class="bg-white rounded-lg border border-[#EBE3D7] p-3.5 sm:p-4 flex flex-col justify-between shadow-sm hover:shadow-md transition-all duration-300 group">
                        <div
                            class="aspect-square w-full rounded-md overflow-hidden bg-[#F7F3EC] mb-3.5 flex items-center justify-center">
                            <img src="assets/skin renewal.png" alt="Roséva Skin Renewal"
                                class="w-full h-full object-cover img-zoom" loading="lazy">
                        </div>
                        <div>
                            <h3
                                class="font-oranienbaum text-base sm:text-lg text-roseva-text group-hover:text-roseva-plum transition-colors font-medium">
                                Roséva Skin Renewal</h3>
                            <p class="font-quicksand text-xs text-roseva-text/60 mt-0.5">Anti-aging Serum</p>
                            <p class="font-quicksand font-bold text-sm sm:text-base text-roseva-text mt-1.5">$40</p>
                            <a href="product-detail.jsp"
                                class="inline-flex items-center text-xs font-manrope text-roseva-text/75 hover:text-roseva-plum font-semibold mt-2.5 transition-colors group-hover:translate-x-1 duration-200">
                                See Details <span class="ml-1 text-sm font-light">→</span>
                            </a>
                        </div>
                    </div>

                    <!-- Product 3 -->
                    <div
                        class="bg-white rounded-lg border border-[#EBE3D7] p-3.5 sm:p-4 flex flex-col justify-between shadow-sm hover:shadow-md transition-all duration-300 group">
                        <div
                            class="aspect-square w-full rounded-md overflow-hidden bg-[#F7F3EC] mb-3.5 flex items-center justify-center">
                            <img src="assets/hydro boost.png" alt="Roséva Hydro-Boost"
                                class="w-full h-full object-cover img-zoom" loading="lazy">
                        </div>
                        <div>
                            <h3
                                class="font-oranienbaum text-base sm:text-lg text-roseva-text group-hover:text-roseva-plum transition-colors font-medium">
                                Roséva Hydro-Boost</h3>
                            <p class="font-quicksand text-xs text-roseva-text/60 mt-0.5">Moisturizer</p>
                            <p class="font-quicksand font-bold text-sm sm:text-base text-roseva-text mt-1.5">$20</p>
                            <a href="product-detail.jsp"
                                class="inline-flex items-center text-xs font-manrope text-roseva-text/75 hover:text-roseva-plum font-semibold mt-2.5 transition-colors group-hover:translate-x-1 duration-200">
                                See Details <span class="ml-1 text-sm font-light">→</span>
                            </a>
                        </div>
                    </div>

                    <!-- Product 4 -->
                    <div
                        class="bg-white rounded-lg border border-[#EBE3D7] p-3.5 sm:p-4 flex flex-col justify-between shadow-sm hover:shadow-md transition-all duration-300 group">
                        <div
                            class="aspect-square w-full rounded-md overflow-hidden bg-[#F7F3EC] mb-3.5 flex items-center justify-center">
                            <img src="assets/cloud drench.png" alt="Roséva Pure Botanics"
                                class="w-full h-full object-cover img-zoom" loading="lazy">
                        </div>
                        <div>
                            <h3
                                class="font-oranienbaum text-base sm:text-lg text-roseva-text group-hover:text-roseva-plum transition-colors font-medium">
                                Roséva Botanical Mist</h3>
                            <p class="font-quicksand text-xs text-roseva-text/60 mt-0.5">Hydrating Mist</p>
                            <p class="font-quicksand font-bold text-sm sm:text-base text-roseva-text mt-1.5">$28</p>
                            <a href="product-detail.jsp"
                                class="inline-flex items-center text-xs font-manrope text-roseva-text/75 hover:text-roseva-plum font-semibold mt-2.5 transition-colors group-hover:translate-x-1 duration-200">
                                See Details <span class="ml-1 text-sm font-light">→</span>
                            </a>
                        </div>
                    </div>
                </div>
            </section>

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
            // Gallery Image Navigation & Switcher
            const productImages = [
                'assets/cloud drench.png',
                'assets/hydro boost.png',
                'assets/glow restore.png',
                'assets/skin renewal.png'
            ];
            let currentImageIndex = 0;

            function changeMainImage(imgSrc, btn) {
                const mainImg = document.getElementById('mainProductImg');
                if (mainImg) {
                    mainImg.src = imgSrc;
                }
                currentImageIndex = productImages.indexOf(imgSrc);
                if (currentImageIndex === -1) currentImageIndex = 0;

                const thumbBtns = document.querySelectorAll('.thumbnail-btn');
                thumbBtns.forEach((b, idx) => {
                    if (idx === currentImageIndex) {
                        b.classList.add('opacity-100');
                        b.classList.remove('opacity-70');
                    } else {
                        b.classList.remove('opacity-100');
                        b.classList.add('opacity-70');
                    }
                });
            }

            function navigateGallery(direction) {
                currentImageIndex = (currentImageIndex + direction + productImages.length) % productImages.length;
                const newSrc = productImages[currentImageIndex];
                const thumbBtns = document.querySelectorAll('.thumbnail-btn');
                const targetBtn = thumbBtns[currentImageIndex];
                changeMainImage(newSrc, targetBtn);
            }

            // Stepper Quantity Handler
            function adjustQty(amount) {
                const qtyInput = document.getElementById('productQty');
                if (qtyInput) {
                    let current = parseInt(qtyInput.value, 10) || 1;
                    current = Math.max(1, current + amount);
                    qtyInput.value = current;
                }
            }

            // Rating Toggle Handler (Default outlined, black filled on click)
            function toggleRating() {
                const btn = document.getElementById('ratingBtn');
                const starIcon = document.getElementById('ratingStarIcon');
                if (!starIcon) return;

                const isFilled = starIcon.getAttribute('data-filled') === 'true';
                if (isFilled) {
                    starIcon.setAttribute('data-filled', 'false');
                    starIcon.setAttribute('fill', 'none');
                    starIcon.classList.remove('text-black');
                    starIcon.classList.add('text-roseva-text');
                    btn.classList.remove('border-black', 'bg-[#F8F5EE]');
                } else {
                    starIcon.setAttribute('data-filled', 'true');
                    starIcon.setAttribute('fill', 'currentColor');
                    starIcon.classList.remove('text-roseva-text');
                    starIcon.classList.add('text-black');
                    btn.classList.add('border-black', 'bg-[#F8F5EE]');
                }
            }

            // Wishlist Toggle Handler
            function toggleWishlist() {
                const btn = document.getElementById('wishlistBtn');
                const heartIcon = document.getElementById('wishlistHeartIcon');
                if (!heartIcon) return;

                const isFilled = heartIcon.getAttribute('data-filled') === 'true';
                if (isFilled) {
                    heartIcon.setAttribute('data-filled', 'false');
                    heartIcon.setAttribute('fill', 'none');
                    btn.classList.remove('text-roseva-plum', 'border-roseva-plum', 'bg-[#F8F5EE]');
                } else {
                    heartIcon.setAttribute('data-filled', 'true');
                    heartIcon.setAttribute('fill', 'currentColor');
                    btn.classList.add('text-roseva-plum', 'border-roseva-plum', 'bg-[#F8F5EE]');
                }
            }

            // Accordion Toggle Handler
            function toggleAccordion(id) {
                const el = document.getElementById(id);
                if (el) {
                    el.classList.toggle('hidden');
                }
            }

            // Stepper Quantity Add to Cart Handler
            function addToCartFromDetail(name, price) {
                const qtyInput = document.getElementById('productQty');
                const qty = qtyInput ? (parseInt(qtyInput.value, 10) || 1) : 1;
                addToCart(name, price, qty);
                showAuthToast(`Added ${qty} × ${name} to cart!`);
            }

            // Tab Switcher Handler (Active has CTA color, Inactive soft neutral, All turn black on hover)
            function switchProductTab(tabKey, btn) {
                // Update buttons
                document.querySelectorAll('.tab-btn').forEach(b => {
                    b.classList.remove('bg-roseva-plum', 'text-white');
                    b.classList.add('bg-[#E5DFD7]', 'text-[#4A3B32]');
                });
                btn.classList.remove('bg-[#E5DFD7]', 'text-[#4A3B32]');
                btn.classList.add('bg-roseva-plum', 'text-white');

                // Toggle tab panels
                const reviewsPanel = document.getElementById('tabContentReviews');
                const routinePanel = document.getElementById('tabContentRoutine');
                const qaPanel = document.getElementById('tabContentQA');

                if (reviewsPanel) reviewsPanel.classList.add('hidden');
                if (routinePanel) routinePanel.classList.add('hidden');
                if (qaPanel) qaPanel.classList.add('hidden');

                if (tabKey === 'reviews' && reviewsPanel) reviewsPanel.classList.remove('hidden');
                if (tabKey === 'routine' && routinePanel) routinePanel.classList.remove('hidden');
                if (tabKey === 'qa' && qaPanel) qaPanel.classList.remove('hidden');
            }

            // Character Counter Handler for Review Input
            function updateCharCount(textarea) {
                const counter = document.getElementById('charCounter');
                if (counter && textarea) {
                    counter.innerText = `${textarea.value.length}/500`;
                }
            }

            // Review Submit Feedback
            function submitReview() {
                const input = document.getElementById('reviewInput');
                if (input && input.value.trim() !== '') {
                    showAuthToast('Thank you for your review! It has been posted.');
                    input.value = '';
                    updateCharCount(input);
                }
            }

            // Q&A Accordion Toggle Handler
            function toggleQA(ansId, iconId) {
                const ans = document.getElementById(ansId);
                const icon = document.getElementById(iconId);
                if (ans) {
                    ans.classList.toggle('hidden');
                }
                if (icon) {
                    icon.classList.toggle('rotate-180');
                }
            }

            // Submit Question Handler
            function submitQuestion() {
                const name = document.getElementById('qaNameInput');
                const question = document.getElementById('qaQuestionInput');
                if (question && question.value.trim() !== '') {
                    showAuthToast('Your question has been submitted!');
                    if (name) name.value = '';
                    question.value = '';
                } else {
                    alert('Please write your question before submitting.');
                }
            }
        </script>
    </body>

    </html>