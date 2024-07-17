<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navigation Bar</title>
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
            position:stickey;
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
        /* Dropdown menu styles */
.flight-options-dropdown {
    position: absolute;
    top: 100%; /* Position dropdown below the nav-link */
    left: 0;
    background-color: #fff; /* Background color for dropdown */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add shadow for dropdown */
    display: none; /* Hide dropdown by default */
}

/* Dropdown menu links */
.flight-options-dropdown a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

/* Change color of dropdown links on hover */
.flight-options-dropdown a:hover {
    background-color: #f1f1f1;
}

/* Show the dropdown menu when hovered over the parent link */
.nav-link:hover .flight-options-dropdown {
    display: block; /* Show dropdown on hover */
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
                <div class="nav-link"><a href="adminhome.jsp"><i class="fas fa-home"></i> Home</a></div>
              
                <div class="nav-link"><a href="addflights.jsp"><i class="fas fa-plane"></i> Add Flights</a></div>
            <div class="nav-link" id="flight-options">
    <a href="#"><i class="fas fa-plane"></i> Modify</a>
    <div class="flight-options-dropdown">
     <a href="update_flights.jsp" id="update-option">Update</a>
        <a href="delete_flight.jsp" id="remove-option">Remove</a>
       
   
</div></div>
                <div class="nav-link"><a href="details_button_a.jsp"><i class="fas fa-plane"></i> User Details</a></div>
      
        
            <div class="nav-link"><form id="disputes" action="userdispute" method="post">
                        <button type="submit"><i class="fas fa-user-circle"></i> Disputes</button>
                    </form></div>

             </div>  </div>
             <div class="right-links">
                <div class="nav-link">
                    <form id="logoutForm" action="logout" method="get">
                        <button type="submit"><i class="fas fa-user-circle"></i> Logout</button>
                    </form>
                </div>
            </div>   
  
</header>
</body>
</html>
