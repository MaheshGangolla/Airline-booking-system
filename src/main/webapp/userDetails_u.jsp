<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    // Check if the session is not created
    if (session.getAttribute("username") == null) {
        // Redirect to login.jsp
        String originalURL = request.getRequestURI();
        session.setAttribute("originalURL", originalURL);
        response.sendRedirect("login_u.jsp");
        // End processing this JSP
        return;
    }
%>
<%@ include file="navbar.jsp" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <title>Your Profile</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }

        .container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .card {
            background-color: #f9f9f9;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid black;
        }

        .details p {
            margin: 10px 0; /* Add space between each detail */
            color: #666;
        }

        .edit-btn {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f74e3b;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
            text-decoration: none;
            
        }

        .edit-btn:hover {
            background-color: #0056b3;
        }

        .edit-btn i {
            margin-right: 5px;
        }
        
    </style>
</head>
<body>

<div class="container">
    <h1>Your Profile</h1>
    <div class="card">
        <% if (request.getAttribute("piList") != null) {
            ArrayList al = (ArrayList) request.getAttribute("piList");
            Iterator itr = al.iterator();
            while (itr.hasNext()) {
                ArrayList pList = (ArrayList) itr.next();
        %>
        <div class="details">
            <p><i class="fas fa-user"></i> <strong>Full Name:</strong> <%=pList.get(0)%></p>
            <p><i class="fas fa-user"></i> <strong>Username:</strong> <%=pList.get(1)%></p>
      
            <p><i class="fas fa-envelope"></i> <strong>Email:</strong> <%=pList.get(4)%></p>
            <p><i class="fas fa-phone"></i> <strong>Mobile:</strong> <%=pList.get(3)%></p>
            <p><i class="fas fa-map-marker-alt"></i> <strong>City:</strong> <%=pList.get(5)%></p>
            <p><i class="fas fa-map-marker-alt"></i> <strong>State:</strong> <%=pList.get(6)%></p>
            <p><i class="fas fa-map-marker-alt"></i> <strong>Pincode:</strong> <%=pList.get(7)%></p>
        </div>
        <div class="text-center">
            <a href="editDetails.jsp?fullname=<%= pList.get(0) %>&username=<%= pList.get(1) %>&email1=<%= pList.get(4) %>&mobile=<%= pList.get(3) %>&city=<%= pList.get(5) %>&state=<%= pList.get(6) %>&pincode=<%= pList.get(7) %>" class="edit-btn">
                <i class="fas fa-edit"></i> Edit Profile
            </a>
        </div>
        <% }} %>
    </div>
</div>

</body>
</html>
