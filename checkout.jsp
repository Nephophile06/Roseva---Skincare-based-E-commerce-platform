<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en" class="scroll-smooth">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Delivery &amp; Payment Information — Roséva Skincare | Verified Clean Formulations</title>
        <meta name="description"
            content="Secure checkout: delivery address, city selection, payment method, and complete order summary for Roséva pure botanical skincare.">

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
        <!-- MAIN CHECKOUT CONTENT                          -->
        <!-- ============================================== -->
        <main class="flex-grow max-w-[1360px] w-full mx-auto px-6 sm:px-10 lg:px-16 py-6 sm:py-10">

            <!-- Breadcrumb Navigation -->
            <nav class="mb-6 font-arapey text-sm sm:text-base text-roseva-text/60 flex items-center gap-2"
                aria-label="Breadcrumb">
                <a href="index.jsp" class="hover:text-roseva-plum transition-colors">Home</a>
                <span>/</span>
                <span class="text-roseva-text font-medium">Checkout</span>
            </nav>

            <!-- Page Title & Divider -->
            <div class="mb-10">
                <h1
                    class="font-oranienbaum text-3xl sm:text-4xl lg:text-[42px] text-roseva-plum tracking-normal pb-4 border-b border-roseva-text/20">
                    Delivery &amp; Payment Information
                </h1>
            </div>


            <!-- ============================================== -->
            <!-- CHECKOUT GRID: FORM (LEFT) + SUMMARY (RIGHT)   -->
            <!-- ============================================== -->
            <div class="grid grid-cols-1 lg:grid-cols-12 gap-10 lg:gap-16 items-start">

                <!-- LEFT COLUMN: FORM CONTAINER (#EFEBE9) -->
                <div class="lg:col-span-7 bg-[#EFEBE9] rounded-2xl p-6 sm:p-10 shadow-sm">

                    <!-- 1. Contact Information -->
                    <div class="mb-8">
                        <h2 class="font-oranienbaum text-2xl text-roseva-plum mb-4">
                            Contact Information
                        </h2>
                        <div class="space-y-4 font-quicksand text-xs sm:text-sm">
                            <div>
                                <label for="checkoutEmail" class="block text-roseva-text/80 mb-1.5">Email:</label>
                                <input type="email" id="checkoutEmail" placeholder="Enter your email"
                                    class="w-full px-4 py-3 bg-white border border-[#D5CFC3] rounded-md text-roseva-text placeholder-roseva-text/40 focus:outline-none focus:border-roseva-plum transition-colors shadow-sm" />
                            </div>
                            <div>
                                <label for="checkoutPhone" class="block text-roseva-text/80 mb-1.5">Contact
                                    Number:</label>
                                <input type="tel" id="checkoutPhone" placeholder="Your phone number"
                                    class="w-full px-4 py-3 bg-white border border-[#D5CFC3] rounded-md text-roseva-text placeholder-roseva-text/40 focus:outline-none focus:border-roseva-plum transition-colors shadow-sm" />
                            </div>
                        </div>
                    </div>

                    <!-- 2. Delivery Details -->
                    <div class="mb-8">
                        <h2 class="font-oranienbaum text-2xl text-roseva-plum mb-4">
                            Delivery Details
                        </h2>
                        <div class="space-y-4 font-quicksand text-xs sm:text-sm">
                            <!-- First & Last Name -->
                            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                                <div>
                                    <label for="firstName" class="block text-roseva-text/80 mb-1.5">First Name:</label>
                                    <input type="text" id="firstName" placeholder="First Name"
                                        class="w-full px-4 py-3 bg-white border border-[#D5CFC3] rounded-md text-roseva-text placeholder-roseva-text/40 focus:outline-none focus:border-roseva-plum transition-colors shadow-sm" />
                                </div>
                                <div>
                                    <label for="lastName" class="block text-roseva-text/80 mb-1.5">Last Name:</label>
                                    <input type="text" id="lastName" placeholder="Last Name"
                                        class="w-full px-4 py-3 bg-white border border-[#D5CFC3] rounded-md text-roseva-text placeholder-roseva-text/40 focus:outline-none focus:border-roseva-plum transition-colors shadow-sm" />
                                </div>
                            </div>

                            <!-- Street Address -->
                            <div>
                                <label for="streetAddress" class="block text-roseva-text/80 mb-1.5">Street
                                    Address:</label>
                                <input type="text" id="streetAddress" placeholder="house, road, area"
                                    class="w-full px-4 py-3 bg-white border border-[#D5CFC3] rounded-md text-roseva-text placeholder-roseva-text/40 focus:outline-none focus:border-roseva-plum transition-colors shadow-sm" />
                            </div>

                            <!-- District & City Dropdown -->
                            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 items-start">
                                <div>
                                    <label for="district" class="block text-roseva-text/80 mb-1.5">District:</label>
                                    <input type="text" id="district" value="dhaka"
                                        class="w-full px-4 py-3 bg-white border border-[#D5CFC3] rounded-md text-roseva-text placeholder-roseva-text/40 focus:outline-none focus:border-roseva-plum transition-colors shadow-sm" />
                                </div>

                                <!-- Custom City Dropdown (Matches Image 3) -->
                                <div class="relative">
                                    <label class="block text-roseva-text/80 mb-1.5">City:</label>
                                    <button type="button" id="cityDropdownBtn"
                                        class="w-full px-4 py-3 bg-white border border-[#D5CFC3] rounded-md text-roseva-text flex items-center justify-between focus:outline-none focus:border-roseva-plum transition-colors shadow-sm">
                                        <span id="selectedCityLabel" class="lowercase">dhaka</span>
                                        <svg id="cityDropdownArrow"
                                            class="w-4 h-4 text-roseva-text/60 transition-transform duration-200"
                                            fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M19 9l-7 7-7-7" />
                                        </svg>
                                    </button>

                                    <!-- City Dropdown Menu (Matches list-group in Image 3) -->
                                    <div id="cityDropdownMenu"
                                        class="dropdown-menu hidden absolute left-0 right-0 mt-2 bg-white rounded-xl shadow-2xl border border-[#E5E0D8] z-50 overflow-hidden">
                                        <div
                                            class="divide-y divide-[#EFE9E0] text-center font-quicksand text-base text-roseva-text">
                                            <button type="button" onclick="selectCity('Dhaka')"
                                                class="w-full py-3 hover:text-roseva-plum hover:bg-[#FDFBF7] transition-colors focus:outline-none">Dhaka</button>
                                            <button type="button" onclick="selectCity('Chittagong')"
                                                class="w-full py-3 hover:text-roseva-plum hover:bg-[#FDFBF7] transition-colors focus:outline-none">Chittagong</button>
                                            <button type="button" onclick="selectCity('Rajshahi')"
                                                class="w-full py-3 hover:text-roseva-plum hover:bg-[#FDFBF7] transition-colors focus:outline-none">Rajshahi</button>
                                            <button type="button" onclick="selectCity('Khulna')"
                                                class="w-full py-3 hover:text-roseva-plum hover:bg-[#FDFBF7] transition-colors focus:outline-none">Khulna</button>
                                            <button type="button" onclick="selectCity('Barishal')"
                                                class="w-full py-3 hover:text-roseva-plum hover:bg-[#FDFBF7] transition-colors focus:outline-none">Barishal</button>
                                            <button type="button" onclick="selectCity('Sylhet')"
                                                class="w-full py-3 hover:text-roseva-plum hover:bg-[#FDFBF7] transition-colors focus:outline-none">Sylhet</button>
                                            <button type="button" onclick="selectCity('Rangpur')"
                                                class="w-full py-3 hover:text-roseva-plum hover:bg-[#FDFBF7] transition-colors focus:outline-none">Rangpur</button>
                                            <button type="button" onclick="selectCity('Mymensingh')"
                                                class="w-full py-3 hover:text-roseva-plum hover:bg-[#FDFBF7] transition-colors focus:outline-none">Mymensingh</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 3. Payment Method -->
                    <div>
                        <h2 class="font-oranienbaum text-2xl text-roseva-plum mb-4">
                            Payment Method
                        </h2>
                        <div class="space-y-3 font-quicksand text-xs sm:text-sm mb-5">
                            <label class="flex items-center gap-3 cursor-pointer select-none">
                                <input type="radio" name="paymentMethod" value="bkash" checked
                                    class="w-4 h-4 text-roseva-plum accent-roseva-plum cursor-pointer" />
                                <span class="text-roseva-text/90 font-medium">Local Payment Method (bkash/nagad)</span>
                            </label>
                            <label class="flex items-center gap-3 cursor-pointer select-none">
                                <input type="radio" name="paymentMethod" value="cod"
                                    class="w-4 h-4 text-roseva-plum accent-roseva-plum cursor-pointer" />
                                <span class="text-roseva-text/90">Cash On Delivery</span>
                            </label>
                            <label class="flex items-center gap-3 cursor-pointer select-none">
                                <input type="radio" name="paymentMethod" value="card"
                                    class="w-4 h-4 text-roseva-plum accent-roseva-plum cursor-pointer" />
                                <span class="text-roseva-text/90">Credit or Debit Card</span>
                            </label>
                        </div>

                        <!-- Payment Card Inputs -->
                        <div class="space-y-4 font-quicksand text-xs sm:text-sm">
                            <input type="text" placeholder="Account Holder's Name"
                                class="w-full px-4 py-3 bg-white border border-[#D5CFC3] rounded-md text-roseva-text placeholder-roseva-text/40 focus:outline-none focus:border-roseva-plum transition-colors shadow-sm" />
                            <input type="text" placeholder="Card Number"
                                class="w-full px-4 py-3 bg-white border border-[#D5CFC3] rounded-md text-roseva-text placeholder-roseva-text/40 focus:outline-none focus:border-roseva-plum transition-colors shadow-sm" />
                            <div class="grid grid-cols-2 gap-4">
                                <input type="text" placeholder="Expiry Date"
                                    class="w-full px-4 py-3 bg-white border border-[#D5CFC3] rounded-md text-roseva-text placeholder-roseva-text/40 focus:outline-none focus:border-roseva-plum transition-colors shadow-sm" />
                                <input type="text" placeholder="CVC"
                                    class="w-full px-4 py-3 bg-white border border-[#D5CFC3] rounded-md text-roseva-text placeholder-roseva-text/40 focus:outline-none focus:border-roseva-plum transition-colors shadow-sm" />
                            </div>
                        </div>
                    </div>

                </div>


                <!-- RIGHT COLUMN: ORDER DETAILS & SUMMARY -->
                <div class="lg:col-span-5 flex flex-col justify-start">

                    <!-- Order Details List -->
                    <div class="mb-10">
                        <h2 class="font-oranienbaum text-2xl text-roseva-plum mb-6 text-right lg:text-right">
                            Order Details
                        </h2>

                        <div class="space-y-6 font-quicksand text-sm">
                            <!-- Item 1 -->
                            <div class="flex items-baseline justify-between gap-4">
                                <div class="leading-relaxed">
                                    <span class="font-medium text-roseva-text block">1. Roséva Glow Restore</span>
                                    <span class="text-xs text-roseva-text/60">(320ml) &nbsp; x 3</span>
                                </div>
                                <span class="font-semibold text-roseva-text text-base">$105</span>
                            </div>

                            <!-- Item 2 -->
                            <div class="flex items-baseline justify-between gap-4">
                                <div class="leading-relaxed">
                                    <span class="font-medium text-roseva-text block">2. Roséva Skin Renewal</span>
                                    <span class="text-xs text-roseva-text/60">(60ml) &nbsp;&nbsp; x 1</span>
                                </div>
                                <span class="font-semibold text-roseva-text text-base">$40</span>
                            </div>

                            <!-- Item 3 -->
                            <div class="flex items-baseline justify-between gap-4">
                                <div class="leading-relaxed">
                                    <span class="font-medium text-roseva-text block">3. Roséva Cloud Drench</span>
                                    <span class="text-xs text-roseva-text/60">(250ml) &nbsp; x 5</span>
                                </div>
                                <span class="font-semibold text-roseva-text text-base">$75</span>
                            </div>
                        </div>
                    </div>

                    <!-- Checkout Summary -->
                    <div class="mb-10">
                        <h2 class="font-oranienbaum text-2xl text-roseva-plum mb-6 text-right lg:text-right">
                            Checkout Summary
                        </h2>

                        <div class="space-y-3 font-quicksand text-sm text-roseva-text/80">
                            <div class="flex items-center justify-between">
                                <span>3 Items</span>
                                <span class="font-semibold text-roseva-text">$220</span>
                            </div>
                            <div class="flex items-center justify-between">
                                <span>Shipping fee*</span>
                                <span class="font-semibold text-roseva-text">$5</span>
                            </div>
                            <div class="flex items-center justify-between">
                                <span>Discount</span>
                                <span class="font-semibold text-roseva-text">$10</span>
                            </div>
                            <div
                                class="border-t border-roseva-text/20 pt-3 flex items-center justify-between font-bold text-base text-roseva-text">
                                <span>Total</span>
                                <span class="font-oranienbaum text-xl text-roseva-text">$215</span>
                            </div>
                        </div>
                    </div>

                    <!-- Confirm Order CTA -->
                    <div class="flex justify-end">
                        <button type="button" onclick="confirmOrder()"
                            class="bg-roseva-plum hover:bg-[#100C08] text-white font-manrope font-semibold text-sm sm:text-base px-8 py-3 rounded-lg shadow-md hover:shadow-lg transition-all duration-300 transform hover:-translate-y-0.5">
                            Confirm Order
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
            // City Dropdown Handler
            document.addEventListener('DOMContentLoaded', () => {
                const cityBtn = document.getElementById('cityDropdownBtn');
                const cityMenu = document.getElementById('cityDropdownMenu');
                const cityArrow = document.getElementById('cityDropdownArrow');

                if (cityBtn && cityMenu) {
                    cityBtn.addEventListener('click', (e) => {
                        e.stopPropagation();
                        cityMenu.classList.toggle('hidden');
                        if (cityArrow) cityArrow.classList.toggle('rotate-180');
                    });

                    document.addEventListener('click', (e) => {
                        if (!cityMenu.contains(e.target) && !cityBtn.contains(e.target)) {
                            cityMenu.classList.add('hidden');
                            if (cityArrow) cityArrow.classList.remove('rotate-180');
                        }
                    });
                }
            });

            function selectCity(cityName) {
                const label = document.getElementById('selectedCityLabel');
                if (label) {
                    label.innerText = cityName.toLowerCase();
                }
                const cityMenu = document.getElementById('cityDropdownMenu');
                const cityArrow = document.getElementById('cityDropdownArrow');
                if (cityMenu) cityMenu.classList.add('hidden');
                if (cityArrow) cityArrow.classList.remove('rotate-180');
            }

            function confirmOrder() {
                alert('Order #RSV-2026-8941 placed successfully! Redirecting to your profile dashboard...');
                window.location.href = 'profile.jsp';
            }
        </script>
    </body>

    </html>