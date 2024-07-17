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
            background-color: #fffff;
        }
        header {
            background-color: #05203c;
            padding: 10px 20px; /* Adjusted padding for better alignment */
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 15px;
            color: white;
            height: 70px; /* Increased height for better spacing */
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
        .center-links {
            display: flex;
            justify-content: center;
            flex-grow: 1;
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
            text-decoration: none; /* Ensure no underline */
            background: none; /* Remove background */
            border: none; /* Remove border */
            cursor: pointer; /* Ensure cursor is pointer */
            display: flex; /* Align items center */
            align-items: center;
        }
        .nav-link {
            margin: 0 4px; /* Adjusted margin for better spacing */
            position: relative;
                padding: 0 16px 0 16px;
            border-radius: 20px;
            display: flex;
            align-items: center;
            font-family: monospace;
            font-size: 15px;
            height: 40px; /* Adjusted height for better alignment */
            border: 1px solid white;
        }
        .nav-link:hover {
            color: black;
            background-color:#f7d23e;
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
            </div>
            <div class="center-links">
                <div class="nav-link"><a href="userhome.jsp"><i class="fas fa-home"></i> Home</a></div>
                <div class="nav-link"><a href="flightDetails_u.jsp"><i class="fas fa-plane"></i> Flight Details</a></div>
                <div class="nav-link"><form id="history" action="bookinghistory" method="post">
                        <button type="submit"><i class="fas fa-history" style="padding:2px"></i> History</button>
                    </form></div>
                <div class="nav-link"><a href="support.jsp"><i class="fas fa-question-circle"></i> Support</a></div>
                <div class="nav-link">
                    <form id="details" action="viewDetails" method="post">
                        <button type="submit"><i class="fas fa-user" style="padding:2px"></i> Profile</button>
                    </form>
                </div>
            </div>
           <div class="nav-link">   
        <div class="logout-btn"><a href="login_u.jsp"><i class="fas fa-user"></i>Login</a></div>
</div>

        </div>
    </header>
</body>
</html>
