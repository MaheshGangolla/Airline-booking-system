<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="navbar.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <title>Edit Details</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }

        .card {
            width: 500px;
            margin: 20px auto;
            padding: 34px;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            padding-right:40px;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .details {
            text-align: left;
            margin-bottom: 20px;
        }

        .details-row {
            margin-bottom: 15px;
            position: relative;
        }

        label {
            display: inline-block;
            width: 120px;
            font-weight: bold;
            color: #666;
        }

        input {
            width: calc(100% - 140px);
            padding: 8px 30px 8px 40px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .icon {
            position: absolute;
            left: 125px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
           
           
            padding:8px;
            
             border: 1px solid #ddd;
        }

        .button-container {
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .update-button {
            color: #fff;
            background-color: #4CAF50;
            border: none;
            font-size: 14px;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .update-button:hover {
            background-color: #45a049;
        }

        .update-password-button {
            color: #fff;
            background-color: #2196F3;
            border: none;
            font-size: 14px;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .update-password-button:hover {
            background-color: #0b7dda;
        }

        .button-container a {
            text-decoration: none;
        }

    </style>
</head>
<body>

<div class="card">
    <h2>Edit Details</h2>
    <form action="updateMydetails" method="post">
        <div class="details">
            <div class="details-row">
                <label for="fullname"><i class="fas fa-user icon"></i> Full Name:</label>
                <input type="text" id="fullname" name="fullname" value="<%= (request.getParameter("fullname") )%>">
            </div>
            <div class="details-row">
                <label for="username"><i class="fas fa-user icon"></i> Username:</label>
                <input type="text" id="username" name="orighinausername" value="<%= request.getParameter("username") %>" disabled>
                <!-- Hidden input to store the username value -->
                <input type="hidden" name="username" value="<%= request.getParameter("username") %>">
            </div>
            
            <div class="details-row">
                <label for="email"><i class="fas fa-envelope icon"></i> Email:</label>
                <input type="email" id="email" name="email" value="<%= (request.getParameter("email1") )%>">
            </div>
            <div class="details-row">
                <label for="mobile"><i class="fas fa-mobile-alt icon"></i> Mobile:</label>
                <input type="tel" id="mobile" name="mobile" value="<%= (request.getParameter("mobile") )%>">
            </div>
            <div class="details-row">
                <label for="city"><i class="fas fa-city icon"></i> City:</label>
                <input type="text" id="city" name="city" value="<%= (request.getParameter("city") )%>">
            </div>
            <div class="details-row">
                <label for="state"><i class="fas fa-globe icon"></i> State:</label>
                <input type="text" id="state" name="state" value="<%= (request.getParameter("state") )%>">
            </div>
            <div class="details-row">
                <label for="pincode"><i class="fas fa-map-pin icon"></i> Pincode:</label>
                <input type="text" id="pincode" name="pincode" value="<%= (request.getParameter("pincode") )%>">
            </div>
        </div>
        <div class="button-container">
            <button type="submit" class="update-button">Update Details</button>
            <a href="resetnewpassword.jsp" class="update-password-button">Update Password</a>
        </div>
    </form>
</div>

</body>
</html>
