<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String name = (String) session.getAttribute("name");
    if (name == null) {
        response.sendRedirect("UserLogin.jsp");
        return;
    }
    String slotname = request.getParameter("slotname");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SMEVCS - Payment</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            min-height: 100vh;
        }
        .navbar {
            background: linear-gradient(135deg, #1a1a2e, #0f3460);
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
        }
        .navbar h1 { font-size: 22px; }
        .navbar a {
            color: white;
            text-decoration: none;
            background: rgba(255,255,255,0.2);
            padding: 8px 15px;
            border-radius: 20px;
            margin-left: 10px;
            font-size: 13px;
        }
        .content {
            max-width: 500px;
            margin: 50px auto;
            padding: 0 20px;
        }
        .card {
            background: white;
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        .card h2 {
            color: #0f3460;
            margin-bottom: 5px;
            font-size: 24px;
        }
        .card .subtitle {
            color: #666;
            margin-bottom: 30px;
            font-size: 14px;
        }
        .slot-info {
            background: #e8f4fd;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 25px;
        }
        .slot-info p {
            color: #0f3460;
            font-weight: bold;
            font-size: 16px;
        }
        .slot-info span {
            color: #666;
            font-size: 13px;
        }
        .form-group { margin-bottom: 20px; }
        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: bold;
            font-size: 14px;
        }
        input, select {
            width: 100%;
            padding: 12px;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
        }
        input:focus, select:focus {
            outline: none;
            border-color: #0f3460;
        }
        .btn {
            width: 100%;
            padding: 15px;
            background: #27ae60;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .btn:hover { background: #219a52; }
        .back-btn {
            display: inline-block;
            margin-bottom: 20px;
            color: #0f3460;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1>⚡ SMEVCS</h1>
        <div>
            <a href="UserHome.jsp">Home</a>
            <a href="LogoutController">Logout</a>
        </div>
    </div>
    <div class="content">
        <a href="Search.jsp" class="back-btn">← Back to Search</a>
        <div class="card">
            <h2>💳 Book & Pay</h2>
            <p class="subtitle">Complete your charging slot booking</p>
            <div class="slot-info">
                <span>Selected Slot</span>
                <p>⚡ <%= slotname != null ? slotname : "Not selected" %></p>
            </div>
            <form action="PayController" method="post">
                <input type="hidden" name="slotname" value="<%= slotname %>"/>
                <div class="form-group">
                    <label>Select Duration</label>
                    <select name="duration">
                        <option value="1 Hour">1 Hour</option>
                        <option value="2 Hours">2 Hours</option>
                        <option value="3 Hours">3 Hours</option>
                        <option value="4 Hours">4 Hours</option>
                        <option value="Full Day">Full Day</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Amount (₹)</label>
                    <input type="text" name="amount" placeholder="Enter amount" required/>
                </div>
                <div class="form-group">
                    <label>Payment Method</label>
                    <select name="payment_method">
                        <option value="UPI">UPI</option>
                        <option value="Credit Card">Credit Card</option>
                        <option value="Debit Card">Debit Card</option>
                        <option value="Net Banking">Net Banking</option>
                    </select>
                </div>
                <button type="submit" class="btn">✅ Confirm Payment</button>
            </form>
        </div>
    </div>
</body>
</html>