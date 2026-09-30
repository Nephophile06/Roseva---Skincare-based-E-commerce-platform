<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page
        import="com.roseva.dao.UserDao,com.roseva.dao.SkinProfileDao,com.roseva.model.User,com.roseva.model.SkinProfile"
        %>
        <% String action=request.getParameter("action"); if (action==null || action.trim().isEmpty()) { action="get" ; }
            UserDao userDao=new UserDao(); SkinProfileDao skinProfileDao=new SkinProfileDao(); String
            email=request.getParameter("email"); if (email==null || email.trim().isEmpty()) { User su=(User)
            session.getAttribute("roseva_user"); if (su !=null) { email=su.getEmail(); } } try { if
            ("get".equalsIgnoreCase(action)) { if (email==null || email.trim().isEmpty()) {
            out.print("{\"success\":false,\"message\":\"No user email\"}"); return; } User
            u=userDao.findByEmail(email.trim()); SkinProfile sp=skinProfileDao.getByUser(email.trim()); String
            userJson="null" ; if (u !=null) { String name=u.getName() !=null ? u.getName().replace("\"", "\\\"") : "
            User"; String role=u.getRole() !=null ? u.getRole().replace("\"", "\\\"") : " Member"; String
            phone=u.getPhone() !=null ? u.getPhone().replace("\"", "\\\"") : "";
            String contactNum = u.getContactNumber() != null ? u.getContactNumber().replace(" \"", "\\\"") : phone;
            String address = u.getAddress() != null ? u.getAddress().replace(" \"", "\\\"") : "";
            String gender = u.getGender() != null ? u.getGender().replace(" \"", "\\\"") : " male"; userJson="{\"
            id\":" + u.getId() + ",\" name\":\"" + name + "\" ,\"email\":\"" + u.getEmail() + "\" ,\"phone\":\"" + phone
            + "\" ,\"contactNumber\":\"" + contactNum + "\" ,\"address\":\"" + address + "\" ,\"gender\":\"" + gender
            + "\" ,\"role\":\"" + role + "\" }"; } String skinJson="null" ; if (sp !=null) { String
            barrier=sp.getSkinBarrier() !=null ? sp.getSkinBarrier().replace("\"", "\\\"") : "";
            String hydration = sp.getSkinHydration() != null ? sp.getSkinHydration().replace(" \"", "\\\"") : "";
            String sensitivity = sp.getSkinSensitivity() != null ? sp.getSkinSensitivity().replace(" \"", "\\\"") : "";
            String sebum = sp.getSkinSebum() != null ? sp.getSkinSebum().replace(" \"", "\\\"") : "";
            String stressors = sp.getStressors() != null ? sp.getStressors().replace(" \"", "\\\"") : "";
            String notes = sp.getOtherNotes() != null ? sp.getOtherNotes().replace(" \"", "\\\"") : "";

            skinJson = " {\"skinBarrier\":\"" + barrier + "\" ,\"skinHydration\":\"" + hydration + "\"
            ,\"skinSensitivity\":\"" + sensitivity + "\" ,\"skinSebum\":\"" + sebum + "\" ,\"stressors\":\"" + stressors
            + "\" ,\"otherNotes\":\"" + notes + "\" }"; } out.print("{\"success\":true,\"user\":" + userJson + ",\"
            skinProfile\":" + skinJson + "}" ); } else if ("updateUser".equalsIgnoreCase(action)) { String
            name=request.getParameter("name"); String updateEmail=request.getParameter("email"); String
            phone=request.getParameter("phone"); String address=request.getParameter("address"); String
            contactNumber=request.getParameter("contactNumber"); String gender=request.getParameter("gender"); if
            (updateEmail==null || updateEmail.trim().isEmpty()) { out.print("{\"success\":false,\"message\":\"Email
            required\"}"); return; } User u=userDao.findByEmail(updateEmail.trim()); if (u==null) { u=new User();
            u.setEmail(updateEmail.trim()); u.setName(name !=null ? name : "User" ); u.setPhone(phone);
            u.setAddress(address); u.setContactNumber(contactNumber); u.setGender(gender !=null ? gender : "male" );
            u.setRole("Member"); userDao.insert(u); } else { if (name !=null) u.setName(name); if (phone !=null)
            u.setPhone(phone); if (address !=null) u.setAddress(address); if (contactNumber !=null)
            u.setContactNumber(contactNumber); if (gender !=null) u.setGender(gender); userDao.update(u); }
            session.setAttribute("roseva_user", u); out.print("{\"success\":true}"); } else if
            ("saveSkinProfile".equalsIgnoreCase(action)) { String userEmail=request.getParameter("userEmail"); if
            (userEmail==null || userEmail.trim().isEmpty()) { userEmail=email; } if (userEmail==null ||
            userEmail.trim().isEmpty()) { out.print("{\"success\":false,\"message\":\"User email required\"}"); return;
            } String barrier=request.getParameter("skinBarrier"); String
            hydration=request.getParameter("skinHydration"); String sensitivity=request.getParameter("skinSensitivity");
            String sebum=request.getParameter("skinSebum"); String stressors=request.getParameter("stressors"); String
            notes=request.getParameter("otherNotes"); SkinProfile sp=new SkinProfile();
            sp.setUserEmail(userEmail.trim()); sp.setSkinBarrier(barrier !=null ? barrier : "Healthy" );
            sp.setSkinHydration(hydration !=null ? hydration : "Optimal" ); sp.setSkinSensitivity(sensitivity !=null ?
            sensitivity : "Resilient" ); sp.setSkinSebum(sebum !=null ? sebum : "Clear" ); sp.setStressors(stressors
            !=null ? stressors : "" ); sp.setOtherNotes(notes !=null ? notes : "" ); skinProfileDao.upsert(sp);
            out.print("{\"success\":true}"); } else { out.print("{\"success\":false,\"message\":\"Unknown action\"}"); }
            } catch (Exception e) { String msg=e.getMessage() !=null ? e.getMessage().replace("\"", "'" ) : "Unknown" ;
            out.print("{\"success\":false,\"message\":\"Error: " + msg + " \"}"); } %>