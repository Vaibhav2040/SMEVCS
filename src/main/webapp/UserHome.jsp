<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String name = (String) session.getAttribute("name");
    if (name == null) {
        response.sendRedirect("UserLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SMEVCS - Home</title>
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
        .navbar .user-info { font-size: 14px; }
        .navbar a {
            color: #fff;
            text-decoration: none;
            background: rgba(255,255,255,0.2);
            padding: 8px 15px;
            border-radius: 20px;
            margin-left: 10px;
            font-size: 13px;
            transition: background 0.3s;
        }
        .navbar a:hover { background: rgba(255,255,255,0.3); }
        .welcome {
            background: linear-gradient(135deg, #0f3460, #16213e);
            color: white;
            padding: 40px 30px;
            text-align: center;
        }
        .welcome h2 { font-size: 28px; margin-bottom: 10px; }
        .welcome p { font-size: 16px; opacity: 0.8; }
        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            padding: 40px 30px;
            max-width: 900px;
            margin: 0 auto;
        }
        .card {
            background: white;
            border-radius: 15px;
            padding: 30px 20px;
            text-align: center;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            text-decoration: none;
            color: #333;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
        }
        .card .icon { font-size: 40px; margin-bottom: 15px; }
        .card h3 { font-size: 16px; color: #0f3460; margin-bottom: 8px; }
        .card p { font-size: 13px; color: #666; }
    </style>
</head>
<body>
    <div class="navbar">
        <h1>⚡ SMEVCS</h1>
        <div>
            <span class="user-info">Welcome, <%= name %></span>
            <a href="BookingHistory.jsp">My Bookings</a>
            <a href="PaymentHistory.jsp">Payments</a>
            <a href="LogoutController">Logout</a>
        </div>
    </div>
    <div class="welcome">
        <h2>Welcome back, <%= name %>! ⚡</h2>
        <p>Manage your EV charging slots easily</p>
    </div>
    <div class="cards">
        <a href="Search.jsp" class="card">
            <div class="icon">🔍</div>
            <h3>Search Slots</h3>
            <p>Find available charging slots near you</p>
        </a>
        <a href="ViewSlots.jsp" class="card">
            <div class="icon">📍</div>
            <h3>View All Slots</h3>
            <p>Browse all charging stations</p>
        </a>
        <a href="BookingHistory.jsp" class="card">
            <div class="icon">📋</div>
            <h3>Booking History</h3>
            <p>View your past bookings</p>
        </a>
        <a href="PaymentHistory.jsp" class="card">
            <div class="icon">💳</div>
            <h3>Payment History</h3>
            <p>Track your payments</p>
        </a>
        <a href="Chatbot.jsp" class="card">
            <div class="icon">🤖</div>
            <h3>Chatbot</h3>
            <p>Get help from our assistant</p>
        </a>
        <a href="ViewInformation.jsp" class="card">
            <div class="icon">ℹ️</div>
            <h3>My Profile</h3>
            <p>View your information</p>
        </a>
    </div>
</body>
</html>