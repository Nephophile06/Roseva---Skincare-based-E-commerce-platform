<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page
        import="com.roseva.dao.OrderDao,com.roseva.dao.PaymentDao,com.roseva.dao.CartDao,com.roseva.dao.ProductDao,com.roseva.model.Order,com.roseva.model.OrderItem,com.roseva.model.PaymentDetails,com.roseva.model.CartItem,com.roseva.model.Product,java.math.BigDecimal,java.sql.Timestamp,java.util.List,java.util.ArrayList"
        %>
        <% String action=request.getParameter("action"); if (action==null || action.trim().isEmpty()) { action="create"
            ; } OrderDao orderDao=new OrderDao(); PaymentDao paymentDao=new PaymentDao(); CartDao cartDao=new CartDao();
            ProductDao productDao=new ProductDao(); if ("create".equalsIgnoreCase(action)) { String
            userEmail=request.getParameter("userEmail"); String firstName=request.getParameter("firstName"); String
            lastName=request.getParameter("lastName"); String phone=request.getParameter("phone"); String
            streetAddress=request.getParameter("streetAddress"); String district=request.getParameter("district");
            String city=request.getParameter("city"); String paymentMethod=request.getParameter("paymentMethod"); String
            accountHolder=request.getParameter("accountHolderName"); String
            cardNumber=request.getParameter("cardNumber"); String cardExpiry=request.getParameter("cardExpiry"); String
            cardCvc=request.getParameter("cardCvc"); String subtotalStr=request.getParameter("subtotal"); String
            shippingStr=request.getParameter("shippingFee"); String discountStr=request.getParameter("discount"); String
            totalStr=request.getParameter("totalAmount"); long randomNum=1000 + (long)(Math.random() * 9000); String
            orderCode="RSV-2026-" + randomNum; String cardLast4="" ; if (cardNumber !=null &&
            cardNumber.trim().length()>= 4) {
            String c = cardNumber.trim();
            cardLast4 = c.substring(c.length() - 4);
            }

            BigDecimal subtotal = BigDecimal.ZERO;
            BigDecimal shipping = new BigDecimal("10.00");
            BigDecimal discount = BigDecimal.ZERO;
            BigDecimal total = BigDecimal.ZERO;

            try {
            if (subtotalStr != null && !subtotalStr.trim().isEmpty()) {
            subtotal = new BigDecimal(subtotalStr.trim());
            }
            if (shippingStr != null && !shippingStr.trim().isEmpty()) {
            shipping = new BigDecimal(shippingStr.trim());
            }
            if (discountStr != null && !discountStr.trim().isEmpty()) {
            discount = new BigDecimal(discountStr.trim());
            }
            if (totalStr != null && !totalStr.trim().isEmpty()) {
            total = new BigDecimal(totalStr.trim());
            }
            } catch (Exception ignored) {}

            Order o = new Order();
            o.setOrderCode(orderCode);
            o.setUserEmail(userEmail != null ? userEmail.trim() : "");
            o.setFirstName(firstName);
            o.setLastName(lastName);
            o.setPhone(phone);
            o.setStreetAddress(streetAddress);
            o.setDistrict(district);
            o.setCity(city);
            o.setPaymentMethod(paymentMethod != null ? paymentMethod : "cod");
            o.setAccountHolderName(accountHolder);
            o.setCardLast4(cardLast4);
            o.setSubtotal(subtotal);
            o.setShippingFee(shipping);
            o.setDiscount(discount);
            o.setTotalAmount(total);
            o.setStatus("In Transit");
            o.setOrderDate(new Timestamp(System.currentTimeMillis()));

            List<OrderItem> items = new ArrayList<>();
                    String[] itemProductIds = request.getParameterValues("itemProductId");
                    String[] itemNames = request.getParameterValues("itemName");
                    String[] itemPrices = request.getParameterValues("itemPrice");
                    String[] itemSizes = request.getParameterValues("itemSize");
                    String[] itemQtys = request.getParameterValues("itemQty");

                    if (itemNames != null && itemNames.length > 0) {
                    for (int i = 0; i < itemNames.length; i++) { OrderItem item=new OrderItem(); String
                        pName=itemNames[i]; item.setProductName(pName); int pId=0; if (itemProductIds !=null && i <
                        itemProductIds.length && itemProductIds[i] !=null) { try {
                        pId=Integer.parseInt(itemProductIds[i].trim()); } catch (Exception ignored) {} } if (pId <=0 &&
                        pName !=null) { Product p=productDao.findByName(pName); if (p !=null) { pId=p.getId(); } } if
                        (pId <=0) { pId=i + 1; } item.setProductId(pId); BigDecimal price=BigDecimal.ZERO; if
                        (itemPrices !=null && i < itemPrices.length && itemPrices[i] !=null) { try { price=new
                        BigDecimal(itemPrices[i].trim()); } catch (Exception ignored) {} } item.setPrice(price); String
                        size="100ml" ; if (itemSizes !=null && i < itemSizes.length && itemSizes[i] !=null) {
                        size=itemSizes[i]; } item.setItemSize(size); int qty=1; if (itemQtys !=null && i <
                        itemQtys.length && itemQtys[i] !=null) { try { qty=Integer.parseInt(itemQtys[i].trim()); } catch
                        (Exception ignored) {} } item.setQuantity(qty);
                        item.setSubtotal(price.multiply(BigDecimal.valueOf(qty))); items.add(item); } } else if
                        (userEmail !=null && !userEmail.isEmpty()) { List<CartItem> cartItems =
                        cartDao.getCart(userEmail);
                        for (CartItem ci : cartItems) {
                        if (ci.isSelected()) {
                        OrderItem oi = new OrderItem();
                        oi.setProductId(ci.getProductId());
                        oi.setProductName(ci.getProductName());
                        oi.setItemSize(ci.getCSize());
                        oi.setPrice(ci.getPrice());
                        oi.setQuantity(ci.getQuantity());
                        oi.setSubtotal(ci.getPrice().multiply(BigDecimal.valueOf(ci.getQuantity())));
                        items.add(oi);
                        }
                        }
                        }

                        o.setItems(items);
                        int orderId = 0;
                        try {
                        orderId = orderDao.createOrder(o);
                        } catch (Exception ex) {
                        ex.printStackTrace();
                        }

                        if (orderId > 0 && "card".equalsIgnoreCase(paymentMethod)) {
                        try {
                        PaymentDetails pd = new PaymentDetails();
                        pd.setOrderId(orderId);
                        pd.setPaymentMethod("card");
                        pd.setAccountHolderName(accountHolder);
                        pd.setCardNumber(cardNumber);
                        pd.setExpiryDate(cardExpiry);
                        pd.setCvc(cardCvc);
                        paymentDao.save(pd);
                        } catch (Exception ignored) {}
                        }

                        if (userEmail != null && !userEmail.isEmpty()) {
                        try {
                        cartDao.clearCart(userEmail);
                        } catch (Exception ignored) {}
                        }

                        out.print("{\"success\":true,\"orderCode\":\"" + orderCode + "\",\"orderId\":" + orderId + "}");

                        } else if ("list".equalsIgnoreCase(action)) {
                        String userEmail = request.getParameter("userEmail");
                        if (userEmail == null || userEmail.trim().isEmpty()) {
                        com.roseva.model.User su = (com.roseva.model.User) session.getAttribute("roseva_user");
                        if (su != null) {
                        userEmail = su.getEmail();
                        }
                        }

                        List<Order> orders = new ArrayList<>();
                                try {
                                if (userEmail != null && !userEmail.trim().isEmpty()) {
                                orders = orderDao.findByUser(userEmail.trim());
                                if (orders == null || orders.isEmpty()) {
                                orders = orderDao.findByUser(userEmail.trim().toLowerCase());
                                }
                                }
                                } catch (Exception ignored) {
                                orders = new ArrayList<>();
                                    }
                                    if (orders == null) {
                                    orders = new ArrayList<>();
                                        }

                                        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("MMMM dd,
                                        yyyy");
                                        StringBuilder sb = new StringBuilder();
                                        sb.append("{\"success\":true,\"orders\":[");
                                        for (int i = 0; i < orders.size(); i++) { Order ord=orders.get(i); if (i> 0)
                                            sb.append(",");
                                            String dateStr = ord.getOrderDate() != null ? sdf.format(ord.getOrderDate())
                                            : "Today";
                                            int count = (ord.getItems() != null && !ord.getItems().isEmpty()) ?
                                            ord.getItems().size() : 1;
                                            sb.append("{");
                                            sb.append("\"id\":").append(ord.getId()).append(",");
                                            sb.append("\"orderCode\":\"").append(ord.getOrderCode()).append("\",");
                                            sb.append("\"totalAmount\":").append(ord.getTotalAmount() != null ?
                                            ord.getTotalAmount() : 0).append(",");
                                            sb.append("\"itemCount\":").append(count).append(",");
                                            sb.append("\"formattedDate\":\"").append(dateStr).append("\",");
                                            sb.append("\"status\":\"").append(ord.getStatus() != null ? ord.getStatus()
                                            : "In Transit").append("\"");
                                            sb.append("}");
                                            }
                                            sb.append("]}");
                                            out.print(sb.toString());
                                            }
                                            %>