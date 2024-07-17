<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>
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
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Success</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            padding: 20px;
        }
        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            margin: auto;
            max-width:1000px;
        }
        h2 {
            color: #333333;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #dddddd;
            border-right:1px solid #dddddd;
        }
        th {
            background-color: #305123;
            color:white;
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
        html, body {
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
     overflow-x: hidden;
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
        .company-logo {
            text-align: center;
            margin-bottom: 20px;
        }
        .company-logo img {
            width: 100px;
            height: auto;
        }
        .company-logo p {
            font-size: 20px;
            font-weight: bold;
            color: #305123;
        }
    </style>
</head>
<body>

<br>
<br>
<br>
<br>
<br>
<br>
<br>

    <div class="container">
        <h2>Payment Successful</h2>
        <h3>Booking Details</h3>
        <table>
            <tr>
                <th>Username</th>
                <th>Flight Number</th>
                <th>Date of Flight</th>
                <th>No. of Seats</th>
                <th>Ticket Type</th>
                <th>Adults</th>
                <th>Child</th>
                <th>PNR</th>
            </tr>
            <%
                // Retrieve attributes passed from the servlet
                String username = (String) request.getAttribute("username");
                String flightNo = (String) request.getAttribute("flightNumber");
                String dateOfFlight = (String) request.getAttribute("dateOfFlight");
                int noOfSeats = (int) request.getAttribute("noOfSeats");
                String ticketType = (String) request.getAttribute("ticketType");
                int adults = (int) request.getAttribute("adults");
                int child = (int) request.getAttribute("child");
                String pnr = (String) request.getAttribute("PNRNumber");
                String tid = (String) request.getAttribute("tid");
                String gateway = (String) request.getAttribute("gateway1");
                          
                // Print booking details
                out.println("<tr>");
                out.println("<td>" + username + "</td>");
                out.println("<td>" + flightNo + "</td>");
                out.println("<td>" + dateOfFlight + "</td>");
                out.println("<td>" + noOfSeats + "</td>");
                out.println("<td>" + ticketType + "</td>");
                out.println("<td>" + adults + "</td>");
                out.println("<td>" + child + "</td>");
                out.println("<td>" + pnr + "</td>");
                out.println("</tr>");
            %>
            
        </table>
        
        <h3>Payment Details</h3>
        <p>Address: <%= request.getParameter("address") %></p>
        <p>Payment Gateway: <%= gateway %></p>
          <p>Transation ID: <%= tid %></p>
        <p>Total Amount Paid: <b><%= request.getAttribute("actual_fair") %></p>
      <div class="book-now"><form id="disputes" action="SearchPNR_u" method="post">
                    <input type="hidden" name="pnr" value="<%=pnr %>">
                    <button type="submit"><i class="fas fa-book"></i> View Details</button>
                </form>
    </div>
    <div class="book-now"> <form id="disputes" action="cancelticket" method="post" onsubmit="confirmCancellation('disputes')">
                        <input type="hidden" name="PNR" value="<%= pnr %>">
                             <input type="hidden" name="noseats" value="<%= noOfSeats %>">
                               <input type="hidden" name="type" value="<%= ticketType %>">
                        <button type="submit"><i class="fas fa-ticket-alt"></i> Cancel Ticket</button>
                    </form> </div>
                    <div class="book-now">
            <form action="generatepdf" method="post" target="_blank">
                <input type="hidden" name="username" value="<%= username %>">
                <input type="hidden" name="flightNumber" value="<%= flightNo %>">
                <input type="hidden" name="dateOfFlight" value="<%= dateOfFlight %>">
                <input type="hidden" name="noOfSeats" value="<%= noOfSeats %>">
                <input type="hidden" name="ticketType" value="<%= ticketType %>">
                <input type="hidden" name="adults" value="<%= adults %>">
                <input type="hidden" name="child" value="<%= child %>">
                <input type="hidden" name="PNRNumber" value="<%= pnr %>">
                <input type="hidden" name="tid" value="<%= tid %>">
                <input type="hidden" name="gateway1" value="<%= gateway %>">
                <input type="hidden" name="actual_fair" value="<%= request.getAttribute("actual_fair") %>">
                <button type="submit"><i class="fas fa-file-pdf"></i> Download PDF</button>
            </form>
        </div>
    <div class="call-support">
    <a href="support.jsp"><i class="fas fa-phone"></i> Call</a>

</div>
</body>
</html>
