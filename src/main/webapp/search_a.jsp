
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.time.format.DateTimeParseException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.*" %>
<%@ include file="navbar_a.jsp" %>

<!DOCTYPE html>



<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <title>Search Results</title>
    <style>
        /* Your existing CSS styles */

        table {
            width: 85%; /* Reduced table width */
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
             border-bottom:0.5px solid black;
        }

        .button {
            margin-top: 10px; /* Margin above button */
            text-align: center; /* Center align button */
              
        }
        table tr:nth-child(even) {
    background-color: #E4E3E9; /* Transparent white */
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
    background-color: #101936; /* Darker orange on hover */
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
        
.flight-options-dropdown {

        
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
     
             <th>Edit</th>
             <th>Delete</th>
           
        </tr>
        <% if (request.getAttribute("piList") != null) {
            ArrayList al = (ArrayList) request.getAttribute("piList");
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
       
              <td><center><div class="book-now">
                    <a href="update_flights.jsp?date=<%= pList.get(5) %>&flightNo=<%= pList.get(1) %>
                    &flightId=<%= pList.get(0) %>
                    &flightName=<%= pList.get(2) %>
                    &fromCity=<%= pList.get(3) %>
                    &toCity=<%= pList.get(4) %>
                    &arrivalTime=<%= pList.get(6) %>
                    &reachTime=<%= pList.get(7) %>
                    &duration=<%= pList.get(8) %>
                    &firstClassSeat=<%= pList.get(9) %>
                    &firstClassSeatBooked=<%= pList.get(10) %>
                    &firstClassSeatAvailable=<%= pList.get(11) %>
                    &businessClassSeat=<%= pList.get(12) %>
                    &businessClassSeatBooked=<%= pList.get(13) %>
                    &businessClassSeatAvailable=<%= pList.get(14) %>
                    &economyClassSeat=<%= pList.get(15) %>
                    &economyClassSeatBooked=<%= pList.get(16) %>
                    &economyClassSeatAvailable=<%= pList.get(17) %>
                    &firstClassPrice=<%= pList.get(18) %>
                    &businessClassPrice=<%= pList.get(19) %>
                    &economyClassPrice=<%= pList.get(20) %>">
                    <button style="color:white; background-color:#f74e3b; border:4px;font-size: 12px; padding: 5px 10px;cursor: pointer;"><b>Edit</button></a></div>
              </center></td>
              <td><center><div class="book-now"> <a href="delete_flight.jsp?flightId=<%= pList.get(0) %>&msg=<%= "Really wanted to Delete "+pList.get(0)+ " ?" %>&flightNo=<%= pList.get(1) %>&fname=<%= pList.get(2) %>"><button style="color:white; background-color:#f74e3b; border:4px;font-size: 12px; padding: 5px 10px;cursor: pointer;"><b>Delete</button></a></div></center></td></center></td>
            
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
