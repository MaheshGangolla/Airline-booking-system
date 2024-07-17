<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    
    if (session == null || session.getAttribute("codeVerified") == null || !(Boolean) session.getAttribute("codeVerified")) {
        response.sendRedirect("forgot-password.jsp");
        return;
    }
    
    
%>

<!DOCTYPE html>
<html>
<head>
    <title>Reset Password</title>
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
            padding: 35px;
            text-align: center;
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
        }

        input[type="password"] {
            width: 300px;
            padding: 12px;
            padding-left: 40px; /* Adjust padding to make space for the icon */
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .form-row .fa {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
        }

        button {
            background-color: #1a73e8;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 12px;
            width: 100%;
            font-size: 16px;
            cursor: pointer;
            font-weight: 500;
            margin-top: 10px;
        }

        button:hover {
            background-color: #1558b0;
        }

        #message {
            margin-top: 10px;
            color: green;
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
        .header-text {
            font-size: 14px;
            font-weight: bold;
            color: #35373b;
            margin-bottom: 35px;
            font-family:roboto;
            font-style:normal;
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
</head>
<body>
    <div class="container">
      <div class="company-logo">
            <img src="air1.jpg" alt="Company Logo">
            AirLine Systems
        </div>
        <div class="header-text">Reset Your Password</div>
        <div class="form-container">
            <form id="resetForm">
                <div class="form-row">
                    <i class="fa fa-lock"></i>
                    <input type="password" id="newPassword" name="newPassword" placeholder="New Password" required>
                </div>
                <div class="form-row">
                    <i class="fa fa-lock"></i>
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required>
                </div>
                <button type="button" onclick="resetPassword()">Reset Password</button>
                <div id="message"></div>
            </form>
        </div>
        <div class="links">
            <a href="#">Help</a>
            <a href="#">Privacy</a>
          
        </div>
    </div>

    <script>
        function resetPassword() {
            var newPassword = document.getElementById("newPassword").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            if (newPassword !== confirmPassword) {
                document.getElementById("message").innerText = "Passwords do not match.";
                document.getElementById("message").style.color = "red";
                return;
            }

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "resetpassword", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var response = xhr.responseText;
                    if (response === "Password reset successful.") {
                        document.getElementById("message").innerText = response;
                        document.getElementById("message").style.color = "green";
                    } else {
                        document.getElementById("message").innerText = response;
                        document.getElementById("message").style.color = "red";
                    }
                } else if (xhr.readyState == 4) {
                    document.getElementById("message").innerText = "Error resetting password. Please try again.";
                    document.getElementById("message").style.color = "red";
                }
            };
            xhr.send("newPassword=" + newPassword);
        }
    </script>
</body>
</html>
