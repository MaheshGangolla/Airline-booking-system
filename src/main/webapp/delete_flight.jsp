<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="navbar_a.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Airline Homepage</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="styles.css">
</head>
<style>




.form-container {
      
       border: 2px solid #007bff; /* Border color for the container */
    border-radius: 5px; /* Add border radius for rounded corners
        /* Add border radius for rounded corners */
        padding: 10px;
        /* Add padding around the form */
        margin: auto;
        /* Center the form horizontally */
        max-width: 500px;
        /* Limit the maximum width of the form */
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        /* Add box shadow for depth */
    }

    .container-xxl {
        padding-top: 10px;
        /* Adjust top padding as needed */
        background-color: #f8f9fa;
        /* Light gray background color */
    }

    .container {
        background-color: #ffffff;
        /* White background color */
        border-radius: 5px;
        /* Add border radius for rounded corners */
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        /* Add box shadow for depth */
        padding: 30px;
        /* Add padding inside the container */
    }

    .text-primary {
        color: #007bff;
        /* Primary text color */
    }

    .form-floating {
        margin-bottom: 20px;
        /* Add bottom margin for spacing between form fields */
    }

    .form-floating label {
        margin-left: 10px;
        /* Adjust left margin for label positioning */
    }

    .btn-primary {
        background-color: #f74e3b;
        /* Button background color */
        border: none;
        /* Remove button border */
        color: #fff;
        /* Button text color */
        width: 100px;
        /* Set the width of the button */
        margin: auto;
        /* Center the button horizontally */
        display: block;
        /* Ensure the button is displayed as a block element */
        padding: 8px;
        /* Add padding to the button */
        font-size: 16px;
        /* Adjust font size */
    }

    .btn-primary:hover {
        background-color: #ff604f;
        /* Darker color on hover */
    }

    .form-control {
        text-align: center;
        /* Center-align the form controls */
        width: 100%;
        /* Make the form controls fill the container width */
    }

    .search-container button {
        background-color: #f74e3b;
        /* Set button background color to black */
        color: white;
        /* Set button text color to white */
        border: none;
        /* Remove button border */
        border-radius: 17px;
        /* Add border radius for rounded corners */
        padding: 15px 15px;
        /* Add padding for button size */
        font-size: 16px;
        /* Adjust font size */
        cursor: pointer;
        /* Add pointer cursor on hover */
        transition: background-color 0.3s;
        /* Smooth transition on hover */
    }

    .search-container button:hover {
        background-color: #ff604f;
        /* Darker color on hover */
        transform: scale(1.1);
        /* Scale the button by 10% on hover */
    }


html, body {
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
     overflow-x: hidden;
}

</style>
<body>


<br>
<br>
<br>
<br>
<br>
<br>
<div class="form-container">
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h3 style="color:red"><%= (request.getParameter("msg") != null) ? request.getParameter("msg") : ""%></h3>
                    <h6 class="section-title text-center text-primary text-uppercase">Delete Flights From DataBase</h6>
                    <h1 class="mb-5">Delete an <span class="text-primary text-uppercase">Existing Flight</span></h1>
                </div>
                <div class="row g-5">
                    <div class="wow fadeInUp" data-wow-delay="0.2s">
                        <form method="post" action="delete_flight_validation.jsp">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="form-floating">
                                      <label>Enter Flight ID</label>
 										<input type="text" class="form-control" placeholder="Enter Flight flight Id" name="flight_Id" value="<%= (request.getParameter("flightId") != null) ? request.getParameter("flightId") : "" %>">                                      
                                      
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                    <label>Enter Flight Number</label>
                                        <input type="text" class="form-control" placeholder="Enter Flight Number" name="flight_no" value="<%= (request.getParameter("flightNo") != null) ? request.getParameter("flightNo") : "" %>">
                                        
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <select class="form-select" name="flight_name" id="flight_name">
                                                <option selected><%= (request.getParameter("fname") != null) ? request.getParameter("fname") : "Enter Flight Name" %></option>
                                                <option value="AirAsia India">AirAsia India</option>
                                                <option value="Air India">Air India</option>
                                                <option value="Air India Express">Air India Express</option>
                                                <option value="Go First">Go First</option>
                                                <option value="IndiGo">IndiGo</option>
                                                <option value="SpiceJet">SpiceJet</option>
                                                <option value="Vistara">Vistara</option>
                                                <option value="Alliance Air">Alliance Air</option>
                                                <option value="FlyBig">FlyBig</option>
                                                <option value="Star Air">Star Air</option>
                                                <option value="TruJet">TruJet</option>
                                                <option value="TajAir">TajAir</option>
                                                <option value="SpiceXpress">SpiceXpress</option>
                                                <option value="Quikjet Airlines">Quikjet Airlines</option>
                                                <option value="Blue Dart Aviation">Blue Dart Aviation</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                  
                                </div>

                                <div class="col-12"></div>

                                <div class="search-container">
                                    <button class="btn btn-primary w-100 py-3" type="submit"><b>Delete Flight</b></button>
                                </div>
                                <div class="col-12" style="margin-bottom: 12%;"></div>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>


<script>
    $(function() {
        $("#from-date").datepicker();
        $("#to-date").datepicker();
    });
</script>

</body>
</html>
