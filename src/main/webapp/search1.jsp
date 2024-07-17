
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%@ page import="java.time.format.DateTimeParseException" %>

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

<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.*" %>
<%@ include file="navbar.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <title>Search Results</title>
    <style>
        /* Your existing CSS styles */

        /* New styles for card layout */
        .card {
            background-color: #f0f0f0; /* Light gray background for cards */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Shadow effect */
            margin: 50px; /* Margin around cards */
            padding: 20px; /* Padding inside cards */
            display:inline-block; /* Display cards in a row */
            flex-wrap: wrap; /* Allow cards to wrap */
            max-width: 300px;
            vertical-align: top;
            
        }

        .card-content {
            flex-grow: 1; /* Allow content to grow */
            display: flex; /* Display content in a column */
            flex-direction: column; /* Align content vertically */
        }

        .card-item {
            margin-bottom: 10px; /* Margin between items */
            display: flex; /* Display items in a row */
            align-items: center; /* Center align items vertically */
        }

        .card-item span {
            font-weight: bold; /* Bold item text */
            margin-right: 5px; /* Margin between text and value */
        }

        .book-now {
            margin-top: 10px; /* Margin above button */
            text-align: center; /* Center align button */
        }

        .book-now button {
            padding: 10px 20px; /* Padding inside button */
            background-color: #4CAF50; /* Green background color */
            color: white; /* White text color */
            border: none; /* No border */
            border-radius: 5px; /* Rounded corners */
            cursor: pointer; /* Cursor style */
        }

        .book-now button:hover {
            background-color: #45a049; /* Darker green on hover */
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
    position: absolute;
 
    left: 50%;
    top:11%;
    transform: translate(-50%, -50%);
    text-align: center;
}
.not-available {
    color: white;
    background-color: #82878f;
    border: 1px solid black; /* Add a border for visibility */
    padding: 5px 10px;
    border-radius: 5px;
    text-align: center;
     
}
footer {
    background-color: #05203c;; /* Set the background color to dark gray */
    padding: 20px;
    position: absolute;
    bottom: 0;
    width: 100%;
    height:80px;
    text-align: center;
    z-index: 1; /* Ensure footer is above video */
}

   .marquee-container {
           
            color: red; /* White text color */
            padding: 10px; /* Padding around text */
          /* Bold text */
            margin-top:27px
        }

        /* Style for the marquee text */
        .marquee-text {
            display: inline-block; /* Display as inline block */
            
        
    </style>
</head>
<body>


 <h2 style="text-decoration:underline;">Showing Search Results</h2>
 
<br>
<div class="scroll">
 <% if (request.getAttribute("piList") == null ) { %>
    <div class="no-record">No Record Found</div>
    <% } %>
   <% if (request.getAttribute("piList") != null) {
    ArrayList al = (ArrayList) request.getAttribute("piList");
    Iterator itr = al.iterator();
    while (itr.hasNext()) {
        ArrayList pList = (ArrayList) itr.next();
%>
    <div class="card">
        <div class="card-content">
         
            <div class="card-item">
                <span>From City:</span>
                <%=pList.get(3)%>
            </div>
            <div class="card-item">
                <span>To City:</span>
                <%=pList.get(4)%>
            </div>
            <div class="card-item">
                <span>Date of Flight:</span>
                <%=pList.get(5)%>
            </div>
            <div class="card-item">
                <span>Flight Name:</span>
                <%=pList.get(2)%>
            </div>
            <div class="card-item">
                <span>Flight Arrival Time:</span>
                <%=pList.get(6)%>
            </div>
            <div class="card-item">
                <span>Flight Reach Time:</span>
                <%=pList.get(7)%>
            </div>
            <div class="card-item">
                <span>Duration:</span>
                <%=pList.get(8)%>
            </div>
            <div class="card-item">
                <span>First Class Price:</span>
                RS <%=pList.get(18)%>/-
            </div>
            <div class="card-item">
                <span>Business Class Price:</span>
                RS <%=pList.get(19)%>/-
            </div>
            <div class="card-item">
                <span>Eco Class Price:</span>
                RS <%=pList.get(20)%>/-
            </div>


<div class="card-item">
    <span>Availability:</span>
 
</div>
       <div class="book-now">
   
       <a href="booking.jsp?flightId=<%= pList.get(0) %>&flightNo=<%= pList.get(1) %>&date=<%= pList.get(5) %>&fromCity=<%= pList.get(3) %>&toCity=<%= pList.get(4) %>&day=<%= pList.get(9) %>"><button>Book Now</button></a>
  
    
</div>


        </div>
    </div>
    <% } } %>
   
</div>
  <% if (request.getAttribute("piList") != null) {
    ArrayList al = (ArrayList) request.getAttribute("piList");
    Iterator itr = al.iterator();
        ArrayList pList = (ArrayList) itr.next();
%>

  <div class="book-now">
  <h2>Wanna check next available flights</h2>
    <a href="schedule.jsp?fromCity=<%= pList.get(3) %>&toCity=<%=pList.get(4)  %>"><button>Check Now</button></a>
</div>
  <% } %>



<div class="call-support">
    
    <a href="support.jsp"><i class="fas fa-question-circle"></i> Support</a>
</div>
</body>
</html>
