<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.bean.Slot" %>
<%@ page import="com.dao.AdminDao" %>
<%
    String name = (String) session.getAttribute("name");
    String admin = (String) session.getAttribute("admin");
    if (name == null && admin == null) {
        response.sendRedirect("UserLogin.jsp");
        return;
    }
    AdminDao dao = new AdminDao();
    List<Slot> slots = dao.getAllSlots();
    boolean isAdmin = admin != null;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SMEVCS - View Slots</title>
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
            max-width: 1000px;
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
        .slots-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
        }
        .slot-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            transition: transform 0.3s;
        }
        .slot-card:hover {
            transform: translateY(-5px);
        }
        .slot-card .slot-icon {
            font-size: 35px;
            margin-bottom: 15px;
        }
        .slot-card h3 {
            color: #0f3460;
            font-size: 18px;
            margin-bottom: 10px;
        }
        .slot-card p {
            color: #666;
            font-size: 13px;
            margin-bottom: 6px;
        }
        .slot-card .tags {
            margin: 12px 0;
        }
        .slot-card .tag {
            background: #e8f4fd;
            color: #0f3460;
            padding: 3px 10px;
            border-radius: 20px;
            font-size: 11px;
            margin-right: 5px;
        }
        .book-btn {
            display: block;
            text-align: center;
            background: #0f3460;
            color: white;
            padding: 10px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 14px;
            margin-top: 15px;
            transition: background 0.3s;
        }
        .book-btn:hover { background: #16213e; }
        .no-data {
            text-align: center;
            padding: 60px;
            background: white;
            border-radius: 15px;
            color: #666;
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
            <% if (isAdmin) { %>
                <a href="AdminHome.jsp">Dashboard</a>
            <% } else { %>
                <a href="UserHome.jsp">Home</a>
            <% } %>
            <a href="LogoutController">Logout</a>
        </div>
    </div>
    <div class="content">
        <a href="<%= isAdmin ? "AdminHome.jsp" : "UserHome.jsp" %>" class="back-btn">← Back</a>
        <div class="page-header">
            <h2>📍 All Charging Slots</h2>
            <p><%= slots != null ? slots.size() : 0 %> stations available</p>
        </div>
        <% if (slots != null && slots.size() > 0) { %>
        <div class="slots-grid">
            <% for (Slot slot : slots) { %>
            <div class="slot-card">
                <div class="slot-icon">⚡</div>
                <h3><%= slot.getSlotname() %></h3>
                <p>📍 <%= slot.getSlotaddress() %></p>
                <div class="tags">
                    <span class="tag"><%= slot.getCity() %></span>
                    <span class="tag"><%= slot.getState() %></span>
                    <span class="tag"><%= slot.getSlotarea() %></span>
                </div>
                <% if (!isAdmin) { %>
                <a href="Pay.jsp?slotname=<%= slot.getSlotname() %>" class="book-btn">⚡ Book This Slot</a>
                <% } %>
            </div>
            <% } %>
        </div>
        <% } else { %>
        <div class="no-data">
            <h3>No slots available yet</h3>
            <p>Check back later for available charging stations</p>
        </div>
        <% } %>
    </div>
</body>
</html>