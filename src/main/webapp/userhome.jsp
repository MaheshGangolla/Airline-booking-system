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
<html>
<head>
    <meta charset="UTF-8">
    <title>Flight Search</title>
 <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        .top-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f2f2f2;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin: 20px;
            background-image:url('bg4.jpg');
        }

        .form-container {
            width: 1200px;
            background-color:#fff;
            padding:20px;
            border-radius:15px;
        }

        .search-container h2 {
            margin-top: 0;
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
            text-align: center;
        }

        .search-container form {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .search-container form .form-group {
            flex: 1 1 30%;
            margin-bottom: 15px;
        }

        .search-container form .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .search-container form .form-group input[type="text"],
        .search-container form .form-group input[type="date"] {
            width: 90%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .search-container form .form-group input[type="text"]:focus,
        .search-container form .form-group input[type="date"]:focus {
            border-color: #007bff;
            outline: none;
        }

        .search-container form .form-group.full-width {
            flex: 1 1 90%;
        }

        .search-container form .form-group input[type="submit"] {
            width: 150px;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            display: block;
            margin: 0 auto;
        }

        .search-container form .form-group input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .clearfix::after {
            content: "";
            clear: both;
            display: table;
        }

        .bottom-container {
            flex: 3;
            background-color: #f9f6ee;
            display: flex;
            justify-content: space-around;
            padding: 20px;
        }

        .card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin-top:30px;
            height:470px;
            width:500px;
            text-align: center;
            border-radius:15px;
        }

        .card img {
            width: 100%;
            height: 400px;
            object-fit: cover;
        }

        .card-content {
            padding: 30px;
        }

        .card-content h3 {
            margin-top: 0;
            font-size: 18px;
            color: #333;
        }

        .card-content p {
            color: #666;
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
        
    </style>
</head>
<body>
    <div class="top-container">
        <div class="form-container">
            <div class="search-container">
                <h2>Flight Search</h2>
                <form action="searchResult" method="post" >
                    <div class="form-group">
                        <label for="from_city">Departure</label>
                        <select class="form-select" name="from_city" id="from_city">
                            <option selected>Departure City Name</option>
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
                    <div class="form-group">
                        <label for="to_city">Destination</label>
                        <select class="form-select" name="to_city" id="to_city">
                            <option selected>Departure City Name</option>
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
                     <div class="form-group">
                         <label for="trip">Trip Type</label>
                         <select class="form-select" name="triptype" id="to_city" disabled>
                            <option value="oneway" selected>One Way</option>
                            <option value="roundtrip">Round Trip</option>
                            </select>
                            </div>
                   <div class="form-group">
                        <label for="date">Depart</label>
                        <input style="width:170px; height:50px;"type="date" name="departure-date" id="date" class="form-control" required>
                    </div>
                       <div class="form-group" id="return_date_group" style="display: none;">
    <label for="return_date">Return Date</label>
    <input style="width:170px; height:50px;" type="date" name="return-date" id="return_date" class="form-control">
</div>
                    <div class="form-group full-width">
                        <input type="submit" value="Search">
                    </div>
                </form>
            </div>
        </div>
    </div>
          <h2 style="text-align: center; margin-bottom: 20px;">Most Searched Destinations in Recent Times</h2>
    <div class="bottom-container">
  
    <div class="card">
        <img src="<%= session.getAttribute("imgLocation1") %>" alt="<%= request.getAttribute("destination1") %>" style="width: 100%; height: 270px; object-fit: cover;">
        <div class="card-content">
            <h3 style="font-size:24px;"><%= session.getAttribute("destination1") %></h3>
            <p><%= session.getAttribute("description1") %></p>
        </div>
    </div>
    <div class="card" >
        <img src="<%= session.getAttribute("imgLocation2") %>" alt="<%= request.getAttribute("destination2") %>" style="width: 100%; height: 270px; object-fit: cover;">
        <div class="card-content">
            <h3 style="font-size:24px;"><%= session.getAttribute("destination2") %></h3>
            <p><%= session.getAttribute("description2") %></p>
        </div>
    </div>
    <div class="card">
        <img src="<%= session.getAttribute("imgLocation3") %>" alt="<%= request.getAttribute("destination3") %>" style="width: 100%; height: 270px; object-fit: cover;">
        <div class="card-content">
            <h3 style="font-size:24px;"><%= session.getAttribute("destination3") %></h3>
            <p><%= session.getAttribute("description3") %></p>
        </div>
    </div>
</div>

   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    
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
    <script>
    $(document).ready(function() {
        $('#trip_type').change(function() {
            if ($(this).val() === 'roundtrip') {
                $('#return_date_group').show();
            } else {
                $('#return_date_group').hide();
            }
        });
    });
</script>
    
</body>

</html>
