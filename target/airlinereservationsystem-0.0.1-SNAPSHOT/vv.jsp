<!DOCTYPE html>
<html>
<head>
    <title>Flight Schedule</title>
    <!-- Load the Google Charts library -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
    <h1>Flight Schedule for the Next 30 Days</h1>
    <div>
        <button onclick="fetchAndRenderData()">Fetch Data</button>
    </div>
    <!-- The div element where the chart will be rendered -->
    <div id="flightChart" style="width: 800px; height: 400px;"></div>
    <script>
        // Load the Google Charts library
        google.charts.load('current', {'packages':['corechart']});

        // Function to fetch data and render the chart
        function fetchAndRenderData() {
            fetch('/airlinereservationsystem/GetFlightData')
                .then(response => response.json())
                .then(flightData => {
                    renderChart(flightData);
                })
                .catch(error => {
                    console.error('Error fetching data:', error);
                });
        }

        // Function to render the chart
        function renderChart(flightData) {
            // Create the data table
            var data = new google.visualization.DataTable();
            data.addColumn('date', 'Departure');
            data.addColumn('number', 'Flight'); // We use number type for Flight

            // Add data rows
            flightData.forEach(flight => {
                data.addRow([
                    new Date(flight.departure),
                    1 // We use a constant value of 1 for Flight
                ]);
            });

            // Set chart options
            var options = {
                title: 'Flight Schedule for the Next 30 Days',
                hAxis: {
                    title: 'Date'
                },
                vAxis: {
                    title: 'Flights'
                },
                legend: 'none'
            };

            // Instantiate and draw the chart
            var chart = new google.visualization.ScatterChart(document.getElementById('flightChart'));
            chart.draw(data, options);
        }
    </script>
</body>
</html>
