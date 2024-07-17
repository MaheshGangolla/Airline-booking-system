<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
       /* Updated CSS for better table structure and alignment */
.scroll {
    display: flex;
    justify-content: center; /* Center align the content horizontally */
    align-items: center; /* Center align the content vertically */
    flex-wrap: wrap; /* Allow content to wrap */
}

.card {
    background-color: #f0f0f0; /* Light gray background for cards */
    border-radius: 10px; /* Rounded corners */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Shadow effect */
    margin: 20px; /* Margin around cards */
    padding: 20px; /* Padding inside cards */
    max-width: 300px;
}

.card-content {
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

.no-record {
    text-align: center; /* Center align the text */
    font-style: italic; /* Italicize the text */
    color: #888; /* Light gray text color */
    margin-top: 20px; /* Margin on top */
}

    



         table {
            width: 60%; /* Reduced table width */
            border-collapse: collapse;
            border:2px solid black; /* Outer border for the table */
            margin: 20px auto; /* Center the table */
        }


table tr:nth-child(even) {
    background-color: #E4E3E9; /* Transparent white */
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

     .search-container button {
    background-color:#f74e3b; /* Set button background color to black */
    color: white; /* Set button text color to white */
    border: none; /* Remove button border */
    border-radius: 10px; /* Add border radius for rounded corners */
    padding: 8px 8px; /* Add padding for button size */
    font-size: 15px; /* Adjust font size */
    cursor: pointer; /* Add pointer cursor on hover */
    transition: background-color 0.3s; /* Smooth transition on hover */
}

.search-container button:hover {
    background-color: #ff604f; /* Darker color on hover */
    transform: scale(1.2); /* Scale the button by 10% on hover */
}

footer {
    background-color:#ecf0c7; /* Set the background color to dark gray */
    padding: 20px;
    position: absolute;
    bottom: 0;
    width: 100%;
    text-align: center;
    z-index: 1; /* Ensure footer is above video */
}

footer a:hover {
    color: #fff; /* Change the text color to white on hover */
}

footer a {
    margin: 0 10px;
    color: #black; /* Set the text color to white */
    text-decoration: none; /* Remove underline */
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

        
       
    </style>
</head>

<div class="center-container">
    <h2>Displaying Booking Details</h2>
</div>
<br>
<div class="scroll">
    <table align="center">
        <tr style="color:blue" bgcolor="#FEA116">
            <th>Username</th>
            <th>Flight No</th>
            <th>Date of Flight</th>
            <th>No of Seats</th>
            <th>Ticket Type</th>
            <th>PNR</th>
            <th>Actual Fair</th>
            <th>Action</th>
        </tr>
        <% 
        ArrayList<ArrayList<String>> bookingDetailsList = (ArrayList<ArrayList<String>>) request.getAttribute("piList");
        if (bookingDetailsList != null) {
            Iterator<ArrayList<String>> itr = bookingDetailsList.iterator();
            while (itr.hasNext()) {
                ArrayList<String> bookingDetails = itr.next();
        %>
        <tr>
            <td><center><%=bookingDetails.get(0)%></center></td>
            <td><center><%=bookingDetails.get(1)%></center></td>
            <td><center><%=bookingDetails.get(2)%></center></td>
            <td><center><%=bookingDetails.get(3)%></center></td>
            <td><center><%=bookingDetails.get(4)%></center></td>
            <td><center><%=bookingDetails.get(5)%></center></td>
            <td><center><%=bookingDetails.get(6)%></center></td>
            <td><center>
               <div class="book-now"> <form id="disputes" action="SearchPNR_u" method="post">
                    <input type="hidden" name="pnr" value="<%= bookingDetails.get(5) %>">
                    <button type="submit"><i class="fas fa-book"></i> View Details</button>
                </form>
            </center></td></div>
        </tr>
        <% 
            }
        } else {
        %>
        <tr>
            <td colspan="7" class="no-record">No records found.</td>
        </tr>
        <% } %>
    </table>
</div>

</body>
</html>
