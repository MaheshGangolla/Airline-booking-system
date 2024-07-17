<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <title>Search Results</title>
    <style>
        /* Your existing CSS styles */

   /* Add your CSS styles here */
   
   body{
   
   background-color:#e6e6e6;
 
   }
.card {
    border-radius: 40px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin: 0 auto; /* Auto margin to horizontally center the card */
    margin-bottom: 20px;
    max-width: 1300px; /* Limit the maximum width of the card */
    width: 100%; /* Ensure the card takes up full width */
    border: 1px solid black;

}

.card-content {
    padding: 20px;
    background-image:url('123.jpg');
    background-size:cover;
     border-radius: 40px;
     box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
     
 
}

.booking-details {
    position: relative; /* Make the container position relative */
    text-align: center;
    font-size: 25px;
    font-weight: bold;
    margin-bottom: 20px;
    padding: 10px;
    border-radius: 8px;
    background-size: cover;
    font-family:fantasy;
    text-decoration:underline;
}





.pnr-number {
    text-align: center;
    margin-bottom: 20px;
}

.bold-text {
    font-weight: bold;
   color:#2142AB;
    font-family:inherit;
    
}

.flight-details {
    display: flex;
    justify-content: space-around;
   /* Light coral background */
    padding: 10px;
    border-radius: 8px;
    margin-bottom: 20px;
    border: 1px solid black;
    
}


.detail-item {
    margin-bottom: 10px;
    display: flex;
    align-items: center;
    font-size:20px;
    font-family:fantasy;
    font-weight:bold;
}

.icon {
    margin-right: 5px;
    font-size:20px;
}

.price-details {
font-family:cursive;
    font-weight: bold;
    margin-bottom: 10px;
    font-size: 24px; /* Increased font size */
    text-align: center;
   gap: 20px; 
    padding: 10px;
    border-radius: 8px;
}

.seats-details {

    text-align: center;
    font-size: 30px;
    align-items:flex-start;
    margin-bottom: 20px;
    padding: 10px;
    border-radius: 8px;
    background-size: cover;
}

.payment-details {
    background-color: #ffffcc; /* Pale yellow background */
    padding: 10px;
    border-radius: 8px;
    margin-bottom: 20px;
    border: 1px solid black;
}

.payment-details h4 {
    text-align: center;
    font-size: 26px;
    margin-bottom: 20px;
      text-shadow: 0 2px 2px rgba(0, 0, 0, 0.1); 
      border-radius:5px;
    
}

.payment-item {
    margin-bottom: 10px; /* Add space between each item */ font-size: 15px;
}

.bold-text {
    font-weight: bold;
}


.availability {
    text-align: center;
    font-weight: bold;
    margin-bottom: 30px;
}
button {
    width: 20%;
    padding: 10px;
    font-size: 16px;
    color: #fff;
    background-color: #f74e3b;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    
}




button:hover {
 
   /* transform: scale(1.2);  Scale the button by 10% on hover */
}
.book-now {
    text-align: center;
    padding:15px;
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
        
        
    </style>
</head>
<body>

<div class="center-container">
    <h2 style="text-align:center">Showing Search Results</h2>
</div>
<br>

<div class="scroll">
    <% if (request.getAttribute("flightDetailsList") != null) {
        ArrayList al = (ArrayList) request.getAttribute("flightDetailsList");
        Iterator itr = al.iterator();
        while (itr.hasNext()) {
            ArrayList pList = (ArrayList) itr.next();
    %></div>
    <div class="card">
        <div class="card-content">
            <h3 class="booking-details">BOOKING DETAILS</h3>
            <div class="pnr-number">
                <h4><span class="bold-text">PNR:</span> <%=pList.get(9)%></h4>
            </div>
            <div class="flight-details">
                <div class="detail-item">
                
                    <span class="icon">🛫</span>
                    
                    <span><span class="bold-text">From:</span> <%=pList.get(3)%></span>
                </div>
              
                <div class="detail-item">
                    <span class="icon">🛬</span>
                    <span><span class="bold-text" >To:</span> <%=pList.get(4)%></span>
                </div>
                <div class="detail-item">
                    <span class="icon">📅</span>
                    <span><span class="bold-text">Date of Flight:</span> <%=pList.get(2)%></span>
                </div>
               
            </div>
           
            <div class="payment-details">
    <h4 style="text-decoration: underline;">Payment Details</h4>
    <div class="payment-item">
        <span class="bold-text">No of Seats:</span> <%=pList.get(5)%>
    </div>
    <div class="payment-item">
        <span class="bold-text">Type of Seat:</span> <%=pList.get(6)%>
    </div>
    <div class="payment-item">
        <span class="bold-text">Children:</span> <%=pList.get(8)%>
    </div>
    <div class="payment-item">
        <span class="bold-text">Payment Status:</span> <%=pList.get(15)%>
    </div>
    <div class="payment-item">
        <span class="bold-text">Booked Date:</span> <%=pList.get(11)%>
    </div>
    <div class="payment-item">
        <span class="bold-text">Payment Date:</span> <%=pList.get(16)%>
    </div>
    <div class="payment-item">
        <span class="bold-text">Price:</span> <%=pList.get(13)%>
    </div>
     <div class="payment-item">
        <span class="bold-text">Booking Status</span> <%=pList.get(12)%>
    </div>
    <div class="payment-item">
        <span class="bold-text">Flight Name</span> <%=pList.get(17)%>
    </div>
     <div class="payment-item">
        <span class="bold-text">Seat No:</span> <%=pList.get(14)%>
    </div>
    
</div>

           
            <div class="book-now">
              
                    <form id="disputes" action="cancelticket" method="post" onsubmit="confirmCancellation('disputes')">
                        <input type="hidden" name="PNR" value="<%= pList.get(9) %>">
                         <input type="hidden" name="flightid" value="<%= pList.get(17) %>">
                             <input type="hidden" name="noseats" value="<%= pList.get(5) %>">
                               <input type="hidden" name="type" value="<%= pList.get(6) %>">
                        <button type="submit"><i class="fas fa-ticket-alt"></i> Cancel Ticket</button>
                    </form>
                
            </div>
        </div>
    </div>
    <% } } %>
</div>
<script>
    // Function to show confirmation dialog for cancellation
    function confirmCancellation(formId) {
        // Show confirmation dialog
        var confirmation = confirm("Are you sure you want to cancel this ticket?");
        // If user clicks "Yes" (true), submit the form
        if (confirmation) {
            document.getElementById(formId).submit(); // Submit the form
        } else {
            return false; // Prevent form submission
        }
    }
</script>

</body>
</html>


</body>
</html>

