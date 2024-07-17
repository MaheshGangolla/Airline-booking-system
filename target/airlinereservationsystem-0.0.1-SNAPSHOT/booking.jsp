<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Booking Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border: 2px solid #007bff; /* Border color for the container */
        }
        .form-floating {
            margin-bottom: 20px;
        }
        .form-floating label {
            color: #333;
        }
        .form-floating input, .form-floating select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .btn-primary {
            background-color: #f74e3b;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 0;
            cursor: pointer;
            width: 100%;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .center-container {
            position: absolute;
            left: 50%;
            top: 9%;
            transform: translate(-50%, -50%);
            text-align: center;
        }
        .call-support {
            position: fixed;
            bottom: 20px;
            right: 20px;
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            z-index: 9999; /* Ensure it's above other content */
        }
        .call-support a {
            text-decoration: none;
            color: #fff; /* White text color */
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            display: flex;
            align-items: center;
        }
        .call-support a i {
            margin-right: 10px;
        }
        footer {
            background-color: #ecf0c7; /* Set the background color to dark gray */
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
        .passenger-fieldset {
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
        }
        .passenger-legend {
            font-weight: bold;
            margin-bottom: 10px;
            font-size: 20px;
        }
        .passenger-label {
            display: block;
            margin-bottom: 5px;
            font-size: 16px;
        }
    </style>
      <script>
        function booking_validate() {
            const username = document.getElementById("username").value;
            const flightId = document.getElementById("flight_id").value;
            const flightNo = document.getElementById("flight_No").value;
            const noOfSeats = document.getElementById("noOfPassengers").value;
            const adults = document.getElementById("adults").value;
            const dateOfFlight = document.getElementById("date_of_flight").value;
            const mobile = document.getElementById("mobile").value;
            const email = document.getElementById("email").value;
            const age = document.getElementById("age").value;
            const name = document.getElementById("name").value;
            const gender = document.getElementById("gender").value;

            if (username === "") {
                alert("Please Enter Username!");
                return false;
            } else if (flightId === "") {
                alert("Please Enter Flight Id!");
                return false;
            } else if (flightNo === "") {
                alert("Please Enter Plane No!");
                return false;
            } else if (noOfSeats === "") {
                alert("Please Enter Total Number Of Seats");
                return false;
            } else if (adults === "") {
                alert("Please Enter Number Of Adults!");
                return false;
            } else if (parseInt(adults) > parseInt(noOfSeats)) {
                alert("Number of adults cannot exceed the number of passengers!");
                return false;
            } else if (dateOfFlight === "") {
                alert("Please Enter Date Of Flight!");
                return false;
            } else if (!/^[a-zA-Z]+$/.test(name)) {
                alert("Please Enter a valid Name!");
                return false;
            } else if (age === "" || isNaN(age) || age <= 0 || age > 120) {
                alert("Please Enter a valid Age!");
                return false;
            } else if (mobile === "" || isNaN(mobile) || mobile.length < 10 || mobile.length > 15) {
                alert("Please Enter a valid Mobile Number!");
                return false;
            } else if (email === "" || !/\S+@\S+\.\S+/.test(email)) {
                alert("Please Enter a valid Email Address!");
                return false;
            } else if (gender === "") {
                alert("Please Select Gender!");
                return false;
            }
            return true;
        }
    </script>
    <script>
    function checkCoupon() {
        const couponCode = document.getElementById("coupon").value;
        
        // Make an AJAX request to check if the coupon exists
        const xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    // Coupon exists in the table
                    alert("Coupon is valid!");
                } else {
                    // Coupon does not exist in the table
                    alert("Invalid coupon code!");
                }
            }
        };
        xhr.open("GET", "check_coupon.php?coupon=" + couponCode, true);
        xhr.send();
    }
</script>
    
</head>
<body>
    <div class="container">
        <form name="m_f" method="post" action="user_booking_validation" onsubmit="return booking_validate();">
            <div class="row g-3">
                <div class="col-md-6">
                    <div class="form-floating">
                        <label for="username">Your User Name</label>
                        <input type="text" class="form-control" id="username" placeholder="Your User Name" name="username" value="<%= session.getAttribute("username") %>" required >
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="hidden" class="form-control" id="flight_id" placeholder="Plane Id" name="flight_id" value="<%= (request.getParameter("flightId") != null) ? request.getParameter("flightId") : "" %>" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="hidden" class="form-control" id="flight_No" placeholder="Plane No" name="flight_No" value="<%= (request.getParameter("flightNo") != null) ? request.getParameter("flightNo") : "" %>" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <label for="ticket_type">Select Ticket Type</label>
                        <select class="form-select" id="ticket_type" name="ticket_type" required>
                            <option value="" disabled selected>Select Ticket Type</option>
                            <option value="Business Class">Business Class</option>
                            <option value="First Class">First Class</option>
                            <option value="Coach Class">Coach Class</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <label for="Departure">Departure</label>
                        <input type="text" class="form-control" id="Departure" placeholder="Departure" name="Departure" value="<%= (request.getParameter("fromCity") != null) ? request.getParameter("fromCity") : "" %>" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <label for="destination">Destination</label>
                        <input type="text" class="form-control" id="Destination" placeholder="Destination" name="destination" value="<%= (request.getParameter("toCity") != null) ? request.getParameter("toCity") : "" %>" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <label for="date_of_flight">Date Of Flight</label>
                        <input type="date" class="form-control" id="date_of_flight" placeholder="Date" name="date_of_flight" value="<%= request.getParameter("date") %>" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <label for="noOfPassengers">Number of Passengers: </label>
                        <input type="number" id="noOfPassengers" name="noOfPassengers" value=1 required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <label for="adults">Select Number Of Adults</label>
                        <input type="number" class="form-control" id="adults" placeholder="Total Number Of Adults" name="adults" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <label for="name">Passenger Name</label>
                        <input type="text" class="form-control" id="name" placeholder="Passenger Name" name="pname" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <label for="age">Age</label>
                        <input type="number" class="form-control" id="age" placeholder="Age" name="age" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <label for="mobile">Mobile</label>
                        <input type="text" class="form-control" id="mobile" placeholder="Mobile" name="mobile" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" placeholder="Email" name="email" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <label for="Gender">Gender</label>
                        <input type="gender" class="form-control" id="gender" placeholder="gender" name="gender" required>
                    </div>
                </div>
                <div class="col-md-6">
    <div class="form-floating">
        <label for="coupon">Coupon Code</label>
        <input type="text" class="form-control" id="coupon" placeholder="Enter Coupon Code" name="coupon">
    </div>
</div>

                <div class="col-12">
                    <div class="form-floating">
                        <button class="btn btn-primary" type="submit">Book Now</button>
                    </div>
                </div>
                
                <div class="call-support">
                   
                    <a href="support.jsp"><i class="fas fa-question-circle"></i> Support</a>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
