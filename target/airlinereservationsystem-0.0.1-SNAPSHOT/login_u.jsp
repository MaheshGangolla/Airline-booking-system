
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
        .fp{
        margin-top:10px;
        text-align:right;
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
    <h2>User Login</h2>
    <form action="user_validation" method="post"> <!-- Added method="post" -->
        <input type="text" name="username" placeholder="Email"> <!-- Added name attribute -->
        <input type="password" name="password" placeholder="Password"> <!-- Added name attribute -->
        <input type="submit" value="Login">
    </form>
    <p class="signup-text">Are you admin?</p>
    <a href="login_a.jsp" class="signup-link">Admin login</a>
     <p class="signup-text">Don't have an account?</p>
    <a href="registration.jsp" class="signup-link">Sign up</a>
   <div class="fp"> <a href="forgot-password.jsp" class="signup-link">Forget Password?</a></div>
</div>
<div class="call-support">
    <a href="#"><i class="fas fa-phone"></i> Call</a>
    <a href="#"><i class="fas fa-question-circle"></i> Support</a>
</div>
</body>
</html>