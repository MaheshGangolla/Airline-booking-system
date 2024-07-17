<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="navbar_a.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Passenger Details</title>
    <style>
        body {
        font-family: 'Roboto', sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column; /* Ensure children stack vertically */
    
        min-height: 100vh; /* Use min-height instead of height to ensure it expands with content */
        background-color: #f5f5f5;
    }

    .navbar {
        width: 100%; /* Set navbar width to 100% */
        background-color: #1a73e8; /* Add background color */
        color: #fff; /* Set text color to white */
        padding: 10px 0; /* Add padding to the top and bottom */
        box-sizing: border-box; /* Ensure padding is included in width */
    }

    .navbar-content {
        width: 90%; /* Center navbar content */
        margin: 0 auto; /* Center horizontally */
        display: flex;
        justify-content: space-between; /* Align items at each end */
    }

        .container {
           background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 15px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        /* Set container width to 90% */
        max-width: 500px; /* Set max-width to 360px */
        padding: 35px;
        text-align: center;
        margin-top: 20px;
        box-sizing: border-box; /* Ensure padding is included in width */
            align-items: center;
            margin-left:850px;
          
        }

        h2 {
            text-align: center;
            color: #333;
        }

        fieldset {
            border: 1px solid #ddd;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 8px;
        }

        legend {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }

        Button_container[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            margin-top: 10px;
        }

        Button_container[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Passenger Details</h2>
        <form action="processPassengerDetails" method="post">
    <input type="hidden" name="bookingId" value="1">
  
    <% for (int i = 1; i <= 4; i++) { %>
        <fieldset>
            <legend>Passenger <%= i %></legend>
            <label for="firstName<%= i %>">First Name:</label>
            <input type="text" id="firstName<%= i %>" name="firstName<%= i %>" required>

            <label for="lastName<%= i %>">Last Name:</label>
            <input type="text" id="lastName<%= i %>" name="lastName<%= i %>" required>

            <label for="age<%= i %>">Age:</label>
            <input type="number" id="age<%= i %>" name="age<%= i %>" required>

            <label for="mobile<%= i %>">Mobile:</label>
            <input type="text" id="mobile<%= i %>" name="mobile<%= i %>" required>

            <label for="email<%= i %>">Email:</label>
            <input type="text" id="email<%= i %>" name="email<%= i %>" required>

            <label for="gender<%= i %>">Gender:</label>
            <input type="text" id="gender<%= i %>" name="gender<%= i %>" required>
        </fieldset>
    <% } %>
    <button class="Button_container" style=" background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            margin-top: 10px;" type="submit">Submit</button>
</form>

    </div>
</body>
</html>

