<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title >
    
    Reset Password</title>
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,500&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #f5f5f5;
        }

        .container {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 15px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            width: 360px;
            padding: 40px;
            text-align: center;
        }

        .company-logo {
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Roboto', sans-serif;
            font-size: 26px;
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

        .welcome-text {
            font-size: 18px;
            font-weight: 400;
            color: #333;
            margin-bottom: 13px;
            font-family:Roboto;
        }

        .welcome-back {
            font-size: 18px;
            color: #555;
            margin-bottom: 20px;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .form-row {
            width: 100%;
            margin-bottom: 20px;
            position: relative;
            display: flex; /* Added */
            align-items: center; /* Added */
        }

        input[type="email"],
        input[type="text"],
        button {
            flex: 1; /* Added */
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
        }


       .form-row .fa {
    position: inherit;
    /* Adjusted left position */
    top: 50%;
  
    border: 1px solid #ddd;
   padding:12px;
    color: #999;
    margin-right:6px;
      border-radius: 4px;
}

        button {
            background-color: #1a73e8;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            font-weight: 500;
            margin-left: 10px; /* Added */
        }

        button:hover {
            background-color: #1558b0;
        }

        .get-code-button {
            background-color: #28a745;
        }

        .get-code-button:hover {
            background-color: #218838;
        }

        #message {
            margin-top: 10px;
            color: green;
            font-size: 14px;
        }

        .links {
            margin-top: 20px;
        }

        .links a {
            color: #1f1f1f;
            text-decoration: none;
            font-size: 14px;
            margin:3px;
            font-family:roboto;
        }

        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="company-logo">
            <img src="air1.jpg" alt="Company Logo">
            AirLine Systems
        </div>
        <div class="welcome-text">Welcome Back!</div>
        <div class="form-container">
            <form id="validateForm">
                <div class="form-row">
                    <i class="fa fa-envelope"></i>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required>
                    <button class="get-code-button" type="button" onclick="sendCode()">Get Code</button>
                </div>
                
                <div class="form-row">
                    <i class="fa fa-key"></i>
                    <input type="text" id="code" name="code" placeholder="Enter code" required>
                </div>
                <div id="message"></div>
                <div class="form-row">
                    <button type="button" onclick="validateCode()">Submit</button>
                </div>
            </form>
        </div>
        <div class="links">
            <a href="#">Help</a>
            <a href="#">Privacy</a>
        </div>
    </div>

   
    <script>
        function sendCode() {
            var email = document.getElementById("email").value;
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "forgot-password", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    if (xhr.responseText === "Email not found.") {
                        document.getElementById("message").innerText = "User not found.";
                        document.getElementById("message").style.color = "red";
                    } else {
                        document.getElementById("message").innerText = "Code sent successfully!";
                        document.getElementById("message").style.color = "green";
                    }
                } else if (xhr.readyState == 4) {
                    document.getElementById("message").innerText = "Error sending code or User Not found. Please try again.";
                    document.getElementById("message").style.color = "red";
                }
            };
            xhr.send("email=" + email);
        }

        function validateCode() {
            var email = document.getElementById("email").value;
            var code = document.getElementById("code").value;
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "validatecode", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var response = JSON.parse(xhr.responseText);
                    if (response.valid) {
                        document.getElementById("message").innerText = "Code verified!";
                        document.getElementById("message").style.color = "green";
                        setTimeout(function() {
                            window.location.href = "resetpassword.jsp";
                        }, 2000); // Redirect after 2 seconds
                    } else {
                        document.getElementById("message").innerText = "Wrong code.";
                        document.getElementById("message").style.color = "red";
                    }
                } else if (xhr.readyState == 4) {
                    document.getElementById("message").innerText = "Error validating code. Please try again.";
                }
            };
            xhr.send("email=" + email + "&code=" + code);
        }
    </script>
</body>
</html>