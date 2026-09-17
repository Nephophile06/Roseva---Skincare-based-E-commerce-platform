<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en" class="scroll-smooth">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Profile — Tousif Tasrik | Roséva Skincare Transparency Dashboard</title>
        <meta name="description"
            content="Manage your Roséva account details, track live orders, and personalize your clinical skin profile diagnostics.">

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
        <!-- MAIN PROFILE CONTENT                           -->
        <!-- ============================================== -->
        <main class="flex-grow max-w-[1360px] w-full mx-auto px-6 sm:px-10 lg:px-16 py-6 sm:py-10">

            <!-- Breadcrumb Navigation -->
            <nav class="mb-6 font-arapey text-sm sm:text-base text-roseva-text/60 flex items-center gap-2"
                aria-label="Breadcrumb">
                <a href="index.jsp" class="hover:text-roseva-plum transition-colors">Home</a>
                <span>/</span>
                <span class="text-roseva-text font-medium">My Profile</span>
            </nav>

            <!-- Welcome Greeting Banner -->
            <div class="mb-10">
                <h1 id="profileGreetingName"
                    class="font-oranienbaum text-3xl sm:text-4xl lg:text-[44px] text-roseva-plum tracking-normal mb-2">
                    Hello, Tousif Tasrik!
                </h1>
                <p class="font-quicksand text-base sm:text-lg text-roseva-text/85">
                    Welcome back to your skin transparency dashboard.
                </p>
            </div>


            <!-- ============================================== -->
            <!-- 1. ACCOUNT DETAILS SECTION                     -->
            <!-- ============================================== -->
            <section class="mb-14">
                <h2
                    class="font-oranienbaum text-2xl sm:text-3xl text-roseva-plum pb-3 border-b border-roseva-text/20 mb-6">
                    Account Details
                </h2>

                <div class="max-w-xl space-y-4 font-quicksand text-xs sm:text-sm">
                    <!-- Name -->
                    <div>
                        <label class="block text-roseva-text/80 mb-1.5">Name:</label>
                        <input type="text" id="profileInputName" value="Tousif Tasrik"
                            class="w-full px-4 py-3 bg-white border border-[#D5CFC3] rounded-md text-roseva-text focus:outline-none focus:border-roseva-plum transition-colors shadow-sm" />
                    </div>

                    <!-- Email -->
                    <div>
                        <label class="block text-roseva-text/80 mb-1.5">Email:</label>
                        <input type="email" id="profileInputEmail" value="tousif.tasrik@roseva.com"
                            class="w-full px-4 py-3 bg-white border border-[#D5CFC3] rounded-md text-roseva-text focus:outline-none focus:border-roseva-plum transition-colors shadow-sm" />
                    </div>

                    <!-- Address -->
                    <div>
                        <label class="block text-roseva-text/80 mb-1.5">Address:</label>
                        <input type="text" value="house, road, area"
                            class="w-full px-4 py-3 bg-white border border-[#D5CFC3] rounded-md text-roseva-text focus:outline-none focus:border-roseva-plum transition-colors shadow-sm" />
                    </div>

                    <!-- Contact Number -->
                    <div>
                        <label class="block text-roseva-text/80 mb-1.5">Contact Number:</label>
                        <input type="tel" value="Your Phone Number"
                            class="w-full px-4 py-3 bg-white border border-[#D5CFC3] rounded-md text-roseva-text focus:outline-none focus:border-roseva-plum transition-colors shadow-sm" />
                    </div>

                    <!-- Gender Radio Options -->
                    <div class="pt-2 flex items-center gap-6">
                        <span class="text-roseva-text/80">Gender:</span>
                        <label class="flex items-center gap-2 cursor-pointer select-none">
                            <input type="radio" name="profileGender" value="male"
                                class="w-4 h-4 text-roseva-plum accent-roseva-plum cursor-pointer" />
                            <span>Male</span>
                        </label>
                        <label class="flex items-center gap-2 cursor-pointer select-none">
                            <input type="radio" name="profileGender" value="female"
                                class="w-4 h-4 text-roseva-plum accent-roseva-plum cursor-pointer" />
                            <span>Female</span>
                        </label>
                    </div>

                    <!-- Action Buttons -->
                    <div class="pt-4 flex items-center gap-4">
                        <button type="button" onclick="alert('Profile information updated successfully!')"
                            class="bg-roseva-plum hover:bg-[#100C08] text-white font-manrope font-semibold text-sm px-5 py-2 rounded-lg shadow-sm transition-all">
                            Edit Information
                        </button>
                        <button type="button" onclick="alert('Password reset link sent to your email.')"
                            class="bg-roseva-plum hover:bg-[#100C08] text-white font-manrope font-semibold text-sm px-5 py-2 rounded-lg shadow-sm transition-all">
                            Change Password
                        </button>
                    </div>
                </div>
            </section>


            <!-- ============================================== -->
            <!-- 2. ORDER HISTORY SECTION                       -->
            <!-- ============================================== -->
            <section class="mb-14">
                <h2
                    class="font-oranienbaum text-2xl sm:text-3xl text-roseva-plum pb-3 border-b border-roseva-text/20 mb-6">
                    Order History
                </h2>

                <!-- Status Banner Ribbon (#EFEBE9) -->
                <div
                    class="bg-[#EFEBE9] rounded-lg px-6 py-4 flex items-center justify-between text-xs sm:text-sm font-quicksand font-medium text-roseva-text/90 mb-6 shadow-sm">
                    <span class="text-roseva-plum font-semibold">On Shipping - 1</span>
                    <span>Arrived - 0</span>
                    <span>Canceled - 0</span>
                </div>

                <!-- Active Order Details Box -->
                <div class="space-y-3 font-quicksand text-xs sm:text-sm text-roseva-text/85">
                    <div class="flex items-center gap-4">
                        <span class="font-medium text-roseva-text">Order ID:</span>
                        <span class="font-manrope font-semibold text-roseva-plum">#RSV-2026-8941</span>
                    </div>
                    <div class="flex items-center gap-4">
                        <span class="font-medium text-roseva-text">Date &amp; Status:</span>
                        <span>July 04, 2026 | <strong class="text-roseva-plum">In Transit</strong></span>
                    </div>
                    <div class="flex items-center gap-4">
                        <span class="font-medium text-roseva-text">Total Amount:</span>
                        <span class="font-bold text-roseva-text">$215 | 3 Items</span>
                    </div>

                    <div class="pt-2">
                        <button type="button"
                            onclick="alert('Tracking Order #RSV-2026-8941: Package is currently in transit with Dhaka Central Logistics Courier.')"
                            class="bg-roseva-plum hover:bg-[#100C08] text-white font-manrope font-semibold text-sm px-5 py-2 rounded-lg shadow-sm transition-all">
                            Track My Order
                        </button>
                    </div>
                </div>
            </section>


            <!-- ============================================== -->
            <!-- 3. SKIN PROFILE & PERSONALIZATION SECTION      -->
            <!-- ============================================== -->
            <section class="mb-10">
                <h2
                    class="font-oranienbaum text-2xl sm:text-3xl text-roseva-plum pb-3 border-b border-roseva-text/20 mb-6">
                    Skin Profile &amp; Personalization
                </h2>

                <!-- 2-Column Diagnostics Grid -->
                <div
                    class="grid grid-cols-1 md:grid-cols-2 gap-x-12 gap-y-8 font-quicksand text-xs sm:text-sm text-roseva-text/85">

                    <!-- 1. Skin Barrier Health -->
                    <div>
                        <h3 class="font-bold text-roseva-text mb-3 text-sm">Skin Barrier Health:</h3>
                        <div class="space-y-2">
                            <label class="flex items-center gap-2.5 cursor-pointer">
                                <input type="radio" name="skinBarrier" value="healthy"
                                    class="w-4 h-4 text-roseva-plum accent-roseva-plum cursor-pointer" />
                                <span>Healthy</span>
                            </label>
                            <label class="flex items-center gap-2.5 cursor-pointer">
                                <input type="radio" name="skinBarrier" value="compromised" checked
                                    class="w-4 h-4 text-roseva-plum accent-roseva-plum cursor-pointer" />
                                <span>Compromised</span>
                            </label>
                            <label class="flex items-center gap-2.5 cursor-pointer">
                                <input type="radio" name="skinBarrier" value="damaged"
                                    class="w-4 h-4 text-roseva-plum accent-roseva-plum cursor-pointer" />
                                <span>Damaged</span>
                            </label>
                        </div>
                    </div>

                    <!-- 2. Hydration Levels / TEWL -->
                    <div>
                        <h3 class="font-bold text-roseva-text mb-3 text-sm">Hydration Levels / TEWL:</h3>
                        <div class="space-y-2">
                            <label class="flex items-center gap-2.5 cursor-pointer">
                                <input type="radio" name="skinHydration" value="optimal"
                                    class="w-4 h-4 text-roseva-plum accent-roseva-plum cursor-pointer" />
                                <span>Optimal</span>
                            </label>
                            <label class="flex items-center gap-2.5 cursor-pointer">
                                <input type="radio" name="skinHydration" value="dehydrated" checked
                                    class="w-4 h-4 text-roseva-plum accent-roseva-plum cursor-pointer" />
                                <span>Dehydrated</span>
                            </label>
                            <label class="flex items-center gap-2.5 cursor-pointer">
                                <input type="radio" name="skinHydration" value="severely-parched"
                                    class="w-4 h-4 text-roseva-plum accent-roseva-plum cursor-pointer" />
                                <span>Severely Parched</span>
                            </label>
                        </div>
                    </div>

                    <!-- 3. Skin Sensitivity & Reactivity -->
                    <div>
                        <h3 class="font-bold text-roseva-text mb-3 text-sm">Skin Sensitivity &amp; Reactivity:</h3>
                        <div class="space-y-2">
                            <label class="flex items-center gap-2.5 cursor-pointer">
                                <input type="radio" name="skinSensitivity" value="resilient"
                                    class="w-4 h-4 text-roseva-plum accent-roseva-plum cursor-pointer" />
                                <span>Resilient</span>
                            </label>
                            <label class="flex items-center gap-2.5 cursor-pointer">
                                <input type="radio" name="skinSensitivity" value="mildly-sensitive" checked
                                    class="w-4 h-4 text-roseva-plum accent-roseva-plum cursor-pointer" />
                                <span>Mildly Sensitive</span>
                            </label>
                            <label class="flex items-center gap-2.5 cursor-pointer">
                                <input type="radio" name="skinSensitivity" value="hypersensitive"
                                    class="w-4 h-4 text-roseva-plum accent-roseva-plum cursor-pointer" />
                                <span>Hypersensitive</span>
                            </label>
                        </div>
                    </div>

                    <!-- 4. Pore & Sebum Profile -->
                    <div>
                        <h3 class="font-bold text-roseva-text mb-3 text-sm">Pore &amp; Sebum Profile:</h3>
                        <div class="space-y-2">
                            <label class="flex items-center gap-2.5 cursor-pointer">
                                <input type="radio" name="skinSebum" value="clear"
                                    class="w-4 h-4 text-roseva-plum accent-roseva-plum cursor-pointer" />
                                <span>Clear</span>
                            </label>
                            <label class="flex items-center gap-2.5 cursor-pointer">
                                <input type="radio" name="skinSebum" value="congested"
                                    class="w-4 h-4 text-roseva-plum accent-roseva-plum cursor-pointer" />
                                <span>Congested</span>
                            </label>
                            <label class="flex items-center gap-2.5 cursor-pointer">
                                <input type="radio" name="skinSebum" value="enlarged-pores"
                                    class="w-4 h-4 text-roseva-plum accent-roseva-plum cursor-pointer" />
                                <span>Enlarged Pores</span>
                            </label>
                            <label class="flex items-center gap-2.5 cursor-pointer">
                                <input type="radio" name="skinSebum" value="high-sebum" checked
                                    class="w-4 h-4 text-roseva-plum accent-roseva-plum cursor-pointer" />
                                <span>High Sebum (T-Zone)</span>
                            </label>
                        </div>
                    </div>

                    <!-- 5. Environmental & Lifecycle Stressors -->
                    <div>
                        <h3 class="font-bold text-roseva-text mb-3 text-sm">Environmental &amp; Lifecycle Stressors:
                        </h3>
                        <div class="space-y-2">
                            <label class="flex items-center gap-2.5 cursor-pointer">
                                <input type="checkbox" name="stressor" value="uv" checked
                                    class="w-4 h-4 text-roseva-plum accent-roseva-plum cursor-pointer" />
                                <span>High UV Exposure</span>
                            </label>
                            <label class="flex items-center gap-2.5 cursor-pointer">
                                <input type="checkbox" name="stressor" value="bluelight" checked
                                    class="w-4 h-4 text-roseva-plum accent-roseva-plum cursor-pointer" />
                                <span>Blue Light Stress (Screen Time)</span>
                            </label>
                            <label class="flex items-center gap-2.5 cursor-pointer">
                                <input type="checkbox" name="stressor" value="hardwater"
                                    class="w-4 h-4 text-roseva-plum accent-roseva-plum cursor-pointer" />
                                <span>Hard Water Damage</span>
                            </label>
                            <label class="flex items-center gap-2.5 cursor-pointer">
                                <input type="checkbox" name="stressor" value="pollution" checked
                                    class="w-4 h-4 text-roseva-plum accent-roseva-plum cursor-pointer" />
                                <span>Pollution Heavy</span>
                            </label>
                        </div>
                    </div>

                    <!-- 6. Other -->
                    <div>
                        <h3 class="font-bold text-roseva-text mb-3 text-sm">Other:</h3>
                        <div class="relative">
                            <textarea id="skinOtherText" rows="4" maxlength="200" oninput="updateCharCount(this)"
                                placeholder="Please specify..."
                                class="w-full p-3 bg-white border border-[#D5CFC3] rounded-md text-xs font-quicksand text-roseva-text placeholder-roseva-text/40 focus:outline-none focus:border-roseva-plum transition-colors shadow-sm"></textarea>
                            <span id="charCountLabel"
                                class="absolute right-2 bottom-2 text-[10px] text-roseva-text/50 font-manrope">
                                0/200
                            </span>
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
            function updateCharCount(textarea) {
                const countLabel = document.getElementById('charCountLabel');
                if (countLabel) {
                    countLabel.innerText = `${textarea.value.length}/200`;
                }
            }
        </script>
    </body>

    </html>