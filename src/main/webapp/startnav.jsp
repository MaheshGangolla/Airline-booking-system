<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #ffffff;
        }

        header {
            background-color: #004080;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 15px;
            color: white;
            height: 70px;
            border-bottom: 1px solid white;
        }

        .topnav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
        }

        .left-links {
            display: flex;
            align-items: center;
        }

        .right-links {
            display: flex;
            align-items: center;
        }

        .airline {
            margin-right: 20px;
            font-size: 35px;
            font-weight: bold;
            color: white;
        }

        .nav-link a, .nav-link button {
            color: white;
            text-decoration: none;
            background: none;
            border: none;
            cursor: pointer;
            display: flex;
            align-items: center;
        }

        .nav-link {
            margin: 0 10px;
            position: relative;
            padding: 8px 16px;
            border-radius: 20px;
            display: flex;
            align-items: center;
            font-family: monospace;
            font-size: 15px;
            height: 40px;
            border: 1px solid white;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .nav-link:hover {
            color: black;
            background-color: #f7d23e;
        }

        .nav-link:hover a, .nav-link:hover button {
            color: black;
        }
    </style>
</head>
<body>
    <header>
        <div class="topnav">
            <div class="left-links">
                <span class="airline"><i class="fas fa-plane"></i> Airline</span>
                <div class="nav-link"><a href="index.jsp"><i class="fas fa-home"></i> Home</a></div>
            </div>
            <div class="right-links">
                <div class="nav-link"><a href="login_u.jsp"><i class="fas fa-user"></i> Login</a></div>
            </div>
        </div>
    </header>
</body>
</html>
