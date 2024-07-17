<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file -->
    <script src="validation.js" defer></script> <!-- Link to your validation JavaScript file -->
</head>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
}

.container {
    width: 80%;
    max-width: 600px;
    margin: 50px auto;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    padding: 30px;
}

h2 {
    color: #333;
    text-align: center;
}

.form-floating {
    margin-bottom: 20px;
}

.form-floating label {
    color: #000;
    font-size: 16px;
    font-weight: bold;
    display: block;
}

.form-control {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
}

.form-select {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    background-image: url('data:image/svg+xml;utf8,<svg viewBox="0 0 0 0" xmlns="http://www.w3.org/2000/svg" fill="%23555"><path d="M 0 0 L 5 5 L 10 0 Z" /></svg>');
    background-repeat: no-repeat;
    background-position-x: calc(100% - 10px);
    background-position-y: center;
}

.btn-primary {
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 15px 20px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.btn-primary:hover {
    background-color: #45a049;
}

.row {
    display: flex;
    flex-wrap: wrap;
    margin: 0 -10px;
}

.col-md-6 {
    flex: 0 0 calc(50% - 20px);
    margin: 0 10px;
}

.col-12 {
    flex: 0 0 100%;
    margin: 0 10px;
}


.already-have-account {
    text-align: center;
    margin-top: 20px;
}

.already-have-account a {
    color: #4CAF50;
    text-decoration: none;
    font-weight: bold;
}

.already-have-account a:hover {
    text-decoration: underline;
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
        

</style>
<body>
    <div class="container">
        <h2>Registration Form</h2>
        <form id="registrationForm" method="post" action="registration" onsubmit="">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-floating">
                      <label for="fullname">Your Full Name</label>
                        <input type="text" class="form-control" name="fullname" id="fullname" placeholder="Your Full Name" required>
                      
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                            <label for="username">Enter Your Username</label>
                        <input type="text" class="form-control" name="username" id="username" placeholder="Enter Your Username" required>
                
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                         <label for="password">Enter Your Password</label>
                        <input type="password" class="form-control" name="password" id="password" placeholder="Enter Your Password" required>
                   
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                          <label for="countryCode">Select Country Code</label>
                        <select class="form-select" name="countryCode" id="countryCode" required>
                    
                            <option value="" disabled selected>Select Country Code</option>
                           <option data-countryCode="IN" value="91" Selected>India (+91)</option>
                                                <option data-countryCode="GB" value="44">UK (+44)</option>
                                                <option data-countryCode="US" value="1">USA (+1)</option>
                                         
		                          
                        </select>
                      
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="form-floating">
                     <label for="phno">Enter Your Number</label>
                        <input type="text" class="form-control" name="phno" id="phno" placeholder="Enter Your Number" required>
                       
                    </div>
                </div>
                <div class="col-12">
                    <div class="form-floating">
                     <label for="email_address">Enter User Email</label>
                        <input type="email" class="form-control" name="email_address" id="email_address" placeholder="Enter Your Email" required>
                       
                    </div>
                </div>
                <div class="col-12">
                    <div class="form-floating">
                     <label for="state">Select State</label>
                        <select class="form-select" name="state" id="state" required>
                            <option value="" disabled selected>Select State</option>
                            <option value="Andhra Pradesh">Andhra Pradesh</option>
                            <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                            <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                            <option value="Assam">Assam</option>
                            <option value="Bihar">Bihar</option>
                            <option value="Chandigarh">Chandigarh</option>
                            <option value="Chhattisgarh">Chhattisgarh</option>
                            <option value="Dadar and Nagar Haveli">Dadar and Nagar Haveli</option>
                            <option value="Daman and Diu">Daman and Diu</option>
                            <option value="Delhi">Delhi</option>
                            <option value="Lakshadweep">Lakshadweep</option>
                            <option value="Puducherry">Puducherry</option>
                            <option value="Goa">Goa</option>
                            <option value="Gujarat">Gujarat</option>
                            <option value="Haryana">Haryana</option>
                            <option value="Himachal Pradesh">Himachal Pradesh</option>
                            <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                            <option value="Jharkhand">Jharkhand</option>
                            <option value="Karnataka">Karnataka</option>
                            <option value="Kerala">Kerala</option>
                            <option value="Madhya Pradesh">Madhya Pradesh</option>
                            <option value="Maharashtra">Maharashtra</option>
                            <option value="Manipur">Manipur</option>
                            <option value="Meghalaya">Meghalaya</option>
                            <option value="Mizoram">Mizoram</option>
                            <option value="Nagaland">Nagaland</option>
                            <option value="Odisha">Odisha</option>
                            <option value="Punjab">Punjab</option>
                            <option value="Rajasthan">Rajasthan</option>
                            <option value="Sikkim">Sikkim</option>
                            <option value="Tamil Nadu">Tamil Nadu</option>
                            <option value="Telangana">Telangana</option>
                            <option value="Tripura">Tripura</option>
                            <option value="Uttar Pradesh">Uttar Pradesh</option>
                            <option value="Uttarakhand">Uttarakhand</option>
                            <option value="West Bengal">West Bengal</option>
                        </select>
                       
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-floating">
                      <label for="city">Enter User City</label>
                        <input type="text" class="form-control" name="city" id="city" placeholder="Enter Your City" required>
                      
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-floating">
                       <label for="pincode">Enter User Pincode</label>
                        <input type="number" class="form-control" name="pincode" id="pincode" placeholder="Enter Your Pincode" required>
                     
                    </div>
                </div>
                 <div class="col-6">
                    <div class="form-floating">
                       <label for="gender">Enter User Pincode</label>
                        <input type="text" class="form-control" name="gender" id="gender" placeholder="Gender" required>
                     
                    </div>
                </div>
                <div class="col-12">
                    <button class="btn btn-primary w-100 py-3" type="submit">Register</button>
                </div>
                
            </div>
            <div class="call-support">
    <a href="#"><i class="fas fa-phone"></i> Call</a>
    <a href="#"><i class="fas fa-question-circle"></i> Support</a>
</div>
            <div class="already-have-account">
                <span>Already have an account? </span><a href="login_u.jsp"><b>User</a>  </span>  <a href="login_a.jsp"><b>Admin</a>
            </div>
        </form>
    </div>
    <script>
//Function to validate the form
 // Function to validate the form
function validateForm() {
    // Regular expressions for validation
    const letterRegex = /^[a-zA-Z]+$/;
    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$/;
    const emailRegex = /^\S+@\S+\.\S+$/;
    const pincodeRegex = /^\d{5}$/;
    const cityRegex = /^[a-zA-Z\s]*$/;

    // Get input elements by their IDs
    const fullnameInput = document.getElementById('fullname');
    const passwordInput = document.getElementById('password');
    const emailInput = document.getElementById('email_address');
    const pincodeInput = document.getElementById('pincode');
    const cityInput = document.getElementById('city');

    // Flag to track if the form is valid
    let isValid = true;

    // Validate Full Name
    if (!letterRegex.test(fullnameInput.value.trim())) {
        isValid = false;
        alert("Please enter a valid full name (only letters).");
        fullnameInput.classList.add('error');
    } else {
        fullnameInput.classList.remove('error');
    }

    // Validate Password
    if (!passwordRegex.test(passwordInput.value)) {
        isValid = false;
        alert("Password must be at least 6 characters long and contain at least one lowercase letter, one uppercase letter, one digit, and one special character.");
        passwordInput.classList.add('error');
    } else {
        passwordInput.classList.remove('error');
    }

    // Validate Email
    if (!emailRegex.test(emailInput.value)) {
        isValid = false;
        alert("Please enter a valid email address.");
        emailInput.classList.add('error');
    } else {
        emailInput.classList.remove('error');
    }

    // Validate Pincode
    if (!pincodeRegex.test(pincodeInput.value)) {
        isValid = false;
        alert("Please enter a valid pincode (5 digits).");
        pincodeInput.classList.add('error');
    } else {
        pincodeInput.classList.remove('error');
    }

    // Validate City
    if (!cityRegex.test(cityInput.value)) {
        isValid = false;
        alert("Please enter a valid city name (only letters).");
        cityInput.classList.add('error');
    } else {
        cityInput.classList.remove('error');
    }

    // If form is valid, submit the form
    return isValid;
}

    </script>
</body>
</html>

 
