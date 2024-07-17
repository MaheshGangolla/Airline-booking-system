<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="navbar_a.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Details</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<style>

body {
    margin: 0;
    font-family: Arial, sans-serif;
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



.icon-link {
    position: relative;
    color:white;
}

.flight-options-dropdown {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 120px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.flight-options-dropdown a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.flight-options-dropdown a:hover {
    background-color: #f1f1f1;
}

#flight-options:hover .flight-options-dropdown {
    display: block;
}

.middle-content {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100vh;
}
.button{
background-color:#f74e3b;
 border: none; /* Remove button border */
    color: #fff; /* Button text color */
    width: 100px; /* Set the width of the button */
    margin: auto; /* Center the button horizontally */
    display: block; /* Ensure the button is displayed as a block element */
    padding: 5px; /* Add padding to the button */
    font-size: 13px; /* Adjust font size */
    font-style:oblique;
}
.button:hover{
 background-color: #ff604f; /* Darker color on hover */
    transform: scale(1.2); /* Scale the button by 10% on hover */
}


</style>
<body>
    
    
    <div class="middle-content">
        <h2>Click here for user details</h2>
        <form action="userdetails" method="post">
            <button class ="button"  type="submit">View details</button>
        </form>
    </div>

</body>
</html>
