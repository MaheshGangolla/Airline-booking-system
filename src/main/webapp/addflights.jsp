<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="navbar_a.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
            <title>Flights</title>
</head>
<style>
.form-container {
    border: 2px solid #007bff; /* Border color for the container */
    border-radius: 10px; /* Add border radius for rounded corners */
    padding: 10px; /* Add padding around the form */
    margin: auto; /* Center the form horizontally */
    max-width: 500px; /* Limit the maximum width of the form */
    box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1); /* Add box shadow for depth */
}

.container-xxl {
    padding-top: 10px; /* Adjust top padding as needed */
    background-color: #f8f9fa; /* Light gray background color */
}

.container {
    background-color: #ffffff; /* White background color */
    border-radius: 10px; /* Add border radius for rounded corners */
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Add box shadow for depth */
    padding: 30px; /* Add padding inside the container */
}

.text-primary {
    color: #007bff; /* Primary text color */
}

.form-floating {
    margin-bottom: 20px; /* Add bottom margin for spacing between form fields */
}

.form-floating label {
    margin-left: 10px; /* Adjust left margin for label positioning */
}

.btn-primary {
    background-color: #f74e3b; /* Button background color */
    border: none; /* Remove button border */
    color: #fff; /* Button text color */
    width: 100px; /* Set the width of the button */
    margin: auto; /* Center the button horizontally */
    display: block; /* Ensure the button is displayed as a block element */
    padding: 10px; /* Add padding to the button */
    font-size: 16px; /* Adjust font size */
}

.btn-primary:hover {
    background-color: #ff604f; /* Darker color on hover */
}

.form-control {
    text-align: center; /* Center-align the form controls */
    width: 100%; /* Make the form controls fill the container width */
}

.search-container button {
    background-color:#f74e3b; /* Set button background color to black */
    color: white; /* Set button text color to white */
    border: none; /* Remove button border */
    border-radius: 17px; /* Add border radius for rounded corners */
    padding: 15px 15px; /* Add padding for button size */
    font-size: 16px; /* Adjust font size */
    cursor: pointer; /* Add pointer cursor on hover */
    transition: background-color 0.3s; /* Smooth transition on hover */
}

.search-container button:hover {
       background-color: #ff604f; /* Darker color on hover */
    transform: scale(1.1); /* Scale the button by 10% on hover */
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

        <!-- Adding From -->
     <div class="form-container">   
        <div class="container-xxl py-5">
            <div class="container">
          
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                   
                    <h6 class="section-title text-center text-primary text-uppercase">Add Flights To DataBase</h6>
                    <h1 class="mb-5">Add A <span class="text-primary text-uppercase">New Flight</span></h1>
                </div>
                <div class="row g-5">
                        <div class="wow fadeInUp" data-wow-delay="0.2s">
                            <form method="post" action="add_flight_validation.jsp"  onsubmit="return validateForm()">
                                <div class="row g-3">
                                
                                    <div class="col-md-6">
                                     <label>Enter Flight ID</label>
                                        <div class="form-floating">
                                            <input type="text" class="form-control" placeholder="Enter Flight ID" name="flight_id">
                                           
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                    <label>Enter Flight Number</label>
                                        <div class="form-floating">
                                            <input type="text" class="form-control" placeholder="Enter Flight Number" name="flight_no">
                                            
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <select class="form-select" name="flight_name" id="flight_name">
                                                <option selected>Enter Flight Name</option>
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
                                        <div class="form-floating">
                                            
                                        </div>
                                    </div>
                                    
                                    <div class="col-12"></div>
                                    
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <select class="form-select" name="from_city" id="from_city">
                                         <option value="Ahmedabad Airport - AMD">Ahmedabad Airport - AMD</option>
                                                <option value="Amritsar Airport - LUH">Amritsar Airport - LUH</option>
                                                <option value="Bengaluru International Airport - BLR">Bengaluru International Airport - BLR</option>
                                                <option value="Bhopal Airport - BHO">Bhopal Airport - BHO</option>
                                                <option value="Bhubaneswar Airport - BBI">Bhubaneswar Airport - BBI</option>
                                                <option value="Chandigarh Airport - IXC">Chandigarh Airport - IXC</option>
                                                <option value="Chennai International Airport - MAA">Chennai International Airport - MAA</option>
                                                <option value="Mumbai Chhatrapati Shivaji International Airport - BOM">Chhatrapati Shivaji International Airport - BOM</option>
                                                <option value="Cochin International Airport - COK">Cochin International Airport - COK</option>
                                                <option value="Udaipur Dabok Airport - UDR">Dabok Airport - UDR</option>
                                                <option value="Goa Dabolim Airport - GOI">Dabolim Airport - GOI</option>
                                                <option value="Darjeeling Airport - DAI">Darjeeling Airport - DAI</option>
                                                <option value="DehraDun Airport - DED">Dehra Dun Airport - DED</option>
                                                <option value="Indore Devi Ahilyabai Holkar Airport - IDR">Devi Ahilyabai Holkar Airport - IDR</option>                                             
                                                <option value="Gaya Airport - GAY">Gaya Airport - GAY</option>
                                                <option value="Hyderabad International Airport - HYD">Hyderabad International Airport - HYD</option>
                                                <option value=" Delhi Indira Gandhi International Airport - DEL">Indira Gandhi International Airport - DEL</option>
                                                <option value="Jabalpur Airport - JLR">Jabalpur Airport - JLR</option>
                                                <option value="Jaisalmer Airport - JSA">Jaisalmer Airport - JSA</option>
                                                <option value="Jodhpur Airport - JDH">Jodhpur Airport - JDH</option>
                                                <option value="Kanpur Airport - KNU">Kanpur Airport - KNU</option>
                                                <option value="Kota Airport - KTU">Kota Airport - KTU</option>
                                               <option value="Mysore Airport - MYQ">Mysore Airport - MYQ</option>
                                                <option value="Kolkata Netaji Subhash Chandra Bose International Airport - CCU">Netaji Subhash Chandra Bose International Airport - CCU</option>
                                                <option value="Patna Airport - PAT">Patna Airport - PAT</option>
                                                <option value="Pondicherry Airport - PNY">Pondicherry Airport - PNY</option>
                                                <option value="Raipur Airport - RPR">Raipur Airport - RPR</option>
                                                <option value="Rajkot Airport - RAJ">Rajkot Airport - RAJ</option>
                                                <option value="Rourkela Airport - RRK">Rourkela Airport - RRK</option>
                                                <option value="Satwari Airport - IXJ">Satwari Airport - IXJ</option>
                                                <option value="Simla Airport - SLV">Simla Airport - SLV</option>
                                                <option value="Srinagar Airport - SXR">Srinagar Airport - SXR</option>
                                                <option value="Surat Airport - STV">Surat Airport - STV</option>
                                                <option value="Tirupati Airport - TIR">Tirupati Airport - TIR</option>
                                                <option value="Trichy Airport - TRZ">Trichy Airport - TRZ</option>
                                                <option value="Varanasi Airport - VNS">Varanasi Airport - VNS</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <select class="form-select" name="to_city" id="to_city">
                                          <option value="Ahmedabad Airport - AMD">Ahmedabad Airport - AMD</option>
                                                <option value="Amritsar Airport - LUH">Amritsar Airport - LUH</option>
                                                <option value="Bengaluru International Airport - BLR">Bengaluru International Airport - BLR</option>
                                                <option value="Bhopal Airport - BHO">Bhopal Airport - BHO</option>
                                                <option value="Bhubaneswar Airport - BBI">Bhubaneswar Airport - BBI</option>
                                                <option value="Chandigarh Airport - IXC">Chandigarh Airport - IXC</option>
                                                <option value="Chennai International Airport - MAA">Chennai International Airport - MAA</option>
                                                <option value="Mumbai Chhatrapati Shivaji International Airport - BOM">Chhatrapati Shivaji International Airport - BOM</option>
                                                <option value="Cochin International Airport - COK">Cochin International Airport - COK</option>
                                                <option value="Udaipur Dabok Airport - UDR">Dabok Airport - UDR</option>
                                                <option value="Goa Dabolim Airport - GOI">Dabolim Airport - GOI</option>
                                                <option value="Darjeeling Airport - DAI">Darjeeling Airport - DAI</option>
                                                <option value="DehraDun Airport - DED">Dehra Dun Airport - DED</option>
                                                <option value="Indore Devi Ahilyabai Holkar Airport - IDR">Devi Ahilyabai Holkar Airport - IDR</option>                                             
                                                <option value="Gaya Airport - GAY">Gaya Airport - GAY</option>
                                                <option value="Hyderabad International Airport - HYD">Hyderabad International Airport - HYD</option>
                                                <option value=" Delhi Indira Gandhi International Airport - DEL">Indira Gandhi International Airport - DEL</option>
                                                <option value="Jabalpur Airport - JLR">Jabalpur Airport - JLR</option>
                                                <option value="Jaisalmer Airport - JSA">Jaisalmer Airport - JSA</option>
                                                <option value="Jodhpur Airport - JDH">Jodhpur Airport - JDH</option>
                                                <option value="Kanpur Airport - KNU">Kanpur Airport - KNU</option>
                                                <option value="Kota Airport - KTU">Kota Airport - KTU</option>
                                               <option value="Mysore Airport - MYQ">Mysore Airport - MYQ</option>
                                                <option value="Kolkata Netaji Subhash Chandra Bose International Airport - CCU">Netaji Subhash Chandra Bose International Airport - CCU</option>
                                                <option value="Patna Airport - PAT">Patna Airport - PAT</option>
                                                <option value="Pondicherry Airport - PNY">Pondicherry Airport - PNY</option>
                                                <option value="Raipur Airport - RPR">Raipur Airport - RPR</option>
                                                <option value="Rajkot Airport - RAJ">Rajkot Airport - RAJ</option>
                                                <option value="Rourkela Airport - RRK">Rourkela Airport - RRK</option>
                                                <option value="Satwari Airport - IXJ">Satwari Airport - IXJ</option>
                                                <option value="Simla Airport - SLV">Simla Airport - SLV</option>
                                                <option value="Srinagar Airport - SXR">Srinagar Airport - SXR</option>
                                                <option value="Surat Airport - STV">Surat Airport - STV</option>
                                                <option value="Tirupati Airport - TIR">Tirupati Airport - TIR</option>
                                                <option value="Trichy Airport - TRZ">Trichy Airport - TRZ</option>
                                                <option value="Varanasi Airport - VNS">Varanasi Airport - VNS</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                     <label for="checkin">Date Of Flight</label>
                                        <div class="form-floating date">
                                            <input type="date" class="form-control" placeholder="Date Of Flight" name="date_of_flight">
                                           
                                        </div>
                                    </div>
                                                                       
                                    <div class="col-12"></div>
                                    
                                    <div class="col-md-6">
                                             <label>Departure Time</label>
                                        <div class="form-floating">
                                            <input type="text" class="form-control" placeholder="Enter Flight Departure Time HH:MM:SS" name="flight_arrival_time">
                                   
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                      <label>Flight Arrival Time</label>
                                        <div class="form-floating">
                                            <input type="text" class="form-control" placeholder="Enter Flight Arrival Time HH:MM:SS" id="frt" name="flight_reach_time">
                                          
                                        </div>
                                    </div>
                                    
                                    <div class="col-12"></div>
                                    
                                    <div class="col-md-6">
                                     <label>First Class Seats</label>
                                        <div class="form-floating">
                                            <input type="text" class="form-control" placeholder="Enter First Class Seat" name="first_class_seat">
                                           
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                         <label>First Class Seat Price</label>
                                        <div class="form-floating">
                                            <input type="text" class="form-control" placeholder="Enter First Class Seat Price" name="first_class_price">
                                       
                                        </div>
                                    </div>
                                    
                                    <div class="col-12"></div>
                                    
                                    <div class="col-md-6">
                                       <label>Business Class Seats</label>
                                        <div class="form-floating">
                                            <input type="text" class="form-control" placeholder="Enter Business Class Seat" name="buss_class_seat">
                                         
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                                <label>Business Class Seat Price</label>
                                        <div class="form-floating">
                                            <input type="text" class="form-control" placeholder="Enter Business Class Seat Price" name="buss_class_price">
                                
                                        </div>
                                    </div>
                                    
                                    <div class="col-12"></div>
                                    
                                    <div class="col-md-6">
                                                       <label>Economy Class Seats</label>
                                        <div class="form-floating">
                                            <input type="text" class="form-control" placeholder="Enter Economy Class Seat" name="eco_class_seat">
                         
                                        </div>
                                    </div>
                                                                       
                                    <div class="col-md-6">
                                                <label>Economy Class Seat Price</label>
                                        <div class="form-floating">
                                            <input type="text" class="form-control" placeholder="Enter Economy Class Seat Price" name="eco_class_price">
                                
                                        </div>
                                    </div>
                                    
                                    <div class="search-container">
                                        <button class="btn btn-primary w-100 py-3" type="submit"><b>Add Flight</button>
                                    </div>
                                    <div class="col-12" style="margin-bottom: 12%;"><div class="form-floating"></div></div>
                                </div>
                            </form>
                        </div>
                    
                </div>
            </div>
        </div>
    </div>    
      

 <script>
 		
        function validateForm() {
            const flightId = document.getElementsByName("flight_id")[0].value.trim();
            const flightNo = document.getElementsByName("flight_no")[0].value.trim();
            const flightName = document.getElementById("flight_name").value;
            const fromCity = document.getElementById("from_city").value;
            const toCity = document.getElementById("to_city").value;
            const dateOfFlight = document.getElementsByName("date_of_flight")[0].value;
            const flightArrivalTime = document.getElementsByName("flight_arrival_time")[0].value.trim();
            const flightReachTime = document.getElementsByName("flight_reach_time")[0].value.trim();
            const firstClassSeat = document.getElementsByName("first_class_seat")[0].value.trim();
            const firstClassPrice = document.getElementsByName("first_class_price")[0].value.trim();
            const bussClassSeat = document.getElementsByName("buss_class_seat")[0].value.trim();
            const bussClassPrice = document.getElementsByName("buss_class_price")[0].value.trim();
            const ecoClassSeat = document.getElementsByName("eco_class_seat")[0].value.trim();
            const ecoClassPrice = document.getElementsByName("eco_class_price")[0].value.trim();

            if (flightId.length !== 6 || flightNo.length !== 6) {
                alert("Flight ID and Number must be exactly 6 characters long.");
                return false;
            }

            if (flightName === "Enter Flight Name" || fromCity === "Departure City Name" || toCity === "Arrival City Name" || !dateOfFlight) {
                alert("Please fill all the fields.");
                return false;
            }

            if (fromCity === toCity) {
                alert("Departure and arrival cities cannot be the same.");
                return false;
            }

            const timePattern = /^([01]\d|2[0-3]):([0-5]\d):([0-5]\d)$/;
            if (!timePattern.test(flightArrivalTime) || !timePattern.test(flightReachTime)) {
                alert("Please enter valid times in HH:MM:SS format.");
                return false;
            }

            const numericFields = [firstClassSeat, firstClassPrice, bussClassSeat, bussClassPrice, ecoClassSeat, ecoClassPrice];
            if (numericFields.some(field => isNaN(field) || field === "")) {
                alert("Seats and prices fields must contain only numbers.");
                return false;
            }

            return true;
        }
    </script>
</body>

</html>