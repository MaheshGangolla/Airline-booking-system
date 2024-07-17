<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, java.util.Map" %>
<%@ include file="navbar_a.jsp" %>
<

<!DOCTYPE html>
<html>
<head>
    <title>User Preferences</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 75%;
            margin: 50px auto;
            background: #fff;
        
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 80%; /* Reduced width of the table */
            border-collapse: collapse;
            margin: 20px auto;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .chart-container {
            width: 60%; /* Reduced width of the chart container */
            margin: 50px auto;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div class="container">
        <h2>User Preferences for <%= request.getAttribute("username") %></h2>
        <h3>Recent 20 Searches By the user</h3>
        <table>
            <tr>
                <th>ID</th>
                <th>Username</th>
                
                <th>Departure</th>
                <th>Destination</th>
                <th>Search Date</th>
            </tr>
            <%
                List<Map<String, Object>> preferences = (List<Map<String, Object>>) request.getAttribute("preferences");
                if (preferences != null) {
                    int count = 0;
                    for (Map<String, Object> preference : preferences) {
                        if (count >= 20) break;  // Display only the last 20 searches
            %>
            <tr>
                <td><%= preference.get("id") %></td>
                <td><%= preference.get("username") %></td>
                   <td><%= preference.get("departure") %></td>
                <td><%= preference.get("destination") %></td>
             
                <td><%= preference.get("search_date") %></td>
            </tr>
            <%
                        count++;
                    }
                }
            %>
        </table>
    </div>
    <div class="container">
    <div class="chart-container">
        <h3 style="">Most Searched Destinations By the user</h3>
        <canvas id="searchChart"></canvas>
    </div>
</div>
    <script>
        const ctx = document.getElementById('searchChart').getContext('2d');
        const searchData = <%= request.getAttribute("chartData") %>;

        const chart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: searchData.labels,
                datasets: [{
                    label: 'Number of Searches',
                    data: searchData.data,
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1,
                    barThickness: 40 // Reduced width of the bars
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</body>
</html>
