<%@ page language="java" %>
<%
    String uname = request.getParameter("uname");
    String ugender = request.getParameter("ugender");
    String udob = request.getParameter("udob");
    String uemail = request.getParameter("uemail");
    String upwd = request.getParameter("upwd");
    String ucontact = request.getParameter("ucontact");

    boolean isRegistered = false; // Replace with actual database logic.

    if (isRegistered) {
        response.sendRedirect("login.jsp");
    } else {
        response.sendRedirect("register.jsp?error=Unable to register user. Please try again.");
    }
%>
