<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.*" %>
<%@ include file="navbar_a.jsp" %>
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
            <th>Full Name</th>
            <th>UserName</th>
            <th>Password</th>
            <th>Mobile No</th>
            <th>Email</th>
            <th>City</th>
            <th>State</th>
            <th>Pincode</th>
            <th>View Activity</th>
            
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
            <td><center><div class="SearchContainer">
                    <form id="logoutForm" action="UserPreferencesServlet" method="get">
                      <input type="hidden" class="form-control" id="date_of_flight" placeholder="username" name="username" value="<%= pList.get(1) %>" >
                    
                        <button type="submit"><i class="fas fa-user-circle"></i> Activity</button>
                    </form>
                </div></center></td>
           
  
        </tr>
        <% } } %>
    </table>
   
</div>


</body>
</html>
