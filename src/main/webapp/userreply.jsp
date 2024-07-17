<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="navbar_a.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Issue Reply</title>
<style>
    label {
        display: block;
        margin-bottom: 5px;
    }
    textarea {
        width: 100%;
        height: 100px;
        resize: vertical;
    }
    body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    overflow: hidden; /* Prevent scrolling */
    background-color: white;
}

        .container {
            max-width: 500px;
            margin: 0 auto;
            background-color: #ffffff;
            padding:20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
             border: 1px solid black; /* Border color for the container */
    border-radius: 10px;
    margin-top:100px;

      justify-content: center;
      align-items: center;
  
        }

        h2 {
            text-align: center;
            color: black;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }

        input[type="text"],
        select,
        textarea {
            width: calc(100% - 20px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-bottom: 10px;
            font-size: 16px;
        }

        textarea {
            height: 100px;
            resize: vertical;
        }

      
        

        .mandatory::after {
            content: "*";
            color: red;
        }
     
</style>
</head>
<body>
<div class="container">
    <h2>User Issue Reply</h2>
    <form action="ReplyServlet" method="post">
        <label for="name">User Name:</label>
        <input type="text" id="name" name="name" value="<%= (request.getParameter("name") != null) ? request.getParameter("name") : "" %>" required>
         <input type="hidden" class="form-control" id="pnr" placeholder="Pnr" name="pnr" value="<%= (request.getParameter("pnr") != null) ? request.getParameter("pnr") : "" %>" required>
         <input type="hidden" class="form-control" id="date" placeholder="date" name="date" value="<%= (request.getParameter("date") != null) ? request.getParameter("date") : "" %>" required>
      <input type="hidden" class="form-control" id="type" placeholder="class" name="type" value="<%= (request.getParameter("type") != null) ? request.getParameter("type") : "" %>" required>
        
       <label for="issue">User Issue:</label>
		<textarea id="issue" name="issue" required><%= request.getParameter("msg") %></textarea>
        <label for="reply">Reply:</label>
        <textarea id="reply" name="reply" required></textarea>
        <br>
      <button type="submit" style="background-color:#f74e3b ; color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-align:center;
            font-size: 16px;">Submit</button>
    </form>
    </div>
</body>
</html>
