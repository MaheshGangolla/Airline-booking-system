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
    <title>Flight Schedule</title>
    <!-- Load the Google Charts library -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <style>
       body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    overflow: hidden; /* Prevent scrolling */
   background-color: #f0f0f0;
}

        #header {
         
            color: black;
            text-align: center;
            padding: 10px;
           
        }

        #container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 40px;
            
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
       
        }

        #flightChart {
            width: 100%;
            height: 600px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            display: block;
            margin: 20px auto;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div id="header">
        <h1>Flight Schedule for the Next 30 Days</h1>
    </div>
   
    <div id="container">
        <!-- Form to select "From" and "To" cities -->
        <form id="flightForm">
            <label for="fromCity">From:</label>
            <select id="fromCity" name="fromCity" value="<%= (request.getParameter("fromCity") != null) ? request.getParameter("fromCity") : "" %>">
            
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
                <!-- Add more options as needed -->
            </select>
            <label for="toCity">To:</label>
            <select id="toCity" name="toCity" value="<%= (request.getParameter("toCity") != null) ? request.getParameter("toCity") : "" %>">
                <!-- Options for "To" city -->
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
                <!-- Add more options as needed -->
            </select>
            <button type="submit">Fetch Data</button>
        </form>
        <!-- The div element where the chart will be rendered -->
        <div id="flightChart"></div>
    </div>

  <script>
//Load the Google Charts library
  google.charts.load('current', { 'packages': ['corechart'] });

  // Function to render the chart
  function renderChart(csvData) {
      // Parse the CSV data
      var rows = csvData.split('\n');
      var flightData = [];

      rows.forEach(row => {
          var columns = row.split(',');
          var flightName = columns[1];
          var dateOfFlight = columns[2];
          var time = columns[3];
          var count = parseInt(columns[5]); // Parse count as integer
          var fromCity = columns[4];
          var toCity = columns[5];

          // Add data to flightData array
          flightData.push({ flightName: flightName, date: new Date(dateOfFlight), fromCity: fromCity, toCity: toCity, time: time, count: count });
      });

      // Create the data table
      var dataTable = new google.visualization.DataTable();
      dataTable.addColumn('date', 'Date');
      dataTable.addColumn('number', 'Flights');
      dataTable.addColumn({ type: 'string', role: 'tooltip', 'p': { 'html': true } });

      // Add data rows
      flightData.forEach(data => {
          var tooltipContent = 'Flight Name: ' + data.flightName + '<br>' +
              'date: ' + data.date ;
          dataTable.addRow([data.date, data.count, tooltipContent]);
      });

      // Set chart options
      var options = {
          title: 'Next Available flights',
          hAxis: {
              title: 'Date',
              slantedText: true,
              slantedTextAngle: 45 // Rotate x-axis labels for better readability
          },
          vAxis: {
              title: 'No Of Flights Available'
          },
          legend: 'none',
          bar: { groupWidth: '30%' } // Decrease the width of the bars
      };

      // Instantiate and draw the chart
      var chart = new google.visualization.ColumnChart(document.getElementById('flightChart'));
      chart.draw(dataTable, options);
  }

  // Function to fetch data when form is submitted
  document.getElementById('flightForm').addEventListener('submit', function (event) {
      event.preventDefault(); // Prevent default form submission

      var formData = new FormData(this); // Get form data
      var queryParams = new URLSearchParams(formData).toString(); // Convert form data to query string

      // Fetch flight data from servlet using form data
      fetch('GetFlightData?' + queryParams) // Adjust URL as needed
          .then(response => response.text())
          .then(csvData => {
              console.log('Fetched flight data:', csvData); // Log fetched flight data
              renderChart(csvData); // Render chart with fetched data
          })
          .catch(error => {
              console.error('Error fetching data:', error);
          });
  });

  function setSelectedOption(selectId, value) {
      var selectElement = document.getElementById(selectId);
      var options = selectElement.options;
      for (var i = 0; i < options.length; i++) {
          if (options[i].value === value) {
              options[i].selected = true;
              break;
          }
      }
  }

  // Set selected options based on URL parameters when page loads
  window.addEventListener('DOMContentLoaded', function () {
      var fromCityParam = new URLSearchParams(window.location.search).get('fromCity');
      var toCityParam = new URLSearchParams(window.location.search).get('toCity');
      if (fromCityParam) {
          setSelectedOption('fromCity', fromCityParam);
      }
      if (toCityParam) {
          setSelectedOption('toCity', toCityParam);
      }
  });

  function parseTime(timeString) {
      // Split the time string into hours, minutes, and seconds
      var timeComponents = timeString.split(':');
      var hours = parseInt(timeComponents[0], 10);
      var minutes = parseInt(timeComponents[1], 10);
      var seconds = parseInt(timeComponents[2], 10);

      // Create a new Date object with a common date
      var date = new Date(1970, 0, 1);

      // Set the hours, minutes, and seconds of the Date object
      date.setHours(hours);
      date.setMinutes(minutes);
      date.setSeconds(seconds);

      return date;
  }

</script>
</body>
</html>
