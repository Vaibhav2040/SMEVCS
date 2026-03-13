<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.bean.Pay" %>
<%@ page import="com.dao.UserDao" %>
<%
    String name = (String) session.getAttribute("name");
    String email = (String) session.getAttribute("email");
    if (name == null) {
        response.sendRedirect("UserLogin.jsp");
        return;
    }
    UserDao dao = new UserDao();
    List<Pay> payments = dao.getPaymentHistory(email);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SMEVCS - Payment History</title>
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
        .navbar a:hover { background: rgba(255,255,255,0.3); }
        .content {
            max-width: 900px;
            margin: 40px auto;
            padding: 0 20px;
        }
        .page-header {
            margin-bottom: 25px;
        }
        .page-header h2 {
            color: #0f3460;
            font-size: 24px;
            margin-bottom: 5px;
        }
        .page-header p { color: #666; }
        table {
            width: 100%;
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            border-collapse: collapse;
            overflow: hidden;
        }
        th {
            background: #0f3460;
            color: white;
            padding: 15px;
            text-align: left;
            font-size: 14px;
        }
        td {
            padding: 15px;
            border-bottom: 1px solid #eee;
            font-size: 14px;
            color: #333;
        }
        tr:last-child td { border-bottom: none; }
        tr:hover td { background: #f8f9fa; }
        .amount {
            color: #27ae60;
            font-weight: bold;
        }
        .no-data {
            text-align: center;
            padding: 60px;
            background: white;
            border-radius: 15px;
            color: #666;
        }
        .no-data .icon { font-size: 50px; margin-bottom: 15px; }
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
        <a href="UserHome.jsp" class="back-btn">← Back to Home</a>
        <div class="page-header">
            <h2>💳 Payment History</h2>
            <p>All your payment records</p>
        </div>
        <% if (payments != null && payments.size() > 0) { %>
        <table>
            <tr>
                <th>#</th>
                <th>Slot Name</th>
                <th>Vehicle No</th>
                <th>Amount</th>
                <th>Date</th>
            </tr>
            <% int i = 1; for (Pay pay : payments) { %>
            <tr>
                <td><%= i++ %></td>
                <td>⚡ <%= pay.getSlotname() %></td>
                <td><%= pay.getVehicle_no() %></td>
                <td class="amount">₹ <%= pay.getAmount() %></td>
                <td><%= pay.getPayment_date() %></td>
            </tr>
            <% } %>
        </table>
        <% } else { %>
        <div class="no-data">
            <div class="icon">💳</div>
            <h3>No payment records found</h3>
            <p>Your payment history will appear here after booking</p>
        </div>
        <% } %>
    </div>
</body>
</html>