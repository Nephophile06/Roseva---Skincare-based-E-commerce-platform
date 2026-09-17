<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en" class="scroll-smooth">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Browse Products — Roséva Skincare | Verified Formulas</title>
        <meta name="description"
            content="100% disclosed ingredients mapped to target your specific skin concerns with precision. Browse all Roséva botanical formulas.">

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
        <!-- MAIN CONTENT CONTAINER                        -->
        <!-- ============================================== -->
        <main class="flex-grow max-w-[1360px] w-full mx-auto px-6 sm:px-10 lg:px-16 py-8 sm:py-12">

            <!-- ============================================== -->
            <!-- TOP PROMOTIONAL BANNER                         -->
            <!-- ============================================== -->
            <section class="mb-6 sm:mb-8">
                <div class="flex flex-col md:flex-row items-center justify-between gap-6 sm:gap-10 py-4 sm:py-6">

                    <!-- Banner Image Left (Cream Swatches) -->
                    <div
                        class="w-32 sm:w-40 lg:w-48 h-32 sm:h-40 lg:h-48 flex-shrink-0 flex items-center justify-center">
                        <img src="assets/banner 2.png" alt="Pure botanical formula texture"
                            class="max-w-full max-h-full object-contain drop-shadow-sm" />
                    </div>

                    <!-- Banner Center Text -->
                    <div class="flex-1 text-center px-4 max-w-xl">
                        <h1
                            class="font-oranienbaum text-3xl sm:text-4xl lg:text-5xl text-roseva-plum tracking-normal mb-2 sm:mb-3">
                            Verified Formulas
                        </h1>
                        <p class="font-quicksand text-sm sm:text-base text-roseva-text/85 leading-relaxed">
                            100% disclosed ingredients mapped to target<br class="hidden sm:block">your specific skin
                            concerns with precision.
                        </p>
                    </div>

                    <!-- Banner Image Right (Hand applying mask bowl) -->
                    <div
                        class="w-32 sm:w-40 lg:w-48 h-32 sm:h-40 lg:h-48 flex-shrink-0 flex items-center justify-center">
                        <img src="assets/banner 1.png" alt="Herbal formulation ritual"
                            class="max-w-full max-h-full object-contain drop-shadow-sm" />
                    </div>
                </div>
            </section>


            <!-- ============================================== -->
            <!-- SEARCH, SORT & BREADCRUMB BAR                 -->
            <!-- ============================================== -->
            <section class="mb-8 sm:mb-10">
                <!-- Breadcrumb Navigation -->
                <nav class="mb-5 font-arapey text-sm sm:text-base text-roseva-text/60 flex items-center gap-2"
                    aria-label="Breadcrumb">
                    <a href="index.jsp" class="hover:text-roseva-plum transition-colors">Home</a>
                    <span>/</span>
                    <span class="text-roseva-text font-medium">Browse Products</span>
                    <span>/</span>
                    <span id="activeCategoryBreadcrumb" class="text-roseva-text/70">Facial Wipes</span>
                </nav>

                <!-- Search & Sort Row -->
                <div class="flex flex-col sm:flex-row items-stretch sm:items-center justify-between gap-4">

                    <!-- Option matching #2: Unified Sleek Search Bar -->
                    <div
                        class="flex items-center w-full sm:max-w-md lg:max-w-lg border border-[#D5CFC3] rounded-lg bg-white px-4 py-2.5 focus-within:border-roseva-plum focus-within:ring-1 focus-within:ring-roseva-plum/20 transition-all shadow-sm">

                        <!-- Search Icon (Left) -->
                        <svg class="w-5 h-5 text-roseva-text/40 flex-shrink-0" fill="none" stroke="currentColor"
                            viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                        </svg>

                        <!-- Input Field -->
                        <input type="text" id="productSearchInput" placeholder="Search..."
                            class="w-full px-3 text-sm font-quicksand text-roseva-text placeholder-roseva-text/40 bg-transparent focus:outline-none" />

                        <!-- Mic Icon (Right) -->
                        <button type="button"
                            class="text-roseva-text/40 hover:text-roseva-plum focus:outline-none transition-colors flex-shrink-0">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M19 11a7 7 0 01-7 7m0 0a7 7 0 01-7-7m7 7v4m0 0H8m4 0h4m-4-8a3 3 0 01-3-3V5a3 3 0 116 0v6a3 3 0 01-3 3z">
                                </path>
                            </svg>
                        </button>
                    </div>

                    <!-- Sort Dropdown Trigger (Height aligned with search box) -->
                    <div class="relative flex-shrink-0">
                        <button id="sortDropdownBtn" type="button"
                            class="w-full sm:w-48 bg-white border border-[#D5CFC3] px-4 py-2.5 rounded-lg text-sm font-manrope text-roseva-text/80 flex items-center justify-between gap-2.5 shadow-sm hover:border-roseva-plum focus:outline-none transition-colors">
                            <span id="selectedSortLabel" class="font-medium text-roseva-text/90">Sort by</span>
                            <svg class="w-4 h-4 text-roseva-text/60 transition-transform duration-200" id="sortArrow"
                                fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M19 9l-7 7-7-7" />
                            </svg>
                        </button>

                        <!-- CUSTOM SORT DROPDOWN (Balanced Ratio) -->
                        <div id="sortDropdownMenu"
                            class="dropdown-menu hidden absolute right-0 mt-1.5 w-48 bg-[#FFFAF0] rounded-xl shadow-xl border border-[#7A2E47]/15 z-40 overflow-hidden py-1 backdrop-blur-md">
                            <div class="flex flex-col font-manrope text-sm text-roseva-text">
                                <button type="button" onclick="selectSortOption('Most Popular')"
                                    class="px-4 py-2.5 hover:bg-[#7A2E47]/10 hover:text-roseva-plum transition-colors text-left focus:outline-none font-medium">
                                    Most Popular
                                </button>
                                <button type="button" onclick="selectSortOption('Price: low to high')"
                                    class="px-4 py-2.5 hover:bg-[#7A2E47]/10 hover:text-roseva-plum transition-colors text-left focus:outline-none border-t border-[#7A2E47]/10 font-medium">
                                    Price: low to high
                                </button>
                                <button type="button" onclick="selectSortOption('Price: high to low')"
                                    class="px-4 py-2.5 hover:bg-[#7A2E47]/10 hover:text-roseva-plum transition-colors text-left focus:outline-none border-t border-[#7A2E47]/10 font-medium">
                                    Price: high to low
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>


            <!-- ============================================== -->
            <!-- MAIN PRODUCT BROWSER (SIDEBAR + GRID)          -->
            <!-- ============================================== -->
            <div class="grid grid-cols-1 lg:grid-cols-12 gap-8 lg:gap-12 items-start">

                <!-- SIDEBAR: BROWSE PRODUCTS CATEGORIES -->
                <aside class="lg:col-span-3">
                    <div class="bg-transparent">
                        <h2 class="font-oranienbaum text-2xl sm:text-[28px] text-roseva-plum mb-6 tracking-normal">
                            Browse Products
                        </h2>

                        <!-- Category List with Numbers -->
                        <ul class="space-y-3 font-quicksand text-sm text-roseva-text/85">
                            <li
                                class="flex items-center justify-between cursor-pointer hover:text-roseva-plum transition-colors py-0.5">
                                <span>Cleanser</span>
                                <span class="font-medium text-roseva-text/60">25</span>
                            </li>
                            <li
                                class="flex items-center justify-between cursor-pointer hover:text-roseva-plum transition-colors py-0.5">
                                <span>Face Masks</span>
                                <span class="font-medium text-roseva-text/60">60</span>
                            </li>
                            <li
                                class="flex items-center justify-between cursor-pointer hover:text-roseva-plum transition-colors py-0.5">
                                <span>Sunscreen</span>
                                <span class="font-medium text-roseva-text/60">10</span>
                            </li>
                            <li
                                class="flex items-center justify-between cursor-pointer hover:text-roseva-plum transition-colors py-0.5">
                                <span>Moisturizer</span>
                                <span class="font-medium text-roseva-text/60">42</span>
                            </li>
                            <li
                                class="flex items-center justify-between cursor-pointer hover:text-roseva-plum transition-colors py-0.5">
                                <span>Facewash</span>
                                <span class="font-medium text-roseva-text/60">35</span>
                            </li>
                            <li
                                class="flex items-center justify-between cursor-pointer hover:text-roseva-plum transition-colors py-0.5">
                                <span>Serum</span>
                                <span class="font-medium text-roseva-text/60">60</span>
                            </li>
                            <li
                                class="flex items-center justify-between cursor-pointer hover:text-roseva-plum transition-colors py-0.5">
                                <span>Lip Balm</span>
                                <span class="font-medium text-roseva-text/60">10</span>
                            </li>
                            <li
                                class="flex items-center justify-between cursor-pointer text-roseva-plum font-semibold py-0.5">
                                <span>Facial Wipes</span>
                                <span class="font-medium text-roseva-plum">42</span>
                            </li>
                            <li
                                class="flex items-center justify-between cursor-pointer hover:text-roseva-plum transition-colors py-0.5">
                                <span>Spot Remover</span>
                                <span class="font-medium text-roseva-text/60">35</span>
                            </li>
                            <li
                                class="flex items-center justify-between cursor-pointer hover:text-roseva-plum transition-colors py-0.5">
                                <span>Scrubs &amp; Exfoliators</span>
                                <span class="font-medium text-roseva-text/60">60</span>
                            </li>
                            <li
                                class="flex items-center justify-between cursor-pointer hover:text-roseva-plum transition-colors py-0.5">
                                <span>Cleanser</span>
                                <span class="font-medium text-roseva-text/60">25</span>
                            </li>
                            <li
                                class="flex items-center justify-between cursor-pointer hover:text-roseva-plum transition-colors py-0.5">
                                <span>Face Masks</span>
                                <span class="font-medium text-roseva-text/60">60</span>
                            </li>
                            <li
                                class="flex items-center justify-between cursor-pointer hover:text-roseva-plum transition-colors py-0.5">
                                <span>Sunscreen</span>
                                <span class="font-medium text-roseva-text/60">10</span>
                            </li>
                            <li
                                class="flex items-center justify-between cursor-pointer hover:text-roseva-plum transition-colors py-0.5">
                                <span>Moisturizer</span>
                                <span class="font-medium text-roseva-text/60">42</span>
                            </li>
                            <li
                                class="flex items-center justify-between cursor-pointer hover:text-roseva-plum transition-colors py-0.5">
                                <span>Facewash</span>
                                <span class="font-medium text-roseva-text/60">35</span>
                            </li>
                            <li
                                class="flex items-center justify-between cursor-pointer hover:text-roseva-plum transition-colors py-0.5">
                                <span>Serum</span>
                                <span class="font-medium text-roseva-text/60">60</span>
                            </li>
                            <li
                                class="flex items-center justify-between cursor-pointer hover:text-roseva-plum transition-colors py-0.5">
                                <span>Lip Balm</span>
                                <span class="font-medium text-roseva-text/60">10</span>
                            </li>
                            <li
                                class="flex items-center justify-between cursor-pointer hover:text-roseva-plum transition-colors py-0.5">
                                <span>Facial Wipes</span>
                                <span class="font-medium text-roseva-text/60">42</span>
                            </li>
                            <li
                                class="flex items-center justify-between cursor-pointer hover:text-roseva-plum transition-colors py-0.5">
                                <span>Spot Remover</span>
                                <span class="font-medium text-roseva-text/60">35</span>
                            </li>
                            <li
                                class="flex items-center justify-between cursor-pointer hover:text-roseva-plum transition-colors py-0.5">
                                <span>Scrubs &amp; Exfoliators</span>
                                <span class="font-medium text-roseva-text/60">60</span>
                            </li>
                        </ul>
                    </div>
                </aside>


                <!-- RIGHT SECTION: 12 PRODUCT GRID -->
                <div class="lg:col-span-9">
                    <div class="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-6">

                        <!-- Product 1: Roséva Hydro-Boost -->
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
                                <button onclick="addToCart('Roséva Hydro-Boost', 20)"
                                    class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-3 transition-colors group-hover:translate-x-1 duration-200">
                                    See Details <span class="ml-1 text-sm font-light">→</span>
                                </button>
                            </div>
                        </div>

                        <!-- Product 2: Roséva Glow Restore -->
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
                                <button onclick="addToCart('Roséva Glow Restore', 35)"
                                    class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-3 transition-colors group-hover:translate-x-1 duration-200">
                                    See Details <span class="ml-1 text-sm font-light">→</span>
                                </button>
                            </div>
                        </div>

                        <!-- Product 3: Roséva Skin Renewal -->
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
                                <button onclick="addToCart('Roséva Skin Renewal', 40)"
                                    class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-3 transition-colors group-hover:translate-x-1 duration-200">
                                    See Details <span class="ml-1 text-sm font-light">→</span>
                                </button>
                            </div>
                        </div>

                        <!-- Product 4: Roséva Glow Restore -->
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
                                <button onclick="addToCart('Roséva Glow Restore', 35)"
                                    class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-3 transition-colors group-hover:translate-x-1 duration-200">
                                    See Details <span class="ml-1 text-sm font-light">→</span>
                                </button>
                            </div>
                        </div>

                        <!-- Product 5: Roséva Skin Renewal -->
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
                                <button onclick="addToCart('Roséva Skin Renewal', 40)"
                                    class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-3 transition-colors group-hover:translate-x-1 duration-200">
                                    See Details <span class="ml-1 text-sm font-light">→</span>
                                </button>
                            </div>
                        </div>

                        <!-- Product 6: Roséva Hydro-Boost -->
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
                                <button onclick="addToCart('Roséva Hydro-Boost', 20)"
                                    class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-3 transition-colors group-hover:translate-x-1 duration-200">
                                    See Details <span class="ml-1 text-sm font-light">→</span>
                                </button>
                            </div>
                        </div>

                        <!-- Product 7: Roséva Hydro-Boost -->
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
                                <button onclick="addToCart('Roséva Hydro-Boost', 20)"
                                    class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-3 transition-colors group-hover:translate-x-1 duration-200">
                                    See Details <span class="ml-1 text-sm font-light">→</span>
                                </button>
                            </div>
                        </div>

                        <!-- Product 8: Roséva Glow Restore -->
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
                                <button onclick="addToCart('Roséva Glow Restore', 35)"
                                    class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-3 transition-colors group-hover:translate-x-1 duration-200">
                                    See Details <span class="ml-1 text-sm font-light">→</span>
                                </button>
                            </div>
                        </div>

                        <!-- Product 9: Roséva Skin Renewal -->
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
                                <button onclick="addToCart('Roséva Skin Renewal', 40)"
                                    class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-3 transition-colors group-hover:translate-x-1 duration-200">
                                    See Details <span class="ml-1 text-sm font-light">→</span>
                                </button>
                            </div>
                        </div>

                        <!-- Product 10: Roséva Glow Restore -->
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
                                <button onclick="addToCart('Roséva Glow Restore', 35)"
                                    class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-3 transition-colors group-hover:translate-x-1 duration-200">
                                    See Details <span class="ml-1 text-sm font-light">→</span>
                                </button>
                            </div>
                        </div>

                        <!-- Product 11: Roséva Skin Renewal -->
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
                                <button onclick="addToCart('Roséva Skin Renewal', 40)"
                                    class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-3 transition-colors group-hover:translate-x-1 duration-200">
                                    See Details <span class="ml-1 text-sm font-light">→</span>
                                </button>
                            </div>
                        </div>

                        <!-- Product 12: Roséva Hydro-Boost -->
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
                                <button onclick="addToCart('Roséva Hydro-Boost', 20)"
                                    class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-3 transition-colors group-hover:translate-x-1 duration-200">
                                    See Details <span class="ml-1 text-sm font-light">→</span>
                                </button>
                            </div>
                        </div>

                    </div>


                    <!-- ============================================== -->
                    <!-- PAGINATION & GO TO DROPDOWN SECTION            -->
                    <!-- ============================================== -->
                    <div
                        class="mt-12 pt-6 border-t border-[#EAE2D5] flex flex-wrap items-center justify-between gap-5 font-quicksand text-sm text-roseva-text/80">

                        <!-- Left: Total Items Count -->
                        <div class="font-manrope text-sm text-roseva-text/70 font-medium">
                            Total <span class="font-semibold text-roseva-text">48</span> items
                        </div>

                        <!-- Center: Dynamic Pagination Buttons -->
                        <div id="paginationButtons"
                            class="flex items-center gap-1.5 sm:gap-2 font-manrope text-xs sm:text-sm">
                            <!-- Populated dynamically by renderPagination() in main.js -->
                        </div>

                        <!-- Right: Go to Page Selector (Enhanced Size & Luxury Proportion) -->
                        <div class="flex items-center gap-3 relative">
                            <span class="font-manrope text-sm text-roseva-text/80 font-medium">Go to</span>
                            <div class="relative">
                                <button id="pageDropdownBtn" type="button"
                                    class="bg-white border border-[#D5CFC3] rounded-lg px-4 py-2.5 text-sm font-manrope font-medium flex items-center justify-between gap-3 min-w-[130px] sm:min-w-[140px] hover:border-roseva-plum focus:outline-none transition-all shadow-sm text-roseva-text">
                                    <span id="selectedPageLabel" class="font-medium text-roseva-text/90">Page 1</span>
                                    <svg class="w-4 h-4 text-roseva-text/60 transition-transform duration-200"
                                        id="pageArrow" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M19 9l-7 7-7-7" />
                                    </svg>
                                </button>

                                <!-- CUSTOM SORT DROPDOWN PAGE -->
                                <div id="pageDropdownMenu"
                                    class="dropdown-menu hidden absolute right-0 bottom-full mb-2 w-36 bg-[#FFFAF0] rounded-xl shadow-xl border border-[#7A2E47]/15 z-40 overflow-hidden py-1.5 backdrop-blur-md">
                                    <div
                                        class="max-h-60 overflow-y-auto no-scrollbar divide-y divide-[#7A2E47]/10 text-center font-manrope text-sm text-roseva-text font-medium">
                                        <button type="button" onclick="selectPageOption(1)"
                                            class="w-full py-2.5 hover:text-roseva-plum hover:bg-[#7A2E47]/10 transition-colors focus:outline-none">Page
                                            1</button>
                                        <button type="button" onclick="selectPageOption(2)"
                                            class="w-full py-2.5 hover:text-roseva-plum hover:bg-[#7A2E47]/10 transition-colors focus:outline-none">Page
                                            2</button>
                                        <button type="button" onclick="selectPageOption(3)"
                                            class="w-full py-2.5 hover:text-roseva-plum hover:bg-[#7A2E47]/10 transition-colors focus:outline-none">Page
                                            3</button>
                                        <button type="button" onclick="selectPageOption(4)"
                                            class="w-full py-2.5 hover:text-roseva-plum hover:bg-[#7A2E47]/10 transition-colors focus:outline-none">Page
                                            4</button>
                                        <button type="button" onclick="selectPageOption(5)"
                                            class="w-full py-2.5 hover:text-roseva-plum hover:bg-[#7A2E47]/10 transition-colors focus:outline-none">Page
                                            5</button>
                                        <button type="button" onclick="selectPageOption(6)"
                                            class="w-full py-2.5 hover:text-roseva-plum hover:bg-[#7A2E47]/10 transition-colors focus:outline-none">Page
                                            6</button>
                                        <button type="button" onclick="selectPageOption(7)"
                                            class="w-full py-2.5 hover:text-roseva-plum hover:bg-[#7A2E47]/10 transition-colors focus:outline-none">Page
                                            7</button>
                                        <button type="button" onclick="selectPageOption(8)"
                                            class="w-full py-2.5 hover:text-roseva-plum hover:bg-[#7A2E47]/10 transition-colors focus:outline-none">Page
                                            8</button>
                                        <button type="button" onclick="selectPageOption(9)"
                                            class="w-full py-2.5 hover:text-roseva-plum hover:bg-[#7A2E47]/10 transition-colors focus:outline-none">Page
                                            9</button>
                                        <button type="button" onclick="selectPageOption(10)"
                                            class="w-full py-2.5 hover:text-roseva-plum hover:bg-[#7A2E47]/10 transition-colors focus:outline-none">Page
                                            10</button>
                                    </div>
                                </div>
                            </div>
                        </div>

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
    </body>

    </html>