
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="css/styles.css">
   
</head>
<style>
   body {
    margin: 0;
    padding: 0;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #f5f5f5;
}

.login-container {
   width: 300px;
    padding: 20px;
    padding-right:50px;
    padding-top:40px;
    padding-left:35px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align: center;
    animation: fadeIn 0.5s ease;
    position: relative; 
}

.login-container h2 {
    margin-bottom: 20px;
    color: #333;
}

.login-container input[type="text"],
.login-container input[type="password"] {
    width: 100%;
    margin-bottom: 20px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    outline: none;
}

.login-container input[type="submit"] {
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.login-container input[type="submit"]:hover {
    background-color: #0056b3;
}

.signup-text {
    margin-bottom: 10px;
    font-size: 14px;
    color: #333;
}

.signup-link {
    margin-bottom: 10px;
    font-size: 14px;
    text-decoration: none;
    color: #007bff;
}
.company-logo {
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Roboto', sans-serif;
            font-size: 28px;
            font-weight: bold;
            color: #1a73e8;
            margin-bottom: 20px;
            letter-spacing: 1px;
        }

        .company-logo img {
            margin-right: 10px;
            width: 40px;
            height: 40px;
        }
</style>
<body>

<div class="login-container">
<div class="company-logo">
            <img src="air1.jpg" alt="Company Logo">
            AirLine Systems
        </div>
    <h2>Admin Login</h2>
    <form action="login" method="post"> <!-- Added method="post" -->
        <input type="text" name="Username" placeholder="username"> <!-- Added name attribute -->
        <input type="password" name="password" placeholder="Password"> <!-- Added name attribute -->
        <input type="submit" value="Login">
    </form>
    <p class="signup-text">Are you User?</p>
    <a href="login_u.jsp" class="signup-link">User Login</a>
     <p class="signup-text">Don't have an account?</p>
    <a href="registration.jsp" class="signup-link">Sign up</a>
</div>



</body>
</html>