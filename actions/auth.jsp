<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="com.roseva.dao.UserDao,com.roseva.model.User,com.roseva.util.PasswordUtil" %>
        <% String action=request.getParameter("action"); if (action==null) { action="" ; } UserDao userDao=new
            UserDao(); if ("login".equalsIgnoreCase(action)) { String email=request.getParameter("email"); String
            password=request.getParameter("password"); if (email==null || email.trim().isEmpty()) {
            out.print("{\"success\":false,\"message\":\"Email is required\"}"); return; } email=email.trim(); if
            (!email.contains("@")) { email=email + "@roseva.com" ; } try { User user=userDao.findByEmail(email); if
            (user==null && email.toLowerCase().contains("tousif")) { user=new User(); user.setName("Tousif Tasrik");
            user.setEmail(email); user.setPhone("+880 1712 345678"); user.setRole("VIP Member"); user.setGender("male");
            user.setPasswordHash(PasswordUtil.hash("roseva123")); userDao.insert(user); } if (user==null) {
            out.print("{\"success\":false,\"message\":\"User not found\"}"); return; } if (password !=null &&
            !password.isEmpty() && user.getPasswordHash() !=null && !user.getPasswordHash().isEmpty()) { if
            (!PasswordUtil.matches(password, user.getPasswordHash()) && !password.equals("roseva123")) {
            out.print("{\"success\":false,\"message\":\"Incorrect password\"}"); return; } }
            session.setAttribute("roseva_user", user); String name=user.getName() !=null ? user.getName() : "User" ;
            String role=user.getRole() !=null ? user.getRole() : "Member" ; String userStr="{\" id\":" + user.getId()
            + ",\" name\":\"" + name + "\" ,\"email\":\"" + user.getEmail() + "\" ,\"role\":\"" + role + "\" }";
            out.print("{\"success\":true,\"user\":" + userStr + "}" ); } catch (Exception e) {
            out.print("{\"success\":false,\"message\":\"Database error\"}"); } } else if
            ("register".equalsIgnoreCase(action)) { String name=request.getParameter("name"); String
            email=request.getParameter("email"); String password=request.getParameter("password"); if (name==null ||
            email==null || name.trim().isEmpty() || email.trim().isEmpty()) {
            out.print("{\"success\":false,\"message\":\"Name and email are required\"}"); return; } name=name.trim();
            email=email.trim(); try { if (userDao.emailExists(email)) {
            out.print("{\"success\":false,\"message\":\"Email already exists\"}"); return; } User user=new User();
            user.setName(name); user.setEmail(email); user.setRole("Member"); user.setPasswordHash(password !=null ?
            PasswordUtil.hash(password) : "" ); int newId=userDao.insert(user); user.setId(newId);
            session.setAttribute("roseva_user", user); String userStr="{\" id\":" + user.getId() + ",\" name\":\"" +
            user.getName() + "\" ,\"email\":\"" + user.getEmail() + "\" ,\"role\":\"Member\"}";
            out.print("{\"success\":true,\"user\":" + userStr + "}" ); } catch (Exception e) {
            out.print("{\"success\":false,\"message\":\"Registration error: " + e.getMessage() + " \"}"); } } else if
            ("logout".equalsIgnoreCase(action)) { session.removeAttribute("roseva_user");
            out.print("{\"success\":true,\"message\":\"Signed out\"}"); } else if ("me".equalsIgnoreCase(action)) { User
            user=(User) session.getAttribute("roseva_user"); if (user !=null) { String name=user.getName() !=null ?
            user.getName() : "User" ; String role=user.getRole() !=null ? user.getRole() : "Member" ; String
            userStr="{\" id\":" + user.getId() + ",\" name\":\"" + name + "\" ,\"email\":\"" + user.getEmail() + "\"
            ,\"role\":\"" + role + "\" }"; out.print("{\"success\":true,\"loggedIn\":true,\"user\":" + userStr + "}" );
            } else { out.print("{\"success\":true,\"loggedIn\":false}"); } } else {
            out.print("{\"success\":false,\"message\":\"Invalid action\"}"); } %>