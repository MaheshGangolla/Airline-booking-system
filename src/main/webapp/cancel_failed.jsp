<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ticket Cancellation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            text-align: center;
            background-color: #ffffff;
            padding: 40px 60px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .container h1 {
            color: #d9534f;
            font-size: 36px;
        }
        .container p {
            font-size: 18px;
            color: #333;
        }
        .container a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #0275d8;
            color: #ffffff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .container a:hover {
            background-color: #025aa5;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Ticket Not cancelledCancelled</h1>
        <p>Your ticket cancellation failed.</p>
        <a href="history_U.jsp">Go to booking history</a>
    </div>
</body>
</html>
