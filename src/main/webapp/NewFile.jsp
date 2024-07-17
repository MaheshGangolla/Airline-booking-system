<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
    background-color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0;
    height: 100vh;
}

.container {
    display: flex;
   
   
    height: 500px; /* Example height for container */
    background-color: black;
    width: 700px; /* Example width for container */
       box-sizing: border-box;
       border-margin:10px; 
     border-radius: 100px;
}

.card1 {
    flex: 1; /* Take up half of the container */
    background-color: green;
    padding: 10px; /* Add some padding for better presentation */
    color: white;
    display: flex;
    justify-content: center;
    align-items: center;
    box-sizing: border-box; /* Ensure padding is included in the width */
    border-radius: 100px;
 
}

.card-group {
    display: flex;
    flex-direction: column; /* Stack cards vertically */
    justify-content: center;
    align-items: center;
    flex: 1; /* Take up half of the container */
    box-sizing: border-box; /* Ensure padding is included in the width */
   
}

.card {
    width: 50%;
    background-color: red;
    margin: 10px 0; /* Space between cards */
    padding: 10px; /* Add some padding for better presentation */
    color: white;
    box-sizing: border-box; /* Ensure padding is included in the width */
}
</style>
</head>
<body>
<div class="container">
    <div class="card1">
        <h1>123</h1>
    </div>
    <div class="card-group">
        <div class="card">
            <h1>maehsh</h1>
        </div>
        <div class="card">
            <h1>maehsh1</h1>
        </div>
    </div>
</div>
</body>
</html>
