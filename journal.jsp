<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en" class="scroll-smooth">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>The Journal — Understanding the Skin Barrier &amp; Meet the Founders | Roséva</title>
        <meta name="description"
            content="Read Roséva's clinical skincare journal: Learn how over-exfoliation compromises lipid layers, why less is more, and meet co-founders Dr. Anika Binta Azad Shifa and Tousif Tasrik.">

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
        class="bg-roseva-bg text-roseva-text antialiased selection:bg-roseva-plum selection:text-white min-h-screen flex flex-col justify-between overflow-x-hidden">

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
                        class="relative py-1 after:absolute after:bottom-0 after:left-0 after:w-full after:h-0.5 after:bg-roseva-plum after:scale-x-100 font-medium">The
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
                    <a href="journal.jsp" class="text-roseva-plum font-semibold">The Journal</a>
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
        <!-- MAIN JOURNAL EDITORIAL CONTENT                 -->
        <!-- ============================================== -->
        <main class="flex-grow w-full max-w-[1360px] mx-auto px-6 sm:px-10 lg:px-16 pt-8 pb-20">

            <!-- ============================================== -->
            <!-- HERO / EDITORIAL ARTICLE SECTION               -->
            <!-- Transition: Left and Right images slide in     -->
            <!-- ============================================== -->
            <section class="relative w-full mb-24 sm:mb-32">

                <div class="grid grid-cols-1 lg:grid-cols-12 gap-8 lg:gap-12 items-start">

                    <!-- LEFT COLUMN: Signs of Dehydrated Skin & Article Callouts (Slides in from Left) -->
                    <div class="lg:col-span-5 flex flex-col gap-8 animate-enter-left">

                        <!-- Main Hero Face / Signs of Dehydrated Skin Visual -->
                        <div
                            class="relative w-full rounded-2xl overflow-hidden shadow-sm transition-transform duration-500 hover:shadow-md">
                            <img src="assets/Heading Image.png"
                                alt="Signs of Dehydrated Skin - Clinical Dermatological Diagram"
                                class="w-full h-auto object-contain rounded-2xl" />
                        </div>

                        <!-- Article Excerpt Text -->
                        <div class="space-y-4 pt-2">
                            <p
                                class="font-quicksand text-base sm:text-lg text-roseva-text/90 leading-relaxed font-normal">
                                Learn how over-exfoliation compromises your lipid layers and how ingredients like <span
                                    class="font-semibold text-roseva-plum">Centella Asiatica</span> actively repair it.
                            </p>
                            <div class="flex items-center gap-2 font-manrope text-sm font-medium text-roseva-text/75">
                                <span>By Dr. Sarah</span>
                                <span>|</span>
                                <span>5 Min Read</span>
                                <span class="text-roseva-plum text-base font-bold">↗</span>
                            </div>
                        </div>

                        <!-- Article Link Cards (Stacked) -->
                        <div class="flex flex-col gap-4">

                            <!-- Card 1 -->
                            <a href="#article-ha"
                                class="group p-5 sm:p-6 bg-white/70 hover:bg-white rounded-2xl border border-[#7A2E47]/10 hover:border-roseva-plum/30 shadow-[0_2px_12px_rgba(0,0,0,0.03)] hover:shadow-[0_8px_24px_rgba(122,46,71,0.08)] transition-all duration-300 block">
                                <h3
                                    class="font-oranienbaum text-lg sm:text-xl text-roseva-text group-hover:text-roseva-plum transition-colors leading-snug">
                                    Hyaluronic Acid vs. Sodium Hyaluronate:
                                </h3>
                                <div class="flex items-center justify-between mt-2">
                                    <span
                                        class="font-quicksand text-sm text-roseva-text/70 group-hover:text-roseva-text transition-colors">
                                        What's the Difference?
                                    </span>
                                    <span
                                        class="text-roseva-plum font-bold text-lg transition-transform duration-300 group-hover:translate-x-1 group-hover:-translate-y-1">↗</span>
                                </div>
                            </a>

                            <!-- Card 2 -->
                            <a href="#article-climate"
                                class="group p-5 sm:p-6 bg-white/70 hover:bg-white rounded-2xl border border-[#7A2E47]/10 hover:border-roseva-plum/30 shadow-[0_2px_12px_rgba(0,0,0,0.03)] hover:shadow-[0_8px_24px_rgba(122,46,71,0.08)] transition-all duration-300 block">
                                <h3
                                    class="font-oranienbaum text-lg sm:text-xl text-roseva-text group-hover:text-roseva-plum transition-colors leading-snug">
                                    How to Care for Combination
                                </h3>
                                <div class="flex items-center justify-between mt-2">
                                    <span
                                        class="font-quicksand text-sm text-roseva-text/70 group-hover:text-roseva-text transition-colors">
                                        Sensitive Skin in Humid Climates
                                    </span>
                                    <span
                                        class="text-roseva-plum font-bold text-lg transition-transform duration-300 group-hover:translate-x-1 group-hover:-translate-y-1">↗</span>
                                </div>
                            </a>

                        </div>

                    </div>


                    <!-- RIGHT COLUMN: Headlines & Flatlay Editorial Layout (Slides in from Right) -->
                    <div class="lg:col-span-7 flex flex-col justify-between h-full animate-enter-right">

                        <!-- Editorial Heading and Botanical Side Element -->
                        <div class="flex flex-col sm:flex-row items-start justify-between gap-6 pb-6">
                            <div class="flex-1">
                                <h1
                                    class="font-oranienbaum text-4xl sm:text-5xl lg:text-[58px] text-roseva-text leading-[1.12] tracking-tight">
                                    Understanding the Skin Barrier
                                </h1>
                                <p
                                    class="font-stylescript text-5xl sm:text-6xl lg:text-7xl text-roseva-text mt-3 mb-2 leading-none select-none">
                                    Why less is More
                                </p>
                            </div>

                            <!-- Botanical Ingredient Visual (Shea nuts / botanical bowl) -->
                            <div class="w-32 sm:w-40 lg:w-48 flex-shrink-0 self-end sm:self-start">
                                <img src="assets/Side Image Hero.png" alt="Natural Botanical Extracts"
                                    class="w-full h-auto object-contain drop-shadow-sm hover:scale-105 transition-transform duration-500" />
                            </div>
                        </div>

                        <!-- Dynamic Composition: Flowing Pouring Cream & Framed Editorial Flatlay -->
                        <div class="relative mt-4 sm:mt-8 w-full flex flex-col md:flex-row items-center justify-end">

                            <!-- Spatula Pouring Cream Image - Centered / Floating Accent -->
                            <div
                                class="hidden md:block absolute -left-16 lg:-left-20 top-1/4 z-10 w-44 lg:w-56 pointer-events-none drop-shadow-md">
                                <img src="assets/Pouring Image.png" alt="Rich Emollient Cream Texture"
                                    class="w-full h-auto object-contain transform -rotate-6" />
                            </div>

                            <!-- Framed Editorial Visual ("skin barrier needs these") -->
                            <div
                                class="w-full max-w-[560px] ml-auto rounded-3xl overflow-hidden shadow-md border border-[#7A2E47]/10 hover:shadow-xl transition-all duration-500 group">
                                <img src="assets/with frame.png"
                                    alt="Skin Barrier Needs These - Clinical lipid and ceramide formulation breakdown"
                                    class="w-full h-auto object-cover group-hover:scale-[1.02] transition-transform duration-700" />
                            </div>

                        </div>

                    </div>

                </div>

            </section>


            <!-- ============================================== -->
            <!-- MEET THE FOUNDERS SECTION                      -->
            <!-- Scroll Reveal Transition from Both Sides       -->
            <!-- ============================================== -->
            <section id="founders" class="w-full pt-12 sm:pt-20 border-t border-[#7A2E47]/15">

                <!-- Section Header -->
                <div class="text-center mb-16 sm:mb-24">
                    <h2 class="font-oranienbaum text-3xl sm:text-4xl lg:text-5xl text-roseva-plum tracking-normal">
                        Meet the Founders
                    </h2>
                    <div class="w-16 h-0.5 bg-roseva-plum/40 mx-auto mt-4"></div>
                </div>

                <div class="space-y-20 sm:space-y-28 max-w-[1180px] mx-auto">

                    <!-- FOUNDER 1: Dr. Anika Binta Azad Shifa (Text on Left, Photo on Right) -->
                    <div class="grid grid-cols-1 md:grid-cols-12 gap-8 md:gap-12 lg:gap-16 items-center">

                        <!-- Bio Text (Slides from Left on Scroll) -->
                        <div class="md:col-span-7 flex flex-col justify-center reveal-on-scroll reveal-left">
                            <h3
                                class="font-oranienbaum text-2xl sm:text-3xl lg:text-4xl text-roseva-text font-medium leading-snug">
                                Anika Binta Azad Shifa, MD
                            </h3>
                            <p
                                class="font-manrope text-sm sm:text-base font-semibold text-roseva-plum tracking-wide mt-1.5 mb-6">
                                Co-Founder &amp; Chief Dermatologist
                            </p>
                            <p
                                class="font-quicksand text-base sm:text-lg text-roseva-text/85 leading-relaxed font-normal text-justify sm:text-left">
                                With over 12 years of clinical experience in treating compromised skin barriers, Anika
                                Binta Azad Shifa co-founded <span class="font-semibold text-roseva-plum">Roséva</span>
                                to bridge the gap between prescription-grade efficacy and clean, daily skincare. After
                                earning her Doctorate in Dermatology and conducting extensive research, she grew
                                frustrated with industry-standard mystery blends and heavy synthetic fillers. At <span
                                    class="font-semibold text-roseva-plum">Roséva</span>, Shifa leads the formulation
                                lab, ensuring that every product undergoes rigorous independent clinical trials and
                                achieves a zero-toxic irritation index before ever reaching a customer's shelf.
                            </p>
                        </div>

                        <!-- Founder Avatar / Portrait (Slides from Right on Scroll) -->
                        <div class="md:col-span-5 flex justify-center md:justify-end reveal-on-scroll reveal-right">
                            <div
                                class="w-full max-w-[320px] sm:max-w-[360px] bg-[#F5EFEB] rounded-3xl p-4 sm:p-6 shadow-sm border border-[#7A2E47]/10 hover:shadow-lg transition-all duration-300 flex items-center justify-center">
                                <img src="assets/hehe.png" alt="Dr. Anika Binta Azad Shifa, MD"
                                    class="w-full h-auto object-contain rounded-2xl transition-transform duration-500 hover:scale-105" />
                            </div>
                        </div>

                    </div>


                    <!-- FOUNDER 2: Tousif Tasrik, PhD (Photo on Left, Text on Right) -->
                    <div class="grid grid-cols-1 md:grid-cols-12 gap-8 md:gap-12 lg:gap-16 items-center">

                        <!-- Founder Avatar / Portrait (Slides from Left on Scroll) -->
                        <div
                            class="order-2 md:order-1 md:col-span-5 flex justify-center md:justify-start reveal-on-scroll reveal-left">
                            <div
                                class="w-full max-w-[320px] sm:max-w-[360px] bg-[#EFEBE9] rounded-3xl p-4 sm:p-6 shadow-sm border border-[#7A2E47]/10 hover:shadow-lg transition-all duration-300 flex items-center justify-center">
                                <img src="assets/tushu.png" alt="Tousif Tasrik, PhD"
                                    class="w-full h-auto object-contain rounded-2xl transition-transform duration-500 hover:scale-105" />
                            </div>
                        </div>

                        <!-- Bio Text (Slides from Right on Scroll) -->
                        <div
                            class="order-1 md:order-2 md:col-span-7 flex flex-col justify-center reveal-on-scroll reveal-right">
                            <h3
                                class="font-oranienbaum text-2xl sm:text-3xl lg:text-4xl text-roseva-text font-medium leading-snug">
                                Tousif Tasrik, PhD
                            </h3>
                            <p
                                class="font-manrope text-sm sm:text-base font-semibold text-roseva-plum tracking-wide mt-1.5 mb-6">
                                Head of Bio-Chemical Research
                            </p>
                            <p
                                class="font-quicksand text-base sm:text-lg text-roseva-text/85 leading-relaxed font-normal text-justify sm:text-left">
                                Tousif Tasrik is a molecular biochemist dedicated to the science of clean ingredient
                                compatibility. Having spent years in cosmetic biotechnology labs analyzing plant-derived
                                actives, his vision for <span class="font-semibold text-roseva-plum">Roséva</span> was
                                rooted in radical transparency — a belief in clinical integrity and quality assurance
                                systems and developed the unique "Batch Verification" process that allows customers to
                                scan a QR code and view the exact purity report of their specific bottle. His obsession
                                with botanical phospholipid formulation ensures molecular stability and unprecedented
                                skin delivery.
                            </p>
                        </div>

                    </div>

                </div>

            </section>

        </main>


        <!-- ============================================== -->
        <!-- FOOTER SECTION                                 -->
        <!-- ============================================== -->
        <footer class="bg-roseva-footer text-roseva-text pt-16 pb-12 mt-16 border-t border-roseva-text/10">
            <div class="max-w-[1360px] mx-auto px-6 sm:px-10 lg:px-16">

                <!-- Footer Top: Script Brand Logo -->
                <div class="mb-12">
                    <a href="index.jsp" class="inline-block focus:outline-none" aria-label="Roséva Home">
                        <span class="font-stylescript text-5xl sm:text-6xl text-roseva-plum block">Roséva</span>
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