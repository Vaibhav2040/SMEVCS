<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bean.User" %>
<%@ page import="com.dao.UserDao" %>
<%
    String name = (String) session.getAttribute("name");
    String email = (String) session.getAttribute("email");
    if (name == null) {
        response.sendRedirect("UserLogin.jsp");
        return;
    }
    UserDao dao = new UserDao();
    User user = dao.CheckUser(email, (String) session.getAttribute("password"));
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SMEVCS - My Profile</title>
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
            max-width: 700px;
            margin: 40px auto;
            padding: 0 20px;
        }
        .profile-header {
            background: linear-gradient(135deg, #0f3460, #16213e);
            border-radius: 15px;
            padding: 40px;
            text-align: center;
            color: white;
            margin-bottom: 25px;
        }
        .avatar {
            width: 80px;
            height: 80px;
            background: rgba(255,255,255,0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 35px;
            margin: 0 auto 15px;
        }
        .profile-header h2 { font-size: 24px; margin-bottom: 5px; }
        .profile-header p { opacity: 0.8; font-size: 14px; }
        .info-card {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            margin-bottom: 20px;
        }
        .info-card h3 {
            color: #0f3460;
            font-size: 16px;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #eee;
        }
        .info-row {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid #f5f5f5;
            font-size: 14px;
        }
        .info-row:last-child { border-bottom: none; }
        .info-row .label {
            color: #666;
            font-weight: bold;
        }
        .info-row .value {
            color: #333;
            text-align: right;
        }
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
        <div class="profile-header">
            <div class="avatar">👤</div>
            <h2><%= session.getAttribute("name") %></h2>
            <p><%= email %></p>
        </div>
        <div class="info-card">
            <h3>👤 Personal Information</h3>
            <div class="info-row">
                <span class="label">Full Name</span>
                <span class="value"><%= session.getAttribute("name") %></span>
            </div>
            <div class="info-row">
                <span class="label">Email</span>
                <span class="value"><%= email %></span>
            </div>
            <div class="info-row">
                <span class="label">Mobile</span>
                <span class="value"><%= user.getMobile_no() != null ? user.getMobile_no() : "N/A" %></span>
            </div>
            <div class="info-row">
                <span class="label">Address</span>
                <span class="value"><%= user.getAddress() != null ? user.getAddress() : "N/A" %></span>
            </div>
        </div>
        <div class="info-card">
            <h3>🚗 Vehicle Information</h3>
            <div class="info-row">
                <span class="label">Vehicle Number</span>
                <span class="value"><%= session.getAttribute("vehicleno") %></span>
            </div>
            <div class="info-row">
                <span class="label">Vehicle Name</span>
                <span class="value"><%= user.getVehicle_name() != null ? user.getVehicle_name() : "N/A" %></span>
            </div>
            <div class="info-row">
                <span class="label">Owner Name</span>
                <span class="value"><%= user.getVehicle_owner_name() != null ? user.getVehicle_owner_name() : "N/A" %></span>
            </div>
        </div>
    </div>
</body>
</html>