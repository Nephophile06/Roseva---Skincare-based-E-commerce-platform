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
            <nav class="mb-8 font-arapey text-sm sm:text-base text-roseva-text/60 flex items-center gap-2"
                aria-label="Breadcrumb">
                <a href="index.jsp" class="hover:text-roseva-plum transition-colors">Home</a>
                <span>/</span>
                <a href="products.jsp" class="hover:text-roseva-plum transition-colors">Browse Products</a>
                <span>/</span>
                <span class="text-roseva-text font-medium">Roséva Cloud Drench</span>
            </nav>


            <!-- ============================================== -->
            <!-- PRODUCT HERO & GALLERY SECTION                 -->
            <!-- ============================================== -->
            <section class="grid grid-cols-1 lg:grid-cols-12 gap-10 lg:gap-14 items-start mb-16 sm:mb-20">

                <!-- Left: Gallery with Thumbnails -->
                <div class="lg:col-span-6 flex flex-col gap-3">
                    <span class="font-manrope text-xs tracking-wider text-roseva-text/60 uppercase">
                        [Batch Validated &bull; Batch #104]
                    </span>

                    <div class="flex flex-col-reverse sm:flex-row gap-4 items-stretch">
                        <!-- Vertical Thumbnails -->
                        <div
                            class="flex sm:flex-col gap-3 overflow-x-auto sm:overflow-visible no-scrollbar flex-shrink-0">
                            <button onclick="changeMainImage('assets/cloud drench.png', this)"
                                class="thumbnail-btn w-16 h-16 sm:w-20 sm:h-20 rounded-md border-2 border-roseva-plum overflow-hidden bg-[#F8F5EE] focus:outline-none transition-all">
                                <img src="assets/cloud drench.png" alt="Cloud Drench Angle 1"
                                    class="w-full h-full object-cover">
                            </button>
                            <button onclick="changeMainImage('assets/hydro boost.png', this)"
                                class="thumbnail-btn w-16 h-16 sm:w-20 sm:h-20 rounded-md border border-[#E0D7C9] overflow-hidden bg-[#F8F5EE] focus:outline-none transition-all opacity-70 hover:opacity-100">
                                <img src="assets/hydro boost.png" alt="Cloud Drench Angle 2"
                                    class="w-full h-full object-cover">
                            </button>
                            <button onclick="changeMainImage('assets/glow restore.png', this)"
                                class="thumbnail-btn w-16 h-16 sm:w-20 sm:h-20 rounded-md border border-[#E0D7C9] overflow-hidden bg-[#F8F5EE] focus:outline-none transition-all opacity-70 hover:opacity-100">
                                <img src="assets/glow restore.png" alt="Cloud Drench Angle 3"
                                    class="w-full h-full object-cover">
                            </button>
                            <button onclick="changeMainImage('assets/skin renewal.png', this)"
                                class="thumbnail-btn w-16 h-16 sm:w-20 sm:h-20 rounded-md border border-[#E0D7C9] overflow-hidden bg-[#F8F5EE] focus:outline-none transition-all opacity-70 hover:opacity-100">
                                <img src="assets/skin renewal.png" alt="Cloud Drench Angle 4"
                                    class="w-full h-full object-cover">
                            </button>
                        </div>

                        <!-- Main Preview Image -->
                        <div
                            class="flex-1 aspect-square rounded-lg overflow-hidden bg-[#F8F5EE] border border-[#EBE3D7] shadow-sm flex items-center justify-center p-2 relative group">
                            <img id="mainProductImg" src="assets/cloud drench.png" alt="Roséva Cloud Drench Full View"
                                class="w-full h-full object-cover rounded-md img-zoom transition-all duration-300">
                        </div>
                    </div>
                </div>

                <!-- Right: Product Information & Purchase Actions -->
                <div class="lg:col-span-6 flex flex-col justify-start">
                    <h1
                        class="font-oranienbaum text-3xl sm:text-4xl lg:text-5xl text-roseva-text tracking-normal mb-3 font-normal">
                        Roséva Cloud Drench
                    </h1>

                    <!-- Rating and Review count -->
                    <div class="flex items-center gap-2 mb-6">
                        <div class="flex text-amber-600 text-sm">
                            ★★★★★
                        </div>
                        <span class="font-manrope text-xs font-bold text-roseva-text">(5)</span>
                        <span class="font-quicksand text-xs text-roseva-text/60">4.9 (824 reviews)</span>
                    </div>

                    <!-- Product Description -->
                    <p class="font-quicksand text-sm sm:text-base text-roseva-text/85 leading-relaxed mb-8">
                        A cloud-like, ultra-lightweight water gel that instantly drenches your skin in deep hydration
                        without heaviness. Formulated with molecular-weight 5% pure Hyaluronic Acid and soothing
                        Centella asiatica, it actively repairs and shields the cellular skin barrier while providing
                        72-hour moisture. True to Roséva’s philosophy of radical transparency, 100% of this clean
                        botanical formula is disclosed with zero synthetic preservatives or heavy silicons, leaving a
                        soft velvet-dewy finish.
                    </p>

                    <!-- Pricing & Quantity Row -->
                    <div class="flex items-center justify-between gap-4 py-4 border-y border-[#EAE2D5] mb-6">
                        <div class="flex items-baseline gap-4">
                            <span class="font-oranienbaum text-3xl sm:text-4xl text-roseva-text font-medium">$55</span>
                            <span class="font-quicksand text-xs text-roseva-text/60">Quantity: 1</span>
                        </div>

                        <!-- Quantity Stepper -->
                        <div class="flex items-center gap-2 font-manrope text-xs">
                            <span class="text-roseva-text/70 hidden sm:inline">Quantity:</span>
                            <div
                                class="flex items-center border border-[#D5CFC3] rounded-sm bg-white overflow-hidden shadow-sm">
                                <button type="button" onclick="adjustQty(-1)"
                                    class="w-8 h-8 flex items-center justify-center text-roseva-text hover:bg-[#F8F5EE] transition-colors focus:outline-none">-</button>
                                <input id="productQty" type="text" value="1" readonly
                                    class="w-10 h-8 text-center text-xs font-semibold bg-transparent border-x border-[#D5CFC3] focus:outline-none">
                                <button type="button" onclick="adjustQty(1)"
                                    class="w-8 h-8 flex items-center justify-center text-roseva-text hover:bg-[#F8F5EE] transition-colors focus:outline-none">+</button>
                            </div>
                        </div>
                    </div>

                    <!-- Action Buttons: Wishlist, Share, Add to Cart -->
                    <div class="flex items-center gap-3">
                        <button id="wishlistBtn" onclick="toggleWishlist()"
                            class="w-12 h-12 flex items-center justify-center border border-[#D5CFC3] rounded-lg bg-white hover:border-roseva-plum text-roseva-text hover:text-roseva-plum transition-all shadow-sm focus:outline-none"
                            aria-label="Add to Wishlist">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8"
                                    d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                            </svg>
                        </button>

                        <button
                            class="w-12 h-12 flex items-center justify-center border border-[#D5CFC3] rounded-lg bg-white hover:border-roseva-plum text-roseva-text hover:text-roseva-plum transition-all shadow-sm focus:outline-none"
                            aria-label="Share Product">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8"
                                    d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                            </svg>
                        </button>

                        <button onclick="addToCart('Roséva Cloud Drench', 55)"
                            class="flex-1 h-11 bg-roseva-plum hover:bg-[#100C08] text-white font-manrope font-semibold text-sm sm:text-base tracking-wide rounded-lg shadow-md hover:shadow-lg transition-all duration-200 flex items-center justify-center">
                            Add to Cart
                        </button>
                    </div>

                </div>

            </section>


            <!-- ============================================== -->
            <!-- DERMATOLOGIST & LAB VALIDATIONS               -->
            <!-- ============================================== -->
            <section class="space-y-10 sm:space-y-12 py-10 border-t border-[#EAE2D5]">

                <!-- Section 1: Dermatologist Reviewed Validation -->
                <div>
                    <h2 class="font-oranienbaum text-2xl sm:text-3xl text-roseva-text mb-3">
                        Dermatologist Reviewed Validation
                    </h2>
                    <p
                        class="font-quicksand text-sm sm:text-base text-roseva-text/85 leading-relaxed max-w-4xl text-justify sm:text-left">
                        This formulation was rigorously evaluated through 12-week clinical trials on 150 volunteers with
                        sensitive skin types. Roséva Cloud Drench demonstrated a 96% increase in deep skin hydration,
                        zero reported breakouts or allergic flare-ups, and effectively repaired the skin barrier while
                        maintaining skin flora integrity. 100% hypoallergenic and free from irritating synthetic
                        fragrances.
                    </p>
                </div>

                <!-- Section 2: Lab Verification Tags -->
                <div>
                    <div class="flex flex-wrap items-baseline gap-2 mb-3">
                        <h2 class="font-oranienbaum text-2xl sm:text-3xl text-roseva-text">
                            Lab Verification Tags
                        </h2>
                        <span class="font-manrope text-xs text-roseva-text/60">
                            (Total Quality Assured: 100%)
                        </span>
                    </div>
                    <p
                        class="font-quicksand text-sm sm:text-base text-roseva-text/85 leading-relaxed max-w-4xl text-justify sm:text-left">
                        Every production batch undergoes strict third-party screening in our certified laboratory
                        testing for heavy metals, microbial safety, pesticide residues, and preservative potency to
                        ensure pure, uncompromised quality before reaching your skin. Scan the QR code on your bottle to
                        see real-time third-party purity certificates.
                    </p>
                </div>

            </section>


            <!-- ============================================== -->
            <!-- INGREDIENTS & FORMULA CLINICAL TABLE           -->
            <!-- ============================================== -->
            <section class="py-10 border-t border-[#EAE2D5]">
                <h2 class="font-oranienbaum text-2xl sm:text-3xl text-roseva-text mb-1">
                    Ingredients &amp; Formula
                </h2>
                <p class="font-quicksand text-xs sm:text-sm text-roseva-text/60 mb-6">
                    Key active ingredients &amp; clinical efficacy metrics:
                </p>

                <!-- Clinical Results Table -->
                <div class="overflow-x-auto mb-8">
                    <table class="w-full text-left font-quicksand text-xs sm:text-sm border-collapse">
                        <thead>
                            <tr class="border-y-2 border-roseva-text/80 font-manrope font-semibold text-roseva-text">
                                <th class="py-3 px-4">Target Concern</th>
                                <th class="py-3 px-4">Clinical Result</th>
                                <th class="py-3 px-4">Timeline</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-[#EBE3D7] text-roseva-text/85">
                            <tr class="hover:bg-white/40 transition-colors">
                                <td class="py-3 px-4 font-medium">Skin Dehydration</td>
                                <td class="py-3 px-4">94.5% Moisture Increase</td>
                                <td class="py-3 px-4">Instant (15 Mins)</td>
                            </tr>
                            <tr class="hover:bg-white/40 transition-colors">
                                <td class="py-3 px-4 font-medium">Barrier Redness</td>
                                <td class="py-3 px-4">62% Soothing Relief</td>
                                <td class="py-3 px-4">3 Days</td>
                            </tr>
                            <tr class="hover:bg-white/40 transition-colors">
                                <td class="py-3 px-4 font-medium">Uneven Texture / Flakiness</td>
                                <td class="py-3 px-4">54% Texture Softening</td>
                                <td class="py-3 px-4">1 Week</td>
                            </tr>
                            <tr class="hover:bg-white/40 transition-colors">
                                <td class="py-3 px-4 font-medium">Trans-epidermal Water Loss</td>
                                <td class="py-3 px-4">78% Moisture Retention</td>
                                <td class="py-3 px-4">2 Weeks</td>
                            </tr>
                            <tr class="hover:bg-white/40 transition-colors">
                                <td class="py-3 px-4 font-medium">Skin Irritation Index</td>
                                <td class="py-3 px-4">0.00 (Non-Irritant)</td>
                                <td class="py-3 px-4 font-semibold text-roseva-plum">Certified</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Accordion Items -->
                <div class="space-y-2 max-w-3xl">
                    <!-- Accordion 1 -->
                    <div class="border-b border-[#EAE2D5] pb-2">
                        <button onclick="toggleAccordion('acc1')"
                            class="w-full py-2.5 flex items-center justify-between text-left font-manrope text-sm font-semibold text-roseva-text hover:text-roseva-plum transition-colors focus:outline-none">
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
                    <div class="border-b border-[#EAE2D5] pb-2">
                        <button onclick="toggleAccordion('acc2')"
                            class="w-full py-2.5 flex items-center justify-between text-left font-manrope text-sm font-semibold text-roseva-text hover:text-roseva-plum transition-colors focus:outline-none">
                            <span>Results &amp; Efficacy</span>
                            <span class="text-roseva-plum text-base font-bold">✓</span>
                        </button>
                        <div id="acc2" class="hidden font-quicksand text-xs text-roseva-text/75 py-2 leading-relaxed">
                            Proven to boost deep hydration immediately and lock in moisture for up to 72 hours without
                            causing excess sebum production.
                        </div>
                    </div>

                    <!-- Accordion 3 -->
                    <div class="border-b border-[#EAE2D5] pb-2">
                        <button onclick="toggleAccordion('acc3')"
                            class="w-full py-2.5 flex items-center justify-between text-left font-manrope text-sm font-semibold text-roseva-text hover:text-roseva-plum transition-colors focus:outline-none">
                            <span>Cruelty Free &amp; Vegan Testing</span>
                            <span class="text-roseva-plum text-base font-bold">✓</span>
                        </button>
                        <div id="acc3" class="hidden font-quicksand text-xs text-roseva-text/75 py-2 leading-relaxed">
                            100% Leaping Bunny certified cruelty-free and certified vegan. Never tested on animals at
                            any stage of development.
                        </div>
                    </div>

                    <!-- Accordion 4 -->
                    <div class="border-b border-[#EAE2D5] pb-2">
                        <button onclick="toggleAccordion('acc4')"
                            class="w-full py-2.5 flex items-center justify-between text-left font-manrope text-sm font-semibold text-roseva-text hover:text-roseva-plum transition-colors focus:outline-none">
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
            <section class="py-10 border-t border-[#EAE2D5]">
                <!-- Tab Buttons -->
                <div class="flex items-center gap-2 mb-8">
                    <button
                        class="px-5 py-2 bg-roseva-plum text-white font-manrope text-xs font-semibold rounded-lg shadow-sm focus:outline-none">
                        Reviews
                    </button>
                    <button
                        class="px-5 py-2 bg-white border border-[#D5CFC3] text-roseva-text hover:border-roseva-plum font-manrope text-xs font-medium rounded-lg transition-colors focus:outline-none">
                        Discussions (24)
                    </button>
                    <button
                        class="px-5 py-2 bg-white border border-[#D5CFC3] text-roseva-text hover:border-roseva-plum font-manrope text-xs font-medium rounded-lg transition-colors focus:outline-none">
                        Q&amp;A
                    </button>
                </div>

                <!-- Reviews List -->
                <div class="space-y-6 max-w-3xl mb-8">
                    <!-- Review 1 -->
                    <div class="flex items-start gap-4">
                        <div
                            class="w-9 h-9 rounded-full bg-[#EAE2D5] flex items-center justify-center text-xs font-manrope font-bold text-roseva-text/70 flex-shrink-0">
                            SM
                        </div>
                        <div class="flex-1">
                            <div class="flex items-center gap-2 mb-1">
                                <span class="font-manrope text-xs font-bold text-roseva-text">Sarah M.</span>
                                <span class="font-quicksand text-[11px] text-roseva-text/50">2 days ago</span>
                            </div>
                            <p class="font-quicksand text-xs text-roseva-text/80 leading-relaxed">
                                I have ultra-sensitive oily skin, and finding a moisturizer that hydrates without
                                clogging pores has always been a nightmare. Cloud Drench completely transformed my skin
                                texture! It absorbs instantly and keeps my skin plump and matte all day without any
                                greasiness.
                            </p>
                        </div>
                    </div>

                    <!-- Review 2 -->
                    <div class="flex items-start gap-4">
                        <div
                            class="w-9 h-9 rounded-full bg-[#EAE2D5] flex items-center justify-center text-xs font-manrope font-bold text-roseva-text/70 flex-shrink-0">
                            EJ
                        </div>
                        <div class="flex-1">
                            <div class="flex items-center gap-2 mb-1">
                                <span class="font-manrope text-xs font-bold text-roseva-text">Emily Jenkins</span>
                                <span class="font-quicksand text-[11px] text-roseva-text/50">1 week ago</span>
                            </div>
                            <p class="font-quicksand text-xs text-roseva-text/80 leading-relaxed">
                                Obsessed with the transparency! You can tell how clean this is from the very first drop.
                                No scent, no stickiness, just pure hydration. It worked amazingly under my daily makeup
                                with zero pilling or dryness patches.
                            </p>
                        </div>
                    </div>

                    <!-- Review 3 -->
                    <div class="flex items-start gap-4">
                        <div
                            class="w-9 h-9 rounded-full bg-[#EAE2D5] flex items-center justify-center text-xs font-manrope font-bold text-roseva-text/70 flex-shrink-0">
                            DK
                        </div>
                        <div class="flex-1">
                            <div class="flex items-center gap-2 mb-1">
                                <span class="font-manrope text-xs font-bold text-roseva-text">David K.</span>
                                <span class="font-quicksand text-[11px] text-roseva-text/50">2 weeks ago</span>
                            </div>
                            <p class="font-quicksand text-xs text-roseva-text/80 leading-relaxed">
                                Helped soothe my post-sun irritation overnight. The Centella calming action is real.
                                Highly recommended for sensitive skin or anyone dealing with damaged moisture barriers.
                            </p>
                        </div>
                    </div>

                    <!-- Review 4 -->
                    <div class="flex items-start gap-4">
                        <div
                            class="w-9 h-9 rounded-full bg-[#EAE2D5] flex items-center justify-center text-xs font-manrope font-bold text-roseva-text/70 flex-shrink-0">
                            MR
                        </div>
                        <div class="flex-1">
                            <div class="flex items-center gap-2 mb-1">
                                <span class="font-manrope text-xs font-bold text-roseva-text">Maya R.</span>
                                <span class="font-quicksand text-[11px] text-roseva-text/50">3 weeks ago</span>
                            </div>
                            <p class="font-quicksand text-xs text-roseva-text/80 leading-relaxed">
                                The lightweight texture is unbelievable. It feels like splashing pure mineral water on
                                your face, and the finish is like velvet. Worth every single penny.
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Post a Review Form -->
                <div class="max-w-3xl flex items-start gap-4">
                    <div
                        class="w-9 h-9 rounded-full bg-roseva-plum text-white flex items-center justify-center text-xs font-manrope font-bold flex-shrink-0">
                        U
                    </div>
                    <div class="flex-1 flex flex-col gap-3">
                        <textarea id="reviewInput" rows="3" placeholder="Comment / Review..."
                            class="w-full p-3 bg-white border border-[#D5CFC3] rounded-sm text-xs font-quicksand text-roseva-text placeholder-roseva-text/40 focus:outline-none focus:border-roseva-plum transition-colors shadow-sm"></textarea>
                        <div>
                            <button type="button" onclick="submitReview()"
                                class="px-6 py-2 bg-roseva-plum hover:bg-[#100C08] text-white font-manrope text-xs font-semibold rounded-lg transition-colors shadow-sm">
                                Post a Review
                            </button>
                        </div>
                    </div>
                </div>

            </section>


            <!-- ============================================== -->
            <!-- RELEVANT PRODUCTS SECTION                      -->
            <!-- ============================================== -->
            <section class="py-12 border-t border-[#EAE2D5]">
                <div class="flex items-center justify-between mb-8">
                    <h2 class="font-oranienbaum text-2xl sm:text-3xl text-roseva-text">
                        Relevant Products
                    </h2>
                    <a href="products.jsp"
                        class="font-manrope text-xs font-semibold text-roseva-text/80 hover:text-roseva-plum transition-colors">
                        See More →
                    </a>
                </div>

                <!-- 3 Product Cards Grid -->
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
                    <!-- Relevant 1 -->
                    <div
                        class="bg-roseva-card rounded-md border border-[#EBE3D7] p-4 flex flex-col justify-between hover:shadow-lg transition-all duration-300 group">
                        <div
                            class="aspect-square w-full rounded overflow-hidden bg-[#F7F3EC] mb-4 flex items-center justify-center">
                            <img src="assets/glow restore.png" alt="Roséva Glow Restore"
                                class="w-full h-full object-cover img-zoom" loading="lazy">
                        </div>
                        <div>
                            <h3
                                class="font-oranienbaum text-lg text-roseva-text group-hover:text-roseva-plum transition-colors font-medium">
                                Roséva Glow Restore</h3>
                            <p class="font-quicksand text-xs text-roseva-text/60 mt-0.5">Lotion</p>
                            <p class="font-quicksand font-bold text-base text-roseva-text mt-2">$35</p>
                            <a href="product-detail.jsp"
                                class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-3 transition-colors group-hover:translate-x-1 duration-200">
                                See Details <span class="ml-1 text-sm font-light">→</span>
                            </a>
                        </div>
                    </div>

                    <!-- Relevant 2 -->
                    <div
                        class="bg-roseva-card rounded-md border border-[#EBE3D7] p-4 flex flex-col justify-between hover:shadow-lg transition-all duration-300 group">
                        <div
                            class="aspect-square w-full rounded overflow-hidden bg-[#F7F3EC] mb-4 flex items-center justify-center">
                            <img src="assets/skin renewal.png" alt="Roséva Skin Renewal"
                                class="w-full h-full object-cover img-zoom" loading="lazy">
                        </div>
                        <div>
                            <h3
                                class="font-oranienbaum text-lg text-roseva-text group-hover:text-roseva-plum transition-colors font-medium">
                                Roséva Skin Renewal</h3>
                            <p class="font-quicksand text-xs text-roseva-text/60 mt-0.5">Anti-aging Serum</p>
                            <p class="font-quicksand font-bold text-base text-roseva-text mt-2">$40</p>
                            <a href="product-detail.jsp"
                                class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-3 transition-colors group-hover:translate-x-1 duration-200">
                                See Details <span class="ml-1 text-sm font-light">→</span>
                            </a>
                        </div>
                    </div>

                    <!-- Relevant 3 -->
                    <div
                        class="bg-roseva-card rounded-md border border-[#EBE3D7] p-4 flex flex-col justify-between hover:shadow-lg transition-all duration-300 group">
                        <div
                            class="aspect-square w-full rounded overflow-hidden bg-[#F7F3EC] mb-4 flex items-center justify-center">
                            <img src="assets/hydro boost.png" alt="Roséva Hydro-Boost"
                                class="w-full h-full object-cover img-zoom" loading="lazy">
                        </div>
                        <div>
                            <h3
                                class="font-oranienbaum text-lg text-roseva-text group-hover:text-roseva-plum transition-colors font-medium">
                                Roséva Hydro-Boost</h3>
                            <p class="font-quicksand text-xs text-roseva-text/60 mt-0.5">Moisturizer</p>
                            <p class="font-quicksand font-bold text-base text-roseva-text mt-2">$20</p>
                            <a href="product-detail.jsp"
                                class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-3 transition-colors group-hover:translate-x-1 duration-200">
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
            // Gallery Thumbnail Switcher
            function changeMainImage(imgSrc, btn) {
                const mainImg = document.getElementById('mainProductImg');
                if (mainImg) {
                    mainImg.src = imgSrc;
                }
                document.querySelectorAll('.thumbnail-btn').forEach(b => {
                    b.classList.remove('border-roseva-plum', 'opacity-100');
                    b.classList.add('border-[#E0D7C9]', 'opacity-70');
                });
                btn.classList.add('border-roseva-plum', 'opacity-100');
                btn.classList.remove('opacity-70');
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

            // Wishlist Toggle Handler
            function toggleWishlist() {
                const btn = document.getElementById('wishlistBtn');
                if (btn) {
                    btn.classList.toggle('text-roseva-plum');
                    btn.classList.toggle('border-roseva-plum');
                }
            }

            // Accordion Toggle Handler
            function toggleAccordion(id) {
                const el = document.getElementById(id);
                if (el) {
                    el.classList.toggle('hidden');
                }
            }

            // Review Submit Feedback
            function submitReview() {
                const input = document.getElementById('reviewInput');
                if (input && input.value.trim() !== '') {
                    alert('Thank you for your review! It will be published after verification.');
                    input.value = '';
                }
            }
        </script>
    </body>

    </html>