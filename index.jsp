<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en" class="scroll-smooth">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Roséva — The Proof is in Your Reflection | Pure Botanical Skincare</title>
        <meta name="description"
            content="Know exactly what you are applying to your skin with zero misleading fluff. Every Roséva essential formula features full ingredient transparency and verified safety standards.">

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

    <body class="bg-roseva-bg text-roseva-text antialiased selection:bg-roseva-plum selection:text-white">

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
                        class="relative py-1 after:absolute after:bottom-0 after:left-0 after:w-full after:h-0.5 after:bg-roseva-plum after:scale-x-100 font-medium">Home</a>
                    <a href="journal.jsp"
                        class="relative py-1 after:absolute after:bottom-0 after:left-0 after:w-full after:h-0.5 after:bg-roseva-plum after:scale-x-0 hover:after:scale-x-100 after:transition-transform">The
                        Journal</a>
                    <a href="products.jsp"
                        class="relative py-1 after:absolute after:bottom-0 after:left-0 after:w-full after:h-0.5 after:bg-roseva-plum after:scale-x-0 hover:after:scale-x-100 after:transition-transform">Products</a>
                    <a href="#wishlist"
                        class="relative py-1 after:absolute after:bottom-0 after:left-0 after:w-full after:h-0.5 after:bg-roseva-plum after:scale-x-0 hover:after:scale-x-100 after:transition-transform">Wishlist</a>
                    <a href="profile.jsp"
                        class="relative py-1 after:absolute after:bottom-0 after:left-0 after:w-full after:h-0.5 after:bg-roseva-plum after:scale-x-0 hover:after:scale-x-100 after:transition-transform">Tousif
                        Tasrik</a>
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
                    <a href="products.jsp" class="hover:text-roseva-plum transition-colors">Products</a>
                    <a href="#wishlist" class="hover:text-roseva-plum transition-colors">Wishlist</a>
                    <a href="#auth" class="hover:text-roseva-plum transition-colors">Login/Signup</a>
                </div>
            </div>
        </header>


        <main id="home">
            <!-- ============================================== -->
            <!-- HERO / BANNER SECTION                          -->
            <!-- ============================================== -->
            <section
                class="relative bg-gradient-to-r from-[#FFFAF0] via-[#FAF0E6] to-[#F5E6DC] overflow-hidden border-b border-[#7A2E47]/10 h-[320px] sm:h-[550px] lg:h-[570px] flex items-center">
                <div class="w-full grid grid-cols-1 lg:grid-cols-12 items-stretch h-full">

                    <!-- Hero Left: Content -->
                    <div
                        class="lg:col-span-6 px-6 sm:px-12 lg:pl-[max(1.5rem,calc((100vw-1360px)/2+2.5rem))] lg:pr-10 py-6 lg:py-8 flex flex-col justify-center z-10 h-full">
                        <h1
                            class="font-oranienbaum text-2xl sm:text-3xl lg:text-[38px] leading-[1.15] text-roseva-plum mb-3 tracking-tight">
                            The Proof is<br>in Your Reflection
                        </h1>
                        <p
                            class="font-quicksand text-xs sm:text-sm text-roseva-text/85 max-w-lg mb-5 leading-relaxed font-normal">
                            Know exactly what you applying to your skin with zero misleading fluff. Every <span
                                class="text-roseva-plum font-semibold">Roséva</span> essential formula has full
                            ingredient transparency & verified safety standards.
                        </p>
                        <div>
                            <a href="#products"
                                class="inline-flex items-center justify-center font-manrope font-semibold text-xs sm:text-sm tracking-wide bg-roseva-plum hover:bg-[#100C08] text-white px-6 py-2 rounded-lg shadow-md hover:shadow-lg transition-all duration-300 transform hover:-translate-y-0.5">
                                Shop Now
                            </a>
                        </div>
                    </div>

                    <!-- Hero Right: Dynamic Visual Artistry -->
                    <div class="hidden lg:block lg:col-span-6 relative h-full overflow-hidden">
                        <div class="absolute inset-0 w-full h-full flex items-stretch">
                            <!-- Swirling Cream Texture Component -->
                            <div class="w-1/2 h-full relative overflow-hidden">
                                <img src="assets/banner ingredient.png" alt="Pure botanical cream texture"
                                    class="w-full h-full object-cover object-center transform scale-105 filter brightness-102" />
                            </div>
                            <!-- Radiant Face Model Component (Flush to the extreme right edge) -->
                            <div class="w-1/2 h-full relative overflow-hidden">
                                <img src="assets/banner face.png" alt="Radiant skin model reflection"
                                    class="w-full h-full object-cover object-top filter brightness-100 contrast-102" />
                            </div>
                        </div>
                    </div>

                </div>
            </section>


            <!-- ============================================== -->
            <!-- NEW ITEMS (10 PRODUCTS CAROUSEL)               -->
            <!-- ============================================== -->
            <section id="products" class="py-16 sm:py-24 max-w-[1360px] mx-auto px-6 sm:px-10 lg:px-16">
                <!-- Section Heading (Oranienbaum, #7A2E47) -->
                <div class="text-center mb-12 sm:mb-16">
                    <h2 class="font-oranienbaum text-3xl sm:text-4xl lg:text-[42px] text-roseva-plum tracking-normal">
                        New Items
                    </h2>
                </div>

                <!-- Products Carousel Container -->
                <div class="relative">
                    <div id="productTrack"
                        class="flex gap-5 sm:gap-6 overflow-x-auto no-scrollbar scroll-smooth pb-4 snap-x snap-mandatory focus:outline-none"
                        tabindex="0">

                        <!-- Product 1 (Base 1) -->
                        <div
                            class="w-[80%] sm:w-[46%] md:w-[31%] lg:w-[calc((100%-4.5rem)/3.5)] flex-[0_0_80%] sm:flex-[0_0_46%] md:flex-[0_0_31%] lg:flex-[0_0_calc((100%-4.5rem)/3.5)] min-w-0 snap-start bg-roseva-card rounded-md border border-[#EBE3D7] p-3.5 sm:p-4 flex flex-col justify-between hover:shadow-lg transition-all duration-300 group">
                            <div
                                class="aspect-square w-full rounded overflow-hidden bg-[#F7F3EC] mb-3 sm:mb-4 flex items-center justify-center">
                                <img src="assets/hydro boost.png" alt="Roséva Hydro-Boost"
                                    class="w-full h-full object-cover img-zoom" loading="lazy">
                            </div>
                            <div>
                                <h3
                                    class="font-oranienbaum text-base sm:text-lg text-roseva-text group-hover:text-roseva-plum transition-colors font-medium truncate">
                                    Roséva Hydro-Boost</h3>
                                <p class="font-quicksand text-xs text-roseva-text/60 mt-0.5">Moisturizer</p>
                                <p class="font-quicksand font-bold text-sm sm:text-base text-roseva-text mt-1.5">$44</p>
                                <button onclick="addToCart('Roséva Hydro-Boost', 44)"
                                    class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-2.5 transition-colors group-hover:translate-x-1 duration-200">
                                    See Details <span class="ml-1 text-sm font-light">→</span>
                                </button>
                            </div>
                        </div>

                        <!-- Product 2 (Base 2) -->
                        <div
                            class="w-[80%] sm:w-[46%] md:w-[31%] lg:w-[calc((100%-4.5rem)/3.5)] flex-[0_0_80%] sm:flex-[0_0_46%] md:flex-[0_0_31%] lg:flex-[0_0_calc((100%-4.5rem)/3.5)] min-w-0 snap-start bg-roseva-card rounded-md border border-[#EBE3D7] p-3.5 sm:p-4 flex flex-col justify-between hover:shadow-lg transition-all duration-300 group">
                            <div
                                class="aspect-square w-full rounded overflow-hidden bg-[#F7F3EC] mb-3 sm:mb-4 flex items-center justify-center">
                                <img src="assets/glow restore.png" alt="Roséva Glow Restore"
                                    class="w-full h-full object-cover img-zoom" loading="lazy">
                            </div>
                            <div>
                                <h3
                                    class="font-oranienbaum text-base sm:text-lg text-roseva-text group-hover:text-roseva-plum transition-colors font-medium truncate">
                                    Roséva Glow Restore</h3>
                                <p class="font-quicksand text-xs text-roseva-text/60 mt-0.5">Lotion</p>
                                <p class="font-quicksand font-bold text-sm sm:text-base text-roseva-text mt-1.5">$32</p>
                                <button onclick="addToCart('Roséva Glow Restore', 32)"
                                    class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-2.5 transition-colors group-hover:translate-x-1 duration-200">
                                    See Details <span class="ml-1 text-sm font-light">→</span>
                                </button>
                            </div>
                        </div>

                        <!-- Product 3 (Base 3) -->
                        <div
                            class="w-[80%] sm:w-[46%] md:w-[31%] lg:w-[calc((100%-4.5rem)/3.5)] flex-[0_0_80%] sm:flex-[0_0_46%] md:flex-[0_0_31%] lg:flex-[0_0_calc((100%-4.5rem)/3.5)] min-w-0 snap-start bg-roseva-card rounded-md border border-[#EBE3D7] p-3.5 sm:p-4 flex flex-col justify-between hover:shadow-lg transition-all duration-300 group">
                            <div
                                class="aspect-square w-full rounded overflow-hidden bg-[#F7F3EC] mb-3 sm:mb-4 flex items-center justify-center">
                                <img src="assets/cloud drench.png" alt="Roséva Cloud Drench"
                                    class="w-full h-full object-cover img-zoom" loading="lazy">
                            </div>
                            <div>
                                <h3
                                    class="font-oranienbaum text-base sm:text-lg text-roseva-text group-hover:text-roseva-plum transition-colors font-medium truncate">
                                    Roséva Cloud Drench</h3>
                                <p class="font-quicksand text-xs text-roseva-text/60 mt-0.5">Hydration Elixir</p>
                                <p class="font-quicksand font-bold text-sm sm:text-base text-roseva-text mt-1.5">$55</p>
                                <button onclick="addToCart('Roséva Cloud Drench', 55)"
                                    class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-2.5 transition-colors group-hover:translate-x-1 duration-200">
                                    See Details <span class="ml-1 text-sm font-light">→</span>
                                </button>
                            </div>
                        </div>

                        <!-- Product 4 (Base 4) -->
                        <div
                            class="w-[80%] sm:w-[46%] md:w-[31%] lg:w-[calc((100%-4.5rem)/3.5)] flex-[0_0_80%] sm:flex-[0_0_46%] md:flex-[0_0_31%] lg:flex-[0_0_calc((100%-4.5rem)/3.5)] min-w-0 snap-start bg-roseva-card rounded-md border border-[#EBE3D7] p-3.5 sm:p-4 flex flex-col justify-between hover:shadow-lg transition-all duration-300 group">
                            <div
                                class="aspect-square w-full rounded overflow-hidden bg-[#F7F3EC] mb-3 sm:mb-4 flex items-center justify-center">
                                <img src="assets/skin renewal.png" alt="Roséva Skin Renewal"
                                    class="w-full h-full object-cover img-zoom" loading="lazy">
                            </div>
                            <div>
                                <h3
                                    class="font-oranienbaum text-base sm:text-lg text-roseva-text group-hover:text-roseva-plum transition-colors font-medium truncate">
                                    Roséva Skin Renewal</h3>
                                <p class="font-quicksand text-xs text-roseva-text/60 mt-0.5">Anti-aging Serum</p>
                                <p class="font-quicksand font-bold text-sm sm:text-base text-roseva-text mt-1.5">$60</p>
                                <button onclick="addToCart('Roséva Skin Renewal', 60)"
                                    class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-2.5 transition-colors group-hover:translate-x-1 duration-200">
                                    See Details <span class="ml-1 text-sm font-light">→</span>
                                </button>
                            </div>
                        </div>

                        <!-- Product 5 (Repetitive Mixup 1: Cloud Drench variant) -->
                        <div
                            class="w-[80%] sm:w-[46%] md:w-[31%] lg:w-[calc((100%-4.5rem)/3.5)] flex-[0_0_80%] sm:flex-[0_0_46%] md:flex-[0_0_31%] lg:flex-[0_0_calc((100%-4.5rem)/3.5)] min-w-0 snap-start bg-roseva-card rounded-md border border-[#EBE3D7] p-3.5 sm:p-4 flex flex-col justify-between hover:shadow-lg transition-all duration-300 group">
                            <div
                                class="aspect-square w-full rounded overflow-hidden bg-[#F7F3EC] mb-3 sm:mb-4 flex items-center justify-center">
                                <img src="assets/cloud drench.png" alt="Roséva Cloud Drench Intensive"
                                    class="w-full h-full object-cover img-zoom" loading="lazy">
                            </div>
                            <div>
                                <h3
                                    class="font-oranienbaum text-base sm:text-lg text-roseva-text group-hover:text-roseva-plum transition-colors font-medium truncate">
                                    Roséva Cloud Drench</h3>
                                <p class="font-quicksand text-xs text-roseva-text/60 mt-0.5">Deep Hydration Infusion</p>
                                <p class="font-quicksand font-bold text-sm sm:text-base text-roseva-text mt-1.5">$58</p>
                                <button onclick="addToCart('Roséva Cloud Drench Intensive', 58)"
                                    class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-2.5 transition-colors group-hover:translate-x-1 duration-200">
                                    See Details <span class="ml-1 text-sm font-light">→</span>
                                </button>
                            </div>
                        </div>

                        <!-- Product 6 (Repetitive Mixup 2: Hydro-Boost variant) -->
                        <div
                            class="w-[80%] sm:w-[46%] md:w-[31%] lg:w-[calc((100%-4.5rem)/3.5)] flex-[0_0_80%] sm:flex-[0_0_46%] md:flex-[0_0_31%] lg:flex-[0_0_calc((100%-4.5rem)/3.5)] min-w-0 snap-start bg-roseva-card rounded-md border border-[#EBE3D7] p-3.5 sm:p-4 flex flex-col justify-between hover:shadow-lg transition-all duration-300 group">
                            <div
                                class="aspect-square w-full rounded overflow-hidden bg-[#F7F3EC] mb-3 sm:mb-4 flex items-center justify-center">
                                <img src="assets/hydro boost.png" alt="Roséva Hydro-Boost Crème"
                                    class="w-full h-full object-cover img-zoom" loading="lazy">
                            </div>
                            <div>
                                <h3
                                    class="font-oranienbaum text-base sm:text-lg text-roseva-text group-hover:text-roseva-plum transition-colors font-medium truncate">
                                    Roséva Hydro-Boost</h3>
                                <p class="font-quicksand text-xs text-roseva-text/60 mt-0.5">Hydra Daily Crème</p>
                                <p class="font-quicksand font-bold text-sm sm:text-base text-roseva-text mt-1.5">$46</p>
                                <button onclick="addToCart('Roséva Hydro-Boost Crème', 46)"
                                    class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-2.5 transition-colors group-hover:translate-x-1 duration-200">
                                    See Details <span class="ml-1 text-sm font-light">→</span>
                                </button>
                            </div>
                        </div>

                        <!-- Product 7 (Repetitive Mixup 3: Skin Renewal variant) -->
                        <div
                            class="w-[80%] sm:w-[46%] md:w-[31%] lg:w-[calc((100%-4.5rem)/3.5)] flex-[0_0_80%] sm:flex-[0_0_46%] md:flex-[0_0_31%] lg:flex-[0_0_calc((100%-4.5rem)/3.5)] min-w-0 snap-start bg-roseva-card rounded-md border border-[#EBE3D7] p-3.5 sm:p-4 flex flex-col justify-between hover:shadow-lg transition-all duration-300 group">
                            <div
                                class="aspect-square w-full rounded overflow-hidden bg-[#F7F3EC] mb-3 sm:mb-4 flex items-center justify-center">
                                <img src="assets/skin renewal.png" alt="Roséva Skin Renewal Concentrate"
                                    class="w-full h-full object-cover img-zoom" loading="lazy">
                            </div>
                            <div>
                                <h3
                                    class="font-oranienbaum text-base sm:text-lg text-roseva-text group-hover:text-roseva-plum transition-colors font-medium truncate">
                                    Roséva Skin Renewal</h3>
                                <p class="font-quicksand text-xs text-roseva-text/60 mt-0.5">Youth Night Concentrate</p>
                                <p class="font-quicksand font-bold text-sm sm:text-base text-roseva-text mt-1.5">$62</p>
                                <button onclick="addToCart('Roséva Skin Renewal Concentrate', 62)"
                                    class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-2.5 transition-colors group-hover:translate-x-1 duration-200">
                                    See Details <span class="ml-1 text-sm font-light">→</span>
                                </button>
                            </div>
                        </div>

                        <!-- Product 8 (Repetitive Mixup 4: Glow Restore variant) -->
                        <div
                            class="w-[80%] sm:w-[46%] md:w-[31%] lg:w-[calc((100%-4.5rem)/3.5)] flex-[0_0_80%] sm:flex-[0_0_46%] md:flex-[0_0_31%] lg:flex-[0_0_calc((100%-4.5rem)/3.5)] min-w-0 snap-start bg-roseva-card rounded-md border border-[#EBE3D7] p-3.5 sm:p-4 flex flex-col justify-between hover:shadow-lg transition-all duration-300 group">
                            <div
                                class="aspect-square w-full rounded overflow-hidden bg-[#F7F3EC] mb-3 sm:mb-4 flex items-center justify-center">
                                <img src="assets/glow restore.png" alt="Roséva Glow Restore Milk"
                                    class="w-full h-full object-cover img-zoom" loading="lazy">
                            </div>
                            <div>
                                <h3
                                    class="font-oranienbaum text-base sm:text-lg text-roseva-text group-hover:text-roseva-plum transition-colors font-medium truncate">
                                    Roséva Glow Restore</h3>
                                <p class="font-quicksand text-xs text-roseva-text/60 mt-0.5">Radiance Essence Milk</p>
                                <p class="font-quicksand font-bold text-sm sm:text-base text-roseva-text mt-1.5">$35</p>
                                <button onclick="addToCart('Roséva Glow Restore Milk', 35)"
                                    class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-2.5 transition-colors group-hover:translate-x-1 duration-200">
                                    See Details <span class="ml-1 text-sm font-light">→</span>
                                </button>
                            </div>
                        </div>

                        <!-- Product 9 (Repetitive Mixup 5: Hydro-Boost variant) -->
                        <div
                            class="w-[80%] sm:w-[46%] md:w-[31%] lg:w-[calc((100%-4.5rem)/3.5)] flex-[0_0_80%] sm:flex-[0_0_46%] md:flex-[0_0_31%] lg:flex-[0_0_calc((100%-4.5rem)/3.5)] min-w-0 snap-start bg-roseva-card rounded-md border border-[#EBE3D7] p-3.5 sm:p-4 flex flex-col justify-between hover:shadow-lg transition-all duration-300 group">
                            <div
                                class="aspect-square w-full rounded overflow-hidden bg-[#F7F3EC] mb-3 sm:mb-4 flex items-center justify-center">
                                <img src="assets/hydro boost.png" alt="Roséva Hydro-Boost Balm"
                                    class="w-full h-full object-cover img-zoom" loading="lazy">
                            </div>
                            <div>
                                <h3
                                    class="font-oranienbaum text-base sm:text-lg text-roseva-text group-hover:text-roseva-plum transition-colors font-medium truncate">
                                    Roséva Hydro-Boost</h3>
                                <p class="font-quicksand text-xs text-roseva-text/60 mt-0.5">Barrier Recovery Balm</p>
                                <p class="font-quicksand font-bold text-sm sm:text-base text-roseva-text mt-1.5">$48</p>
                                <button onclick="addToCart('Roséva Hydro-Boost Balm', 48)"
                                    class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-2.5 transition-colors group-hover:translate-x-1 duration-200">
                                    See Details <span class="ml-1 text-sm font-light">→</span>
                                </button>
                            </div>
                        </div>

                        <!-- Product 10 (Repetitive Mixup 6: Cloud Drench variant) -->
                        <div
                            class="w-[80%] sm:w-[46%] md:w-[31%] lg:w-[calc((100%-4.5rem)/3.5)] flex-[0_0_80%] sm:flex-[0_0_46%] md:flex-[0_0_31%] lg:flex-[0_0_calc((100%-4.5rem)/3.5)] min-w-0 snap-start bg-roseva-card rounded-md border border-[#EBE3D7] p-3.5 sm:p-4 flex flex-col justify-between hover:shadow-lg transition-all duration-300 group">
                            <div
                                class="aspect-square w-full rounded overflow-hidden bg-[#F7F3EC] mb-3 sm:mb-4 flex items-center justify-center">
                                <img src="assets/cloud drench.png" alt="Roséva Cloud Drench Mist"
                                    class="w-full h-full object-cover img-zoom" loading="lazy">
                            </div>
                            <div>
                                <h3
                                    class="font-oranienbaum text-base sm:text-lg text-roseva-text group-hover:text-roseva-plum transition-colors font-medium truncate">
                                    Roséva Cloud Drench</h3>
                                <p class="font-quicksand text-xs text-roseva-text/60 mt-0.5">Pure Mineral Mist</p>
                                <p class="font-quicksand font-bold text-sm sm:text-base text-roseva-text mt-1.5">$52</p>
                                <button onclick="addToCart('Roséva Cloud Drench Mist', 52)"
                                    class="inline-flex items-center text-xs font-manrope text-roseva-text/80 hover:text-roseva-plum font-semibold mt-2.5 transition-colors group-hover:translate-x-1 duration-200">
                                    See Details <span class="ml-1 text-sm font-light">→</span>
                                </button>
                            </div>
                        </div>

                    </div>

                    <!-- Carousel Controls: Arrow Buttons and Scroll Progress Bar -->
                    <div class="mt-8 flex items-center gap-6">
                        <!-- Left and Right Navigation Arrows -->
                        <div class="flex items-center gap-4">
                            <button id="prevBtn" aria-label="Previous Products"
                                class="text-roseva-text hover:text-roseva-plum p-1 transition-colors duration-200 focus:outline-none disabled:opacity-30">
                                <svg class="w-5 h-5 stroke-[1.5]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M10.5 19.5L3 12m0 0l7.5-7.5M3 12h18" />
                                </svg>
                            </button>
                            <button id="nextBtn" aria-label="Next Products"
                                class="text-roseva-text hover:text-roseva-plum p-1 transition-colors duration-200 focus:outline-none">
                                <svg class="w-5 h-5 stroke-[1.5]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3" />
                                </svg>
                            </button>
                        </div>

                        <!-- Scrollbar Track Indicator -->
                        <div class="relative flex-1 h-[3px] bg-[#E0D7C9] rounded-full overflow-hidden">
                            <div id="carouselProgress"
                                class="absolute top-0 left-0 h-full bg-roseva-text rounded-full transition-all duration-150"
                                style="width: 25%;"></div>
                        </div>
                    </div>
                </div>
            </section>


            <!-- ============================================== -->
            <!-- SHOP BY CATEGORY SECTION                       -->
            <!-- ============================================== -->
            <section class="py-16 sm:py-24 max-w-[1360px] mx-auto px-6 sm:px-10 lg:px-16">
                <!-- Section Heading (Oranienbaum, #7A2E47) -->
                <div class="text-center mb-14 sm:mb-18">
                    <h2 class="font-oranienbaum text-3xl sm:text-4xl lg:text-[42px] text-roseva-plum tracking-normal">
                        Shop by Category
                    </h2>
                </div>

                <!-- 2-Column Grid Matching Reference UI -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-x-8 lg:gap-x-12 gap-y-12 sm:gap-y-16">

                    <!-- Category 1: Moisturizer -->
                    <div class="flex flex-col items-center group cursor-pointer">
                        <div
                            class="w-full aspect-[16/10] sm:aspect-[16/9] rounded-md overflow-hidden bg-[#F5EFE6] border border-[#EAE2D5] shadow-sm group-hover:shadow-md transition-all duration-300">
                            <img src="assets/moisturizer.png" alt="Moisturizer Collection"
                                class="w-full h-full object-cover img-zoom" loading="lazy">
                        </div>
                        <h3
                            class="font-oranienbaum text-2xl sm:text-3xl text-roseva-plum mt-5 text-center group-hover:opacity-80 transition-opacity">
                            Moisturizer
                        </h3>
                    </div>

                    <!-- Category 2: Spot Remover -->
                    <div class="flex flex-col items-center group cursor-pointer">
                        <div
                            class="w-full aspect-[16/10] sm:aspect-[16/9] rounded-md overflow-hidden bg-[#F5EFE6] border border-[#EAE2D5] shadow-sm group-hover:shadow-md transition-all duration-300">
                            <img src="assets/spot remover.png" alt="Spot Remover Collection"
                                class="w-full h-full object-cover img-zoom" loading="lazy">
                        </div>
                        <h3
                            class="font-oranienbaum text-2xl sm:text-3xl text-roseva-plum mt-5 text-center group-hover:opacity-80 transition-opacity">
                            Spot Remover
                        </h3>
                    </div>

                    <!-- Category 3: Cleanser -->
                    <div class="flex flex-col items-center group cursor-pointer">
                        <div
                            class="w-full aspect-[16/10] sm:aspect-[16/9] rounded-md overflow-hidden bg-[#F5EFE6] border border-[#EAE2D5] shadow-sm group-hover:shadow-md transition-all duration-300">
                            <img src="assets/cleanser.png" alt="Cleanser Collection"
                                class="w-full h-full object-cover img-zoom" loading="lazy">
                        </div>
                        <h3
                            class="font-oranienbaum text-2xl sm:text-3xl text-roseva-plum mt-5 text-center group-hover:opacity-80 transition-opacity">
                            Cleanser
                        </h3>
                    </div>

                    <!-- Category 4: Facewash -->
                    <div class="flex flex-col items-center group cursor-pointer">
                        <div
                            class="w-full aspect-[16/10] sm:aspect-[16/9] rounded-md overflow-hidden bg-[#F5EFE6] border border-[#EAE2D5] shadow-sm group-hover:shadow-md transition-all duration-300">
                            <img src="assets/facewash.png" alt="Facewash Collection"
                                class="w-full h-full object-cover img-zoom" loading="lazy">
                        </div>
                        <h3
                            class="font-oranienbaum text-2xl sm:text-3xl text-roseva-plum mt-5 text-center group-hover:opacity-80 transition-opacity">
                            Facewash
                        </h3>
                    </div>

                    <!-- Category 5: Scrubs & Exfoliates -->
                    <div class="flex flex-col items-center group cursor-pointer">
                        <div
                            class="w-full aspect-[16/10] sm:aspect-[16/9] rounded-md overflow-hidden bg-[#F5EFE6] border border-[#EAE2D5] shadow-sm group-hover:shadow-md transition-all duration-300">
                            <img src="assets/scrubs & exfoliates.png" alt="Scrubs & Exfoliates Collection"
                                class="w-full h-full object-cover img-zoom" loading="lazy">
                        </div>
                        <h3
                            class="font-oranienbaum text-2xl sm:text-3xl text-roseva-plum mt-5 text-center group-hover:opacity-80 transition-opacity">
                            Scrubs & Exfoliates
                        </h3>
                    </div>

                    <!-- Category 6: Serum -->
                    <div class="flex flex-col items-center group cursor-pointer">
                        <div
                            class="w-full aspect-[16/10] sm:aspect-[16/9] rounded-md overflow-hidden bg-[#F5EFE6] border border-[#EAE2D5] shadow-sm group-hover:shadow-md transition-all duration-300">
                            <img src="assets/serum.png" alt="Serum Collection"
                                class="w-full h-full object-cover img-zoom" loading="lazy">
                        </div>
                        <h3
                            class="font-oranienbaum text-2xl sm:text-3xl text-roseva-plum mt-5 text-center group-hover:opacity-80 transition-opacity">
                            Serum
                        </h3>
                    </div>

                </div>
            </section>


            <!-- ============================================== -->
            <!-- ABOUT SECTION                                  -->
            <!-- ============================================== -->
            <section id="journal"
                class="py-16 sm:py-24 max-w-[1360px] mx-auto px-6 sm:px-10 lg:px-16 border-t border-[#7A2E47]/10">
                <div class="grid grid-cols-1 lg:grid-cols-12 gap-12 lg:gap-16 items-center">

                    <!-- About Content (Left) -->
                    <div class="lg:col-span-7 flex flex-col justify-center">
                        <h2
                            class="font-oranienbaum text-3xl sm:text-4xl lg:text-[46px] text-roseva-plum mb-6 tracking-normal">
                            About
                        </h2>
                        <div
                            class="space-y-4 font-quicksand text-base sm:text-lg text-roseva-text/90 leading-relaxed max-w-xl text-justify sm:text-left">
                            <p>
                                At <span class="text-roseva-plum font-semibold">Roséva</span>, we believe you shouldn't
                                have to base your skincare on blind faith. Skincare is the daily self-care ritual,
                                setting the conversation for how you live. We provide solutions not clouded by jargon.
                            </p>
                            <p>
                                Every single ingredient we use is clinically tested for its efficacy, and chosen with
                                precise purpose. Pure skin revitaliser blend that shields your skin, works in harmony,
                                provides honesty.
                            </p>
                            <p>
                                Welcome to a skincare routine where you know exactly what goes into your routine, and
                                exactly how it nurtures your skin.
                            </p>
                        </div>
                    </div>

                    <!-- About Image (Right) -->
                    <div class="lg:col-span-5 flex justify-center lg:justify-end">
                        <div
                            class="w-full max-w-md aspect-[4/5] sm:aspect-[3/4] rounded-lg overflow-hidden shadow-md border border-[#E8E0D2] group">
                            <img src="assets/about.png" alt="Roséva Pure Botanical Serum with Rose Petals"
                                class="w-full h-full object-cover img-zoom" loading="lazy">
                        </div>
                    </div>

                </div>
            </section>
        </main>


        <!-- ============================================== -->
        <!-- FOOTER SECTION                                 -->
        <!-- ============================================== -->
        <footer class="bg-roseva-footer text-roseva-text pt-16 pb-12 mt-12 border-t border-[#7A2E47]/10">
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
                                <span>407, Kamal Ataturk Avenue, Road 11</span><br>
                                <span>Banani, Dhaka-1213, Bangladesh</span>
                            </div>
                        </div>
                    </div>

                    <!-- Column 2: Quick Links / Care (Centered in Middle between Col 1 and Col 3) -->
                    <div class="flex flex-col gap-2.5 md:justify-self-center">
                        <a href="#store-locator" class="hover:text-roseva-plum transition-colors inline-block">Store
                            Locator</a>
                        <a href="#dermatologist" class="hover:text-roseva-plum transition-colors inline-block">Talk to
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


        <!-- ============================================== -->
        <!-- JAVASCRIPT LOGIC & CAROUSEL INTERACTIONS       -->
        <!-- ============================================== -->
        <script src="js/main.js"></script>
    </body>

    </html>