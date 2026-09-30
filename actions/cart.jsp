<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.roseva.dao.CartDao,com.roseva.model.CartItem,java.math.BigDecimal,java.util.List,java.util.ArrayList"%>
<%
String action = request.getParameter("action");
if (action == null) {
	action = "get";
}
String userEmail = request.getParameter("userEmail");
if (userEmail == null || userEmail.trim().isEmpty()) {
	com.roseva.model.User sessionUser = (com.roseva.model.User) session.getAttribute("roseva_user");
	if (sessionUser != null) {
		userEmail = sessionUser.getEmail();
	}
}
CartDao cartDao = new CartDao();
try {
	if ("get".equalsIgnoreCase(action)) {
		List<CartItem> items = new ArrayList<>();
		if (userEmail != null && !userEmail.trim().isEmpty()) {
	items = cartDao.getCart(userEmail);
		}

		StringBuilder sb = new StringBuilder("[");
		for (int i = 0; i < items.size(); i++) {
	CartItem ci = items.get(i);
	if (i > 0)
		sb.append(",");
	sb.append("{\"id\":\"").append(ci.getId()).append("\",\"name\":\"").append(ci.getProductName())
			.append("\",\"price\":").append(ci.getPrice()).append(",\"size\":\"").append(ci.getCSize())
			.append("\",\"image\":\"").append(ci.getImage()).append("\",\"quantity\":").append(ci.getQuantity())
			.append(",\"selected\":").append(ci.isSelected()).append("}");
		}
		sb.append("]");
		out.print("{\"success\":true,\"items\":" + sb.toString() + "}");

	} else if ("add".equalsIgnoreCase(action)) {
		String productName = request.getParameter("name");
		String priceStr = request.getParameter("price");
		String size = request.getParameter("size");
		String image = request.getParameter("image");
		String qtyStr = request.getParameter("quantity");

		BigDecimal price = BigDecimal.ZERO;
		if (priceStr != null && !priceStr.trim().isEmpty()) {
	try {
		price = new BigDecimal(priceStr.trim());
	} catch (Exception e) {
	}
		}

		int qty = 1;
		if (qtyStr != null && !qtyStr.trim().isEmpty()) {
	try {
		qty = Integer.parseInt(qtyStr.trim());
	} catch (Exception e) {
	}
		}

		CartItem ci = new CartItem();
		ci.setUserEmail(userEmail != null ? userEmail : "");
		ci.setProductName(productName);
		ci.setPrice(price);
		ci.setCSize(size != null ? size : "100ml");
		ci.setImage(image != null ? image : "assets/logo.png");
		ci.setQuantity(Math.max(1, qty));
		ci.setSelected(true);

		cartDao.addItem(ci);
		out.print("{\"success\":true}");

	} else if ("updateQty".equalsIgnoreCase(action)) {
		String idStr = request.getParameter("id");
		String qtyStr = request.getParameter("quantity");
		if (idStr != null && qtyStr != null) {
	int id = Integer.parseInt(idStr);
	int qty = Integer.parseInt(qtyStr);
	cartDao.updateQuantity(id, qty);
		}
		out.print("{\"success\":true}");

	} else if ("toggleSelect".equalsIgnoreCase(action)) {
		String idStr = request.getParameter("id");
		String selStr = request.getParameter("selected");
		if (idStr != null && selStr != null) {
	int id = Integer.parseInt(idStr);
	boolean selected = Boolean.parseBoolean(selStr);
	cartDao.setSelected(id, selected);
		}
		out.print("{\"success\":true}");

	} else if ("remove".equalsIgnoreCase(action)) {
		String idStr = request.getParameter("id");
		if (idStr != null) {
	int id = Integer.parseInt(idStr);
	cartDao.removeItem(id);
		}
		out.print("{\"success\":true}");

	} else if ("clear".equalsIgnoreCase(action)) {
		if (userEmail != null) {
	cartDao.clearCart(userEmail);
		}
		out.print("{\"success\":true}");

	} else {
		out.print("{\"success\":false,\"message\":\"Unknown action\"}");
	}
} catch (Exception e) {
	out.print("{\"success\":false,\"message\":\"Error: " + e.getMessage() + "\"}");
}
%>