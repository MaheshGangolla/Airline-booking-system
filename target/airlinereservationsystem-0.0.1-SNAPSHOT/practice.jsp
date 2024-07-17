<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Razorpay Integration</title>
    <!-- Include Razorpay library -->
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <script>
        var RazorpayOrderId;

        function CreateOrderID(){
            console.log("Creating Order ID...");
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    console.log("Order ID received: " + this.responseText); // Debug statement
                    var response = JSON.parse(this.responseText);
                    RazorpayOrderId = response.id;
                    OpenCheckout(response.amount);
                } else if (this.readyState == 4) {
                    console.error("Failed to create order. Status: " + this.status);
                }
            };
            xhttp.open("GET", "http://localhost:8085/airlinereservationsystem/OrderCreation", true);
            xhttp.send();
        }

        function OpenCheckout(amount) {
            console.log("Opening Razorpay Checkout...");
            var options = { 
                "key": "rzp_test_TCqwfQ1XxgDFYp",  
                "amount": amount,  
                "currency": "INR", 
                "name": "Dummy Academy", 
                "description": "Pay & Checkout this Course, Upgrade your DSA Skill", 
                "image": "https://media.geeksforgeeks.org/wp-content/uploads/20210806114908/dummy-200x200.png", 
                "order_id": RazorpayOrderId,   
                "handler": function (response) { 
                    console.log("Payment Success: ", response); 
                    alert("This step of Payment Succeeded"); 
                    document.getElementById('razorpay_payment_id').value = response.razorpay_payment_id;
                    document.getElementById('razorpay_order_id').value = response.razorpay_order_id;
                    document.getElementById('razorpay_signature').value = response.razorpay_signature;
                    document.getElementById('payment-form').submit();
                }, 
                "prefill": { 
                    "contact": "9876543210",  
                    "name": "Twinkle Sharma",   
                    "email": "smtwinkle@gmail.com"
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
</head>
<body>
    <h1>Razorpay Integration</h1>
    
    <form id="payment-form" action="OrderCreation" method="POST">
        <input type="hidden" name="razorpay_payment_id" id="razorpay_payment_id">
        <input type="hidden" name="razorpay_order_id" id="razorpay_order_id">
        <input type="hidden" name="razorpay_signature" id="razorpay_signature">
        <button type="button" id="pay-button" onclick="CreateOrderID()">Pay Now</button>
    </form>
</body>
</html>
