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
                    <a href="#wishlist"
                        class="relative py-1 after:absolute after:bottom-0 after:left-0 after:w-full after:h-0.5 after:bg-roseva-plum after:scale-x-0 hover:after:scale-x-100 after:transition-transform">Wishlist</a>
                    <a href="profile.jsp"
                        class="relative py-1 after:absolute after:bottom-0 after:left-0 after:w-full after:h-0.5 after:bg-roseva-plum after:scale-x-0 hover:after:scale-x-100 after:transition-transform">Tousif
                        Tasrik</a>
                </nav>

                <!-- Cart Action & Mobile Menu Toggle -->
                <div class="flex items-center gap-4 sm:gap-6">
                    <a href="cart.jsp"
                        class="relative p-1 text-roseva-plum transition-all duration-200 group focus:outline-none flex items-center justify-center"
                        aria-label="View Shopping Cart">
                        <img src="assets/cart icon.png" alt="Cart"
                            class="w-7 sm:w-8 h-7 sm:h-8 object-contain group-hover:scale-110 transition-transform duration-200" />
                        <span id="cartBadge"
                            class="absolute -top-1 -right-1 bg-roseva-plum text-white text-[10px] font-manrope font-bold rounded-full w-4 h-4 flex items-center justify-center shadow-sm">4</span>
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
                    <a href="profile.jsp" class="hover:text-roseva-plum transition-colors">Tousif Tasrik</a>
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
            <!-- SELECT ALL & DELETE CONTROL BAR               -->
            <!-- ============================================== -->
            <div class="bg-[#EFEBE9] rounded-xl px-6 py-4 flex items-center justify-between mb-8 shadow-sm">
                <label class="flex items-center gap-3 cursor-pointer select-none">
                    <input type="checkbox" id="selectAllCheckbox" checked onchange="toggleSelectAll(this)"
                        class="w-4 h-4 rounded border-[#D5CFC3] text-roseva-plum accent-roseva-plum focus:ring-0 cursor-pointer" />
                    <span class="font-quicksand text-xs sm:text-sm text-roseva-text/80">
                        Select All <span id="itemCountLabel" class="text-roseva-text/60">(4 Items)</span>
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


            <!-- ============================================== -->
            <!-- CART ITEMS TABLE / LIST                       -->
            <!-- ============================================== -->
            <div class="mb-10">
                <!-- Table Header Labels (Desktop) -->
                <div class="hidden md:grid grid-cols-12 gap-4 px-6 mb-3 font-oranienbaum text-lg text-roseva-text">
                    <div class="col-span-6">Product</div>
                    <div class="col-span-2 text-center">Price</div>
                    <div class="col-span-2 text-center">Quantity</div>
                    <div class="col-span-2 text-right">Subtotal</div>
                </div>

                <!-- Items Container -->
                <div id="cartItemsList" class="space-y-4">

                    <!-- ITEM 1: Roséva Glow Restore -->
                    <div class="cart-item-row bg-[#EFEBE9] rounded-xl p-4 sm:p-6 flex flex-col md:grid md:grid-cols-12 gap-4 items-center shadow-sm transition-all duration-200"
                        data-price="35" data-id="item-1">
                        <!-- Left: Checkbox + Product Image + Title/Size/Wishlist -->
                        <div class="w-full md:col-span-6 flex items-center gap-4">
                            <input type="checkbox" checked onchange="updateCartCalculations()"
                                class="item-checkbox w-4 h-4 rounded border-[#D5CFC3] text-roseva-plum accent-roseva-plum focus:ring-0 cursor-pointer flex-shrink-0" />
                            <div
                                class="w-16 h-16 sm:w-20 sm:h-20 rounded-lg overflow-hidden bg-white/70 border border-[#E0D7C9] flex-shrink-0">
                                <img src="assets/glow restore.png" alt="Roséva Glow Restore"
                                    class="w-full h-full object-cover">
                            </div>
                            <div class="flex flex-col gap-1">
                                <h3
                                    class="font-oranienbaum text-base sm:text-lg text-roseva-text font-medium leading-snug">
                                    Roséva Glow Restore
                                </h3>
                                <div class="flex items-center gap-3">
                                    <span class="font-quicksand text-xs text-roseva-text/60">(320ml)</span>
                                    <button type="button" onclick="toggleItemWishlist(this)"
                                        class="text-roseva-text/60 hover:text-roseva-plum transition-colors focus:outline-none"
                                        aria-label="Save to wishlist">
                                        <svg class="w-4 h-4 wishlist-heart" fill="none" stroke="currentColor"
                                            viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8"
                                                d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!-- Price -->
                        <div
                            class="w-full md:col-span-2 flex justify-between md:justify-center items-center font-quicksand text-sm sm:text-base font-semibold text-roseva-text">
                            <span class="md:hidden text-xs font-normal text-roseva-text/60">Price:</span>
                            <span>$35</span>
                        </div>

                        <!-- Quantity Controls: + 3 - -->
                        <div class="w-full md:col-span-2 flex justify-between md:justify-center items-center">
                            <span class="md:hidden text-xs font-normal text-roseva-text/60">Quantity:</span>
                            <div class="flex items-center gap-3 font-manrope text-sm font-medium text-roseva-text">
                                <button type="button" onclick="changeItemQty(this, 1)"
                                    class="w-6 h-6 flex items-center justify-center hover:text-roseva-plum transition-colors focus:outline-none text-base">+</button>
                                <span class="item-qty w-4 text-center font-semibold">3</span>
                                <button type="button" onclick="changeItemQty(this, -1)"
                                    class="w-6 h-6 flex items-center justify-center hover:text-roseva-plum transition-colors focus:outline-none text-base">-</button>
                            </div>
                        </div>

                        <!-- Subtotal -->
                        <div
                            class="w-full md:col-span-2 flex justify-between md:justify-end items-center font-quicksand text-sm sm:text-base font-bold text-roseva-text">
                            <span class="md:hidden text-xs font-normal text-roseva-text/60">Subtotal:</span>
                            <span class="item-subtotal">$105</span>
                        </div>
                    </div>

                    <!-- ITEM 2: Roséva Skin Renewal -->
                    <div class="cart-item-row bg-[#EFEBE9] rounded-xl p-4 sm:p-6 flex flex-col md:grid md:grid-cols-12 gap-4 items-center shadow-sm transition-all duration-200"
                        data-price="40" data-id="item-2">
                        <!-- Left: Checkbox + Product Image + Title/Size/Wishlist -->
                        <div class="w-full md:col-span-6 flex items-center gap-4">
                            <input type="checkbox" checked onchange="updateCartCalculations()"
                                class="item-checkbox w-4 h-4 rounded border-[#D5CFC3] text-roseva-plum accent-roseva-plum focus:ring-0 cursor-pointer flex-shrink-0" />
                            <div
                                class="w-16 h-16 sm:w-20 sm:h-20 rounded-lg overflow-hidden bg-white/70 border border-[#E0D7C9] flex-shrink-0">
                                <img src="assets/skin renewal.png" alt="Roséva Skin Renewal"
                                    class="w-full h-full object-cover">
                            </div>
                            <div class="flex flex-col gap-1">
                                <h3
                                    class="font-oranienbaum text-base sm:text-lg text-roseva-text font-medium leading-snug">
                                    Roséva Skin Renewal
                                </h3>
                                <div class="flex items-center gap-3">
                                    <span class="font-quicksand text-xs text-roseva-text/60">(60ml)</span>
                                    <button type="button" onclick="toggleItemWishlist(this)"
                                        class="text-roseva-text/60 hover:text-roseva-plum transition-colors focus:outline-none"
                                        aria-label="Save to wishlist">
                                        <svg class="w-4 h-4 wishlist-heart" fill="none" stroke="currentColor"
                                            viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8"
                                                d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!-- Price -->
                        <div
                            class="w-full md:col-span-2 flex justify-between md:justify-center items-center font-quicksand text-sm sm:text-base font-semibold text-roseva-text">
                            <span class="md:hidden text-xs font-normal text-roseva-text/60">Price:</span>
                            <span>$40</span>
                        </div>

                        <!-- Quantity Controls: + 1 - -->
                        <div class="w-full md:col-span-2 flex justify-between md:justify-center items-center">
                            <span class="md:hidden text-xs font-normal text-roseva-text/60">Quantity:</span>
                            <div class="flex items-center gap-3 font-manrope text-sm font-medium text-roseva-text">
                                <button type="button" onclick="changeItemQty(this, 1)"
                                    class="w-6 h-6 flex items-center justify-center hover:text-roseva-plum transition-colors focus:outline-none text-base">+</button>
                                <span class="item-qty w-4 text-center font-semibold">1</span>
                                <button type="button" onclick="changeItemQty(this, -1)"
                                    class="w-6 h-6 flex items-center justify-center hover:text-roseva-plum transition-colors focus:outline-none text-base">-</button>
                            </div>
                        </div>

                        <!-- Subtotal -->
                        <div
                            class="w-full md:col-span-2 flex justify-between md:justify-end items-center font-quicksand text-sm sm:text-base font-bold text-roseva-text">
                            <span class="md:hidden text-xs font-normal text-roseva-text/60">Subtotal:</span>
                            <span class="item-subtotal">$40</span>
                        </div>
                    </div>

                    <!-- ITEM 3: Roséva Hydro-Boost (Unchecked as in screenshot) -->
                    <div class="cart-item-row bg-[#EFEBE9] rounded-xl p-4 sm:p-6 flex flex-col md:grid md:grid-cols-12 gap-4 items-center shadow-sm transition-all duration-200"
                        data-price="20" data-id="item-3">
                        <!-- Left: Checkbox + Product Image + Title/Size/Wishlist -->
                        <div class="w-full md:col-span-6 flex items-center gap-4">
                            <input type="checkbox" onchange="updateCartCalculations()"
                                class="item-checkbox w-4 h-4 rounded border-[#D5CFC3] text-roseva-plum accent-roseva-plum focus:ring-0 cursor-pointer flex-shrink-0" />
                            <div
                                class="w-16 h-16 sm:w-20 sm:h-20 rounded-lg overflow-hidden bg-white/70 border border-[#E0D7C9] flex-shrink-0">
                                <img src="assets/hydro boost.png" alt="Roséva Hydro-Boost"
                                    class="w-full h-full object-cover">
                            </div>
                            <div class="flex flex-col gap-1">
                                <h3
                                    class="font-oranienbaum text-base sm:text-lg text-roseva-text font-medium leading-snug">
                                    Roséva Hydro-Boost
                                </h3>
                                <div class="flex items-center gap-3">
                                    <span class="font-quicksand text-xs text-roseva-text/60">(100ml)</span>
                                    <button type="button" onclick="toggleItemWishlist(this)"
                                        class="text-roseva-text/60 hover:text-roseva-plum transition-colors focus:outline-none"
                                        aria-label="Save to wishlist">
                                        <svg class="w-4 h-4 wishlist-heart" fill="none" stroke="currentColor"
                                            viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8"
                                                d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!-- Price -->
                        <div
                            class="w-full md:col-span-2 flex justify-between md:justify-center items-center font-quicksand text-sm sm:text-base font-semibold text-roseva-text">
                            <span class="md:hidden text-xs font-normal text-roseva-text/60">Price:</span>
                            <span>$20</span>
                        </div>

                        <!-- Quantity Controls: + 2 - -->
                        <div class="w-full md:col-span-2 flex justify-between md:justify-center items-center">
                            <span class="md:hidden text-xs font-normal text-roseva-text/60">Quantity:</span>
                            <div class="flex items-center gap-3 font-manrope text-sm font-medium text-roseva-text">
                                <button type="button" onclick="changeItemQty(this, 1)"
                                    class="w-6 h-6 flex items-center justify-center hover:text-roseva-plum transition-colors focus:outline-none text-base">+</button>
                                <span class="item-qty w-4 text-center font-semibold">2</span>
                                <button type="button" onclick="changeItemQty(this, -1)"
                                    class="w-6 h-6 flex items-center justify-center hover:text-roseva-plum transition-colors focus:outline-none text-base">-</button>
                            </div>
                        </div>

                        <!-- Subtotal -->
                        <div
                            class="w-full md:col-span-2 flex justify-between md:justify-end items-center font-quicksand text-sm sm:text-base font-bold text-roseva-text">
                            <span class="md:hidden text-xs font-normal text-roseva-text/60">Subtotal:</span>
                            <span class="item-subtotal">$40</span>
                        </div>
                    </div>

                    <!-- ITEM 4: Roséva Cloud Drench -->
                    <div class="cart-item-row bg-[#EFEBE9] rounded-xl p-4 sm:p-6 flex flex-col md:grid md:grid-cols-12 gap-4 items-center shadow-sm transition-all duration-200"
                        data-price="15" data-id="item-4">
                        <!-- Left: Checkbox + Product Image + Title/Size/Wishlist -->
                        <div class="w-full md:col-span-6 flex items-center gap-4">
                            <input type="checkbox" checked onchange="updateCartCalculations()"
                                class="item-checkbox w-4 h-4 rounded border-[#D5CFC3] text-roseva-plum accent-roseva-plum focus:ring-0 cursor-pointer flex-shrink-0" />
                            <div
                                class="w-16 h-16 sm:w-20 sm:h-20 rounded-lg overflow-hidden bg-white/70 border border-[#E0D7C9] flex-shrink-0">
                                <img src="assets/cloud drench.png" alt="Roséva Cloud Drench"
                                    class="w-full h-full object-cover">
                            </div>
                            <div class="flex flex-col gap-1">
                                <h3
                                    class="font-oranienbaum text-base sm:text-lg text-roseva-text font-medium leading-snug">
                                    Roséva Cloud Drench
                                </h3>
                                <div class="flex items-center gap-3">
                                    <span class="font-quicksand text-xs text-roseva-text/60">(250ml)</span>
                                    <button type="button" onclick="toggleItemWishlist(this)"
                                        class="text-roseva-text/60 hover:text-roseva-plum transition-colors focus:outline-none"
                                        aria-label="Save to wishlist">
                                        <svg class="w-4 h-4 wishlist-heart" fill="none" stroke="currentColor"
                                            viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8"
                                                d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!-- Price -->
                        <div
                            class="w-full md:col-span-2 flex justify-between md:justify-center items-center font-quicksand text-sm sm:text-base font-semibold text-roseva-text">
                            <span class="md:hidden text-xs font-normal text-roseva-text/60">Price:</span>
                            <span>$15</span>
                        </div>

                        <!-- Quantity Controls: + 5 - -->
                        <div class="w-full md:col-span-2 flex justify-between md:justify-center items-center">
                            <span class="md:hidden text-xs font-normal text-roseva-text/60">Quantity:</span>
                            <div class="flex items-center gap-3 font-manrope text-sm font-medium text-roseva-text">
                                <button type="button" onclick="changeItemQty(this, 1)"
                                    class="w-6 h-6 flex items-center justify-center hover:text-roseva-plum transition-colors focus:outline-none text-base">+</button>
                                <span class="item-qty w-4 text-center font-semibold">5</span>
                                <button type="button" onclick="changeItemQty(this, -1)"
                                    class="w-6 h-6 flex items-center justify-center hover:text-roseva-plum transition-colors focus:outline-none text-base">-</button>
                            </div>
                        </div>

                        <!-- Subtotal -->
                        <div
                            class="w-full md:col-span-2 flex justify-between md:justify-end items-center font-quicksand text-sm sm:text-base font-bold text-roseva-text">
                            <span class="md:hidden text-xs font-normal text-roseva-text/60">Subtotal:</span>
                            <span class="item-subtotal">$75</span>
                        </div>
                    </div>

                </div>
            </div>


            <!-- ============================================== -->
            <!-- BOTTOM ACTIONS & CHECKOUT                      -->
            <!-- ============================================== -->
            <div class="flex flex-col sm:flex-row items-center justify-between gap-6 pt-4">
                <a href="products.jsp"
                    class="font-quicksand text-sm text-roseva-text/75 hover:text-roseva-plum underline transition-colors inline-flex items-center gap-2">
                    <span>&larr;</span> Continue Shopping
                </a>

                <div class="flex items-center gap-6">
                    <div class="text-right hidden sm:block">
                        <span class="text-xs text-roseva-text/60 block font-quicksand">Selected Total:</span>
                        <span id="selectedTotalAmount"
                            class="font-oranienbaum text-2xl text-roseva-text font-bold">$220</span>
                    </div>
                    <button type="button" onclick="proceedToCheckout()"
                        class="bg-roseva-plum hover:bg-[#100C08] text-white font-manrope font-semibold text-sm sm:text-base px-7 py-3 rounded-lg shadow-md hover:shadow-lg transition-all duration-300 transform hover:-translate-y-0.5">
                        Proceed to Checkout
                    </button>
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
            // Quantity Adjustment for Cart Items
            function changeItemQty(btn, delta) {
                const row = btn.closest('.cart-item-row');
                if (!row) return;

                const qtyEl = row.querySelector('.item-qty');
                const subtotalEl = row.querySelector('.item-subtotal');
                const price = parseFloat(row.getAttribute('data-price')) || 0;

                let currentQty = parseInt(qtyEl.innerText, 10) || 1;
                currentQty = Math.max(1, currentQty + delta);
                qtyEl.innerText = currentQty;

                const subtotal = currentQty * price;
                subtotalEl.innerText = `$${subtotal}`;

                updateCartCalculations();
            }

            // Toggle Select All Checkboxes
            function toggleSelectAll(selectAllCheckbox) {
                const checkboxes = document.querySelectorAll('.item-checkbox');
                checkboxes.forEach(cb => {
                    cb.checked = selectAllCheckbox.checked;
                });
                updateCartCalculations();
            }

            // Update Total Summary and Select All status
            function updateCartCalculations() {
                const rows = document.querySelectorAll('.cart-item-row');
                const checkboxes = document.querySelectorAll('.item-checkbox');
                const selectAll = document.getElementById('selectAllCheckbox');
                const countLabel = document.getElementById('itemCountLabel');
                const totalAmountEl = document.getElementById('selectedTotalAmount');

                let totalSelectedPrice = 0;
                let totalCheckedCount = 0;

                rows.forEach(row => {
                    const cb = row.querySelector('.item-checkbox');
                    const qty = parseInt(row.querySelector('.item-qty').innerText, 10) || 1;
                    const price = parseFloat(row.getAttribute('data-price')) || 0;

                    if (cb && cb.checked) {
                        totalSelectedPrice += (qty * price);
                        totalCheckedCount++;
                    }
                });

                if (selectAll) {
                    selectAll.checked = checkboxes.length > 0 && totalCheckedCount === checkboxes.length;
                }

                if (countLabel) {
                    countLabel.innerText = `(${rows.length} Items)`;
                }

                if (totalAmountEl) {
                    totalAmountEl.innerText = `$${totalSelectedPrice}`;
                }

                const badge = document.getElementById('cartBadge');
                if (badge) {
                    badge.innerText = rows.length;
                }
            }

            // Delete Selected Items
            function deleteSelectedItems() {
                const checkedBoxes = document.querySelectorAll('.item-checkbox:checked');
                if (checkedBoxes.length === 0) {
                    alert('Please select at least one item to delete.');
                    return;
                }

                checkedBoxes.forEach(cb => {
                    const row = cb.closest('.cart-item-row');
                    if (row) {
                        row.remove();
                    }
                });

                updateCartCalculations();
            }

            // Toggle Item Wishlist icon
            function toggleItemWishlist(btn) {
                const heart = btn.querySelector('.wishlist-heart');
                if (heart) {
                    heart.classList.toggle('text-roseva-plum');
                    heart.classList.toggle('fill-current');
                }
            }

            // Checkout Action
            function proceedToCheckout() {
                const checked = document.querySelectorAll('.item-checkbox:checked');
                if (checked.length === 0) {
                    alert('Please select at least one item to proceed.');
                    return;
                }
                window.location.href = 'checkout.jsp';
            }

            // Initial calculation on load
            document.addEventListener('DOMContentLoaded', updateCartCalculations);
        </script>
    </body>

    </html>