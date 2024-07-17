<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="navbar_a.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PNR Form</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <link rel="stylesheet" href="styles.css">
</head>
<style>

body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

h2 {
    text-align: center;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 20px;
    text-align: center;
}

label {
    display: block;
    margin-bottom: 5px;
}

input[type="text"] {
    width: 100%;
    padding: 4px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

button {
    width: 100%;
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
     background-color: #ff604f; /* Darker color on hover */
   /*  transform: scale(1.2); Scale the button by 10% on hover */
    
}




.search-container button {
    background-color:#f74e3b; /* Set button background color to black */
    color: white; /* Set button text color to white */
    border: none; /* Remove button border */
    border-radius: 10px; /* Add border radius for rounded corners */
    padding: 8px 8px; /* Add padding for button size */
    font-size: 15px; /* Adjust font size */
    cursor: pointer; /* Add pointer cursor on hover */
    transition: background-color 0.3s; /* Smooth transition on hover */
}

.search-container button:hover {
    background-color: #ff604f; /* Darker color on hover */
    transform: scale(1.2); /* Scale the button by 10% on hover */
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

    <div class="container">
        <h2>Admin - Enter PNR</h2>
        <form method="post" action="SearchPNR" >
            <div class="form-group">
                <label for="pnr">PNR:</label>
                <input type="text" id="pnr" name="pnr" placeholder="Enter PNR" required>
            </div>
            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
