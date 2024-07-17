<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>
<%
    // Check if the session is not created
    if (session.getAttribute("username") == null) {
        // Redirect to login.jsp
        String originalURL = request.getRequestURI();
        session.setAttribute("originalURL", originalURL);
        response.sendRedirect("login_u.jsp");
        // End processing this JSP
        return;
    }
%>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="styles.css">
   
</head>
<style>
body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    overflow: hidden; /* Prevent scrolling */
    background-color: #000;
  
}



.video-container {
    position: relative;
    overflow: hidden;
    width: 100%;
    height: 100vh;
    color:black;
}

.video-background {
    min-width: 100%;
    min-height: 100%;
    width: auto;
    height: auto;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    opacity: 0.5;
}

.overlay-content {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    z-index: 2; /* Ensure content is above the video overlay */
    color: #fff;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 15px;
}
.overlay-content form {
    display: flex; /* Set the form to flex layout */
    flex-wrap: wrap; /* Allow wrapping of items */
    justify-content: center; /* Center align the items */
}

.overlay-content form .col-md-4 {
    flex: 0 0 calc(33.33% - 20px); /* Set each column to one-third of the container width */
    margin: 10px; /* Add margin between columns */
}

.overlay-content form label {
    font-weight: bold; /* Make labels bold */
    font-size: 16px; /* Increase label font size */
    text-align: left; /* Align labels to the left */
    display: block; /* Ensure each label is on its own line */
    margin-bottom: 5px; /* Add bottom margin for spacing */
}

.overlay-content form .form-select {
    width: 100%; /* Set the width of select fields to 100% */
    padding: 8px; /* Adjust padding for select fields */
    margin-bottom: 10px; /* Add bottom margin for spacing */
}

.overlay-content label {
    font-weight: bold; /* Make labels bold */
    font-size: 15px; /* Increase label font size */
    
}

.overlay-content button {
    font-size: 14px; /* Increase button font size */
    padding: 8px 16px; /* Increase button padding */
    border-radius: 5px;
}

.overlay-content span {
    color:#f74e3b; /* Set text color to black */
}



.center-links {
    display: flex;
    justify-content: center;
    flex-grow: 1; /* Allow the links to grow to fill the space */
}

.center-links .icon-link {
    margin: 0 20px; /* Adjust spacing between links */
}

.dropdown-menu {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-menu a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-menu a:hover {
    background-color: #f1f1f1;
}



.destination-block {
    border: 2px solid black; /* Set border to black and thicker */
    border-radius: 7px; /* Add border radius for rounded corners */
    padding: 10px; /* Add padding for spacing inside the boxes */
    margin-bottom: 10px; /* Add margin bottom for spacing between boxes */
    background-color: white;
}


.destination-block span {
    font-weight: bold; /* Make span text bold */
}

.search-container button {
    background-color:#f74e3b; /* Set button background color to black */
    color: white; /* Set button text color to white */
    border: none; /* Remove button border */
    border-radius: 10px; /* Add border radius for rounded corners */
    padding: 9px 9px; /* Add padding for button size */
    font-size: 18px; /* Adjust font size */
    cursor: pointer; /* Add pointer cursor on hover */
    transition: background-color 0.3s; /* Smooth transition on hover */
}

.search-container button:hover {
    background-color: #ff604f; /* Darker color on hover */
    transform: scale(1.2); /* Scale the button by 10% on hover */
}

footer {
    background-color: #05203c;; /* Set the background color to dark gray */
    padding: 20px;
    position: absolute;
    bottom: 0;
    width: 100%;
    height:80px;
    text-align: center;
    z-index: 1; /* Ensure footer is above video */
}




.icon-link {
    position: relative;
    color:white;
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

   .form-select {
         border: 2px solid black; /* Set border to black and thicker */
        border-radius: 7px; /* Add border radius for rounded corners */
        padding: 10px; /* Add padding for spacing inside the boxes */
        margin-bottom: 10px; /* Add margin bottom for spacing between boxes */
        background-color: white;
        height:50px;
    }
    
    .form-control{
   
         border: 2px solid black; /* Set border to black and thicker */
        border-radius: 7px; /* Add border radius for rounded corners */
        padding: 8px; /* Add padding for spacing inside the boxes */
        margin-bottom: 10px; /* Add margin bottom for spacing between boxes */
        background-color: white;
        height:30px;
    
    }
    
     .container {
            background-color: rgba(0, 0,0, 0.5);;
            border: 1px solid #ddd;
            border-radius: 50px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            width: 700px;
            padding: 35px;
            text-align: center;
        }
</style>
<body>


<div class="video-container">
    <div class="black-layer"></div> <!-- Black layer behind the video -->
    <video class="video-background" autoplay loop muted>
        <source src="flight.mp4" type="video/mp4">
    </video>
</div>

    
<div class="overlay-content">

    <div class="container">

    <form method="post" action="search_flight_by_citys_u">
        <div class="row g-2">
        <h1 style="text-align: center;color:white; font-size:50px;font-family:cursive;">Flight Booking System </h1>
            <h3 class="mb-4 text-center">Search Flights<span class="text-primary text-uppercase"> <small>By From-To Cities</small></span></h3>
            <h6 class="text-start text-primary text-uppercase text-center"> <small>Search Flights By Cities</small></h6>
            <div class="col-md-4">
                <label>From City</label>
                <select class="form-select" name="from_city" id="from_city">
                    <option selected>Departure City Name</option>
                     <option value="Ahmedabad Airport - AMD">Ahmedabad Airport - AMD</option>
                                                <option value="Amritsar Airport - LUH">Amritsar Airport - LUH</option>
                                                <option value="Bagdogra Airport - IXB">Bagdogra Airport - IXB</option>
                                                <option value="Bengaluru International Airport - BLR">Bengaluru International Airport - BLR</option>
                                                <option value="Bhopal Airport - BHO">Bhopal Airport - BHO</option>
                                                <option value="Bhubaneswar Airport - BBI">Bhubaneswar Airport - BBI</option>
                                                <option value="Birsa Munda International Airport - IXR">Birsa Munda International Airport - IXR</option>
                                                <option value="Chandigarh Airport - IXC">Chandigarh Airport - IXC</option>
                                                <option value="Chennai International Airport - MAA">Chennai International Airport - MAA</option>
                                                <option value="Chhatrapati Shivaji International Airport - BOM">Chhatrapati Shivaji International Airport - BOM</option>
                                                <option value="Cochin International Airport - COK">Cochin International Airport - COK</option>
                                                <option value="Cooch Behar Airport - COH">Cooch Behar Airport - COH</option>
                                                <option value="Dabok Airport - UDR">Dabok Airport - UDR</option>
                                                <option value="Dabolim Airport - GOI">Dabolim Airport - GOI</option>
                                                <option value="Darjeeling Airport - DAI">Darjeeling Airport - DAI</option>
                                                <option value="Dehra Dun Airport - DED">Dehra Dun Airport - DED</option>
                                                <option value="Devi Ahilyabai Holkar Airport - IDR">Devi Ahilyabai Holkar Airport - IDR</option>
                                                <option value="Dhanbad Airport - DBD">Dhanbad Airport - DBD</option>
                                                <option value="Gaya Airport - GAY">Gaya Airport - GAY</option>
                                                <option value="Hyderabad International Airport - HYD">Hyderabad International Airport - HYD</option>
                                                <option value="Indira Gandhi International Airport - DEL">Indira Gandhi International Airport - DEL</option>
                                                <option value="Jabalpur Airport - JLR">Jabalpur Airport - JLR</option>
                                                <option value="Jagdalpur Airport - JGB">Jagdalpur Airport - JGB</option>
                                                <option value="Jaisalmer Airport - JSA">Jaisalmer Airport - JSA</option>
                                                <option value="Jodhpur Airport - JDH">Jodhpur Airport - JDH</option>
                                                <option value="Kanpur Airport - KNU">Kanpur Airport - KNU</option>
                                                <option value="Kota Airport - KTU">Kota Airport - KTU</option>
                                                <option value="Lohegaon Airport - PNQ">Lohegaon Airport - PNQ</option>
                                                <option value="Malda Airport - LDA">Malda Airport - LDA</option>
                                                <option value="Mysore Airport - MYQ">Mysore Airport - MYQ</option>
                                                <option value="Netaji Subhash Chandra Bose International Airport - CCU">Netaji Subhash Chandra Bose International Airport - CCU</option>
                                                <option value="Patna Airport - PAT">Patna Airport - PAT</option>
                                                <option value="Pondicherry Airport - PNY">Pondicherry Airport - PNY</option>
                                                <option value="Raipur Airport - RPR">Raipur Airport - RPR</option>
                                                <option value="Rajkot Airport - RAJ">Rajkot Airport - RAJ</option>
                                                <option value="Rourkela Airport - RRK">Rourkela Airport - RRK</option>
                                                <option value="Satwari Airport - IXJ">Satwari Airport - IXJ</option>
                                                <option value="Simla Airport - SLV">Simla Airport - SLV</option>
                                                <option value="Singerbhil Airport - IXA">Singerbhil Airport - IXA</option>
                                                <option value="Sonari Airport - IXW">Sonari Airport - IXW</option>
                                                <option value="Sonegaon Airport - NAG">Sonegaon Airport - NAG</option>
                                                <option value="Srinagar Airport - SXR">Srinagar Airport - SXR</option>
                                                <option value="Surat Airport - STV">Surat Airport - STV</option>
                                                <option value="Tirupati Airport - TIR">Tirupati Airport - TIR</option>
                                                <option value="Trichy Airport - TRZ">Trichy Airport - TRZ</option>
                                                <option value="Varanasi Airport - VNS">Varanasi Airport - VNS</option>
                                                <option value="Warangal Airport - WGC">Warangal Airport - WGC</option>
                </select>
            </div>
            <div class="col-md-4">
                <label>To City</label>
                <select class="form-select" name="to_city" id="to_city">
                    <option selected>Arrival City Name</option>
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
               
                                            
                  <div class="col-md-4">
                    <label>Depart Date:</label>
                    <input type="text" class="form-control datepicker" name="departure-date" >
                </div>
            
                      
            </div>
        
             <div class="search-container">
        <button type="submit"><i class="fas fa-search"></i> Search</button>
    </div>
        </div>
      
          
      
    </form>
     </div>
</div>

   <div class="call-support">
  
    <a href="support.jsp"><i class="fas fa-question-circle"></i> Support</a>

</div>


<script>
$(function() {
    $(".datepicker").datepicker({
        minDate: 0, // Prevent past dates selection
        dateFormat: 'yy-mm-dd',
        defaultDate: new Date(), // Set default date to today
        onSelect: function(dateText, inst) {
            $(this).val(dateText); // Update the input field with the selected date
        }
    }).datepicker("setDate", new Date()); // Initialize the datepicker with today's date
});
</script>

</body>
</html>
