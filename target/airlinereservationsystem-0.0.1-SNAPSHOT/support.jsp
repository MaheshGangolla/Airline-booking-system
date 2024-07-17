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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <title>Flight Ticket Dispute Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 500px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border: 1px solid black;
            border-radius: 10px;
            justify-content: center;
            align-items: center;
            margin-top:120px;
        }

        h2 {
            text-align: center;
            color: black;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }

        input[type="text"],
        select,
        textarea {
            width: calc(100% - 20px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-bottom: 10px;
            font-size: 16px;
        }

        textarea {
            height: 100px;
            resize: vertical;
        }

        .mandatory::after {
            content: "*";
            color: red;
        }

        .topnav {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .call-support {
            position: fixed;
            bottom: 20px;
            right: 20px;
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            z-index: 9999;
        }

        .call-support a {
            text-decoration: none;
            color: #fff;
            background-color: rgba(0, 0, 0, 0.5);
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
            top: 11%;
            transform: translate(-50%, -50%);
            text-align: center;
        }

        .small {
            font-size: 2px;
            color: transparent;
        }

        html, body {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        footer {
            background-color: #05203c;
            padding: 20px;
            position: absolute;
            bottom: 0;
            width: 100%;
            height: 80px;
            text-align: center;
            z-index: 1;
        }
    </style>
    <script>
        function validateForm() {
            event.preventDefault();

            var name = document.getElementById("name").value.trim();
            var mobile = document.getElementById("mobile").value.trim();
            var message = document.getElementById("message").value.trim();
            var sessionName = "<%= session.getAttribute("username") %>";

            if (name !== sessionName) {
                alert("Name should be equal to " + sessionName);
                return false;
            }

            if (!/^\d{10}$/.test(mobile)) {
                alert("Mobile number should be exactly 10 digits.");
                return false;
            }

            if (message.length > 100) {
                alert("Message should be up to 100 characters only.");
                return false;
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Flight Ticket Dispute Form</h1>

        <% if ("success".equals(request.getParameter("status"))) { %>
            <p style="color: green; text-align: center;">Your dispute has been successfully submitted!</p>
        <% } %>

        <form action="disputesubmit" method="post" onsubmit="validateForm">
            <div>
                <label for="name">Name <span class="mandatory"></span>:</label>
                <input type="text" id="name" name="name" value="<%= session.getAttribute("username") %>" required>
            </div>
            <div>
                <label for="type">Seat Type <span class="mandatory"></span>:</label>
                <select id="type" name="type" required>
                    <option value="">Select</option>
                    <option value="economy">Economy Class</option>
                    <option value="business">Business Class</option>
                    <option value="first">First Class</option>
                </select>
            </div>
            <div>
                <label for="pnr">PNR Number <span class="mandatory"></span>:</label>
                <input type="text" id="pnr" name="PNR" required>
            </div>
            <div>
                <label for="date-of-flight">Date of the Flight <span class="mandatory"></span>:</label>
                <input type="date" id="date-of-flight" name="date" required>
            </div>
            <div>
                <label for="mobile">Mobile Number <span class="mandatory"></span>:</label>
                <input type="number" id="mobile" name="mobile" style="width: 100%; height: 40px; border-radius: 10px" required>
            </div>
            <div>
                <label for="message">Message <small style="font-size: 10px">Up to 100 words</small><span class="mandatory"></span>:</label>
                <textarea id="message" name="message" required></textarea>
            </div>
            <button type="submit" style="background-color: #f74e3b; color: #fff; padding: 10px 20px; border: none; border-radius: 6px; cursor: pointer; text-align: center; font-size: 16px;">Submit</button>
            <div class="call-support">
               
                <a href="support.jsp"><i class="fas fa-question-circle"></i> Support</a>
            </div>
        </form>
    </div>
</body>
</html>
