<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <title>Payment Form</title>
    <!-- Include Razorpay library -->
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
    var RazorpayOrderId;

    function CreateOrderID(){
        console.log("Creating Order ID...");
        var amount = document.getElementById("amount").value; // Retrieve the amount from the hidden input field
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                console.log("Order ID received: " + this.responseText);
                var response = JSON.parse(this.responseText);
                RazorpayOrderId = response.id;
                OpenCheckout(response.amount);
            } else if (this.readyState == 4) {
                console.error("Failed to create order. Status: " + this.status);
            }
        };
        xhttp.open("GET", "OrderCreation?amount=" + amount, true); // Pass the amount as a query parameter
        xhttp.send();
    }

    function OpenCheckout(amount) {
        console.log("Opening Razorpay Checkout...");
        var options = {
            "key": "rzp_test_TCqwfQ1XxgDFYp",
            "amount": amount,
            "currency": "INR",
            "name": "Airline Systems",
            "description": "Pay & Checkout this Course, Upgrade your DSA Skill",
            "image": "https://media.geeksforgeeks.org/wp-content/uploads/20210806114908/dummy-200x200.png",
            "order_id": RazorpayOrderId,
            "handler": function (response) {
                console.log("Payment Success: ", response);
                alert("This step of Payment Succeeded");
                document.getElementById('razorpay_payment_id').value = response.razorpay_payment_id;
                document.getElementById('razorpay_order_id').value = response.razorpay_order_id;
                document.getElementById('razorpay_signature').value = response.razorpay_signature;
                // Submit the form data to the servlet
                document.getElementById('payment-form').action = "user_booking_final_check";
                document.getElementById('payment-form').submit();
            },
            "prefill": {
                "contact": "7396485336",
                "name": "Mahesh",
                "email": "iammaheshnani@gmail.com"
            },
            "notes": {
                "description": "Best Course for SDE placements",
                "language": "Available in 4 major Languages JAVA, C/C++, Python, Javascript",
                "access": "This course has Lifetime Access"
            },
            "theme": {
                "color": "#2300a3"
            }
        };
        var razorpayObject = new Razorpay(options);
        console.log(razorpayObject);
        razorpayObject.on('payment.failed', function (response) {
            console.log("Payment Failed: ", response);
            alert("This step of Payment Failed");
        });

        razorpayObject.open();
    }

</script>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .container-xxl {
            max-width: 600px;
            margin: 0 auto;
            padding: 50px 0;
        }
        .container {
            padding: 0 15px;
            margin-right: auto;
            margin-left: auto;
        }
        .form-floating {
            margin-bottom: 20px;
        }
        .form-floating input,
        .form-floating select {
            width: 95%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
        }
        .form-floating label {
            position: absolute;
            top: 50%;
            left: 10px;
            transform: translateY(-50%);
            background-color: #fff;
            padding: 0 5px;
            font-size: 14px;
            color: #999;
            pointer-events: none;
            transition: 0.3s ease-out;
        }
        .form-floating input:focus,
        .form-floating select:focus {
            border-color: #007bff;
        }
        .form-floating input:focus + label,
        .form-floating select:focus + label,
        .form-floating input:not(:placeholder-shown) + label,
        .form-floating select:not(:placeholder-shown) + label {
            top: -10px;
            font-size: 12px;
            color: #007bff;
        }
        .btn-primary {
            background-color: #f74e3b;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px ;
            cursor: pointer;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .container1 {
            max-width: 900px;
            margin: 30px auto;
            padding: 20px;
            background-color: #fff; /* Add background color */
            border-radius: 10px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); /* Add shadow */
            text-align: center;
        }
        .pnr-fare {
            text-align: left;
            margin-bottom: 20px;
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
</head>

<body>
    <div class="container-xxl py-5">
        <div class="container">
            <div class="col-lg-6">
                <div class="wow fadeInUp" data-wow-delay="0.2s">
                    <div class="container1">
                        <h2 class ="newform">Payment Form</h2>
                        
                        <div class="pnr-fare">
                            <h4><small>Your PNR No Is: 
                                <h3 style="color:red ;">
                                    <% 
                                        String pnrno=(String)session.getAttribute("pnrno");  
                                        out.print(pnrno);
                                        session.setAttribute("PNR",pnrno);
                                        String ticket_type=(String)session.getAttribute("ticket_type");
                                        session.setAttribute("ticket_type",ticket_type);
                                    %>
                                </h3>
                            </small></h4>
                            <h4><small>Your Total Fare:
                                <% 
                                    String ff=(String)session.getAttribute("ff");  
                                    out.print(ff);
                                %>
                            </small></h4>  
                        </div> 
                        
                        <form id="payment-form" method="post" action="OrderCreation" onsubmit="return validateForm()">
                            <div class="row g-3">
                                <div class="col-md-12">
                                    <div class="form-floating">
                                   
                                        <input type="text" class="form-control" id="address" placeholder="Enter Your Address" name="address" required>
                                        
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="amount" name="amount" value="<%= session.getAttribute("ff") %>" disabled>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button class="btn btn-primary w-100 py-3" type="button" id="pay-button" onclick="CreateOrderID()">Pay Now</button>
                                </div>
                            </div>
                            <input type="hidden" name="razorpay_payment_id" id="razorpay_payment_id">
                            <input type="hidden" name="razorpay_order_id" id="razorpay_order_id">
                            <input type="hidden" name="razorpay_signature" id="razorpay_signature">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function validateForm() {
            var address = document.getElementById("address").value;
            if (address.trim() === '') {
                alert("Please fill in your address.");
                return false;
            }
           
</script>

</body>

</html>