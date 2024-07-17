<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .error-container {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #e74c3c;
            font-size: 36px;
            margin-bottom: 10px;
        }

        p {
            color: #333;
            font-size: 18px;
            margin-bottom: 20px;
        }

        a {
            color: #2980b9;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    



    <div class="error-container">
        <h1>Oops! Something went wrong.</h1>
        <p>We're sorry, but there was an error processing your request.</p>
        <p>Please <a href="login_u.jsp">click here</a> to return to the previous page.</p>
    </div>
</body>
</html>
