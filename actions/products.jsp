<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="com.roseva.dao.ProductDao,com.roseva.model.Product,java.util.List,java.math.BigDecimal" %>
        <% String action=request.getParameter("action"); if (action==null) { action="list" ; } ProductDao productDao=new
            ProductDao(); try { if ("list".equalsIgnoreCase(action)) { List<Product> products = productDao.findAll();
            StringBuilder sb = new StringBuilder("{\"success\":true,\"products\":[");
            for (int i = 0; i < products.size(); i++) { Product p=products.get(i); if (i> 0) sb.append(",");
                sb.append("{\"id\":").append(p.getId()).append(",\"name\":\"").append(p.getName()).append("\",\"price\":").append(p.getPrice()).append(",\"size\":\"").append(p.getProdSize()).append("\",\"image\":\"").append(p.getImage()).append("\",\"category\":\"").append(p.getCategory()).append("\"}");
                }
                sb.append("]}");
                out.print(sb.toString());

                } else if ("get".equalsIgnoreCase(action)) {
                String idStr = request.getParameter("id");
                String name = request.getParameter("name");
                Product p = null;
                if (idStr != null) {
                p = productDao.findById(Integer.parseInt(idStr));
                } else if (name != null) {
                p = productDao.findByName(name);
                }
                if (p != null) {
                out.print("{\"success\":true,\"product\":{\"id\":" + p.getId() + ",\"name\":\"" + p.getName() +
                "\",\"price\":" + p.getPrice() + "}}");
                } else {
                out.print("{\"success\":false,\"message\":\"Product not found\"}");
                }
                } else {
                out.print("{\"success\":false,\"message\":\"Unknown action\"}");
                }
                } catch (Exception e) {
                out.print("{\"success\":false,\"message\":\"Error: " + e.getMessage() + "\"}");
                }
                %>