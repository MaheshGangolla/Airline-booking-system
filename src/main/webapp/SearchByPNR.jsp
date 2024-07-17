<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="navbar_a.jsp" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <title>Search Results</title>
    <style>
        /* Your existing CSS styles */

        table {
            width: 80%; /* Reduced table width */
            border-collapse: collapse;
            border:2px solid black; /* Outer border for the table */
            margin: 20px auto; /* Center the table */
        }

        th, td {
            padding: 8px;
            text-align: center;
            border: 1.5px solid #ddd; /* Thin border for table cells */
        }

        th {
            background-color: #36a1d4;
            color:white;
             border:0.5px solid black;
        }

        .button {
            margin-top: 10px; /* Margin above button */
            text-align: center; /* Center align button */
              
        }
        
        

   .button {
    padding: 10px 20px; /* Padding inside button */
   background-color:  #f74e3b;
    color: white; /* White text color */
    border: none; /* No border */
    border-radius: 5px; /* Rounded corners */
    cursor: pointer; /* Cursor style */
}

.button:hover {
    background-color: white; /* Darker orange on hover */
    color:white;
}

       

        .call-support {
            position: fixed;
            bottom: 20px;
            right: 20px;
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            z-index: 9999; /* Ensure it's above other content */
        }

        .call-support a {
            text-decoration: none;
            color: #fff; /* White text color */
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            display: flex;
            align-items: center;
        }

        .call-support a i {
            margin-right: 10px;
        }

        .center-container {
            text-align: center;
            margin-top: 20px;
        }

        .signup-text {
            margin-bottom: 10px;
            font-size: 14px;
            color: #333;
        }
        

    </style>
</head>
<body>

<div class="center-container">
    <h2>Showing Search Results</h2>
</div>
<br>
<div class="scroll">
    <table align="center">
        <tr style="color:blue" bgcolor="#FEA116">
            <th>Flight ID</th>
            <th>Flight No</th>
            <th>Flight Name</th>
            <th>From City</th>
            <th>To City</th>
            <th>Date of Flight</th>
            <th>Flight Arrival Time</th>
            <th>Flight Reach Time</th>
            <th>Duration</th>
            <th>First Class Seat</th>
            <th>First Class Seat Booked</th>
            <th>First Class Seat Available</th>
            <th>Business Class Seat</th>
            <th>Business Class Seat Booked</th>
            <th>Business Class Seat Available</th>
            <th>Economy Class Seat</th>
            <th>Economy Class Seat Booked</th>
            <th>Economy Class Seat Available</th>
            <th>First Class Price</th>
            <th>Business Class Price</th>
            <th>Economy Class Price</th>
            <th>Action</th>
        </tr>
        <% if (request.getAttribute("flightDetailsList") != null) {
            ArrayList al = (ArrayList) request.getAttribute("flightDetailsList");
            Iterator itr = al.iterator();
            while (itr.hasNext()) {
                ArrayList pList = (ArrayList) itr.next();
        %>
        <tr>
            <td><center><%=pList.get(0)%></center></td>
            <td><center><%=pList.get(1)%></center></td>
            <td><center><%=pList.get(2)%></center></td>
            <td><center><%=pList.get(3)%></center></td>
            <td><center><%=pList.get(4)%></center></td>
            <td><center><%=pList.get(5)%></center></td>
            <td><center><%=pList.get(6)%></center></td>
            <td><center><%=pList.get(7)%></center></td>
            <td><center><%=pList.get(8)%></center></td>
            <td><center><%=pList.get(9)%></center></td>
            <td><center><%=pList.get(10)%></center></td>
            <td><center><%=pList.get(11)%></center></td>
            <td><center><%=pList.get(12)%></center></td>
            <td><center><%=pList.get(13)%></center></td>
            <td><center><%=pList.get(14)%></center></td>
            <td><center><%=pList.get(15)%></center></td>
            <td><center><%=pList.get(16)%></center></td>
            <td><center><%=pList.get(17)%></center></td>
            <td><center><%=pList.get(18)%></center></td>
            <td><center><%=pList.get(19)%></center></td>
            <td><center><%=pList.get(20)%></center></td>
            <td><a href="booking.jsp?flightId=<%= pList.get(0) %>&date=<%= pList.get(5) %>&fromCity=<%= pList.get(3) %>&toCity=<%= pList.get(4) %>&day=<%= pList.get(9) %>"><button class="button"> Book Now</button></a></td>
        </tr>
        <% } } %>
    </table>
    <% if (request.getAttribute("piList") == null ) { %>
    <div class="no-record">No Record Found</div>
    <% } %>
</div>

<div class="center-container">
    <p class="signup-text">Wanted to Add more flights?</p>
    <a href="addflights.jsp" class="signup-link">Click Here</a>
</div>

<div class="call-support">

    <a href="support.jsp"><i class="fas fa-question-circle"></i> Support</a>
</div>
</body>
</html>
