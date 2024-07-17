package airlinereservationsystem;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.razorpay.*;
import org.json.*;

/**
 * Servlet implementation class OrderCreation
 */
@WebServlet("/OrderCreation")
public class OrderCreation extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderCreation() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RazorpayClient client = null;
        String orderId = null;
        try {
            client = new RazorpayClient("rzp_test_TCqwfQ1XxgDFYp", "TQfOhDbmA1MjovXrNESl2PAA");
            
            // Retrieve the amount parameter from the request
            String amountStr = request.getParameter("amount");
            if(amountStr == null) {
                // Amount parameter not provided, handle the error
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Amount parameter missing");
                return;
            }
            int amount = Integer.parseInt(amountStr)*100;

            JSONObject options = new JSONObject();
            options.put("amount", amount); // Use the dynamically retrieved amount
            options.put("currency", "INR");
            options.put("receipt", "order_rcptid_11");
            options.put("payment_capture", true);

            Order order = client.Orders.create(options);
            orderId = order.get("id");

            JSONObject orderDetails = new JSONObject();
            orderDetails.put("id", orderId);
            orderDetails.put("amount", amount); // Use the dynamically retrieved amount

            response.setContentType("application/json");
            response.getWriter().write(orderDetails.toString());

        } catch (RazorpayException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Order creation failed");
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String razorpayPaymentId = request.getParameter("razorpay_payment_id");
			String razorpayOrderId = request.getParameter("razorpay_order_id");
			String razorpaySignature = request.getParameter("razorpay_signature");

			JSONObject options = new JSONObject();
			options.put("razorpay_payment_id", razorpayPaymentId);
			options.put("razorpay_order_id", razorpayOrderId);
			options.put("razorpay_signature", razorpaySignature);

			boolean isValid = Utils.verifyPaymentSignature(options, "TQfOhDbmA1MjovXrNESl2PAA");
			response.setContentType("application/json");

			if (isValid) {
				response.getWriter().write("{\"status\":\"success\"}");
			} else {
				response.getWriter().write("{\"status\":\"failure\"}");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Verification failed");
		}
	}
}









