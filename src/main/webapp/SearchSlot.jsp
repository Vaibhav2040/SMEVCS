<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.bean.Slot" %>
<%
    String name = (String) session.getAttribute("name");
    if (name == null) {
        response.sendRedirect("UserLogin.jsp");
        return;
    }
    List<Slot> slots = (List<Slot>) request.getAttribute("slots");
    String city = (String) request.getAttribute("city");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SMEVCS - Search Results</title>
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
        .results-header {
            margin-bottom: 25px;
        }
        .results-header h2 {
            color: #0f3460;
            font-size: 24px;
            margin-bottom: 5px;
        }
        .results-header p { color: #666; }
        .slot-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .slot-info h3 {
            color: #0f3460;
            font-size: 18px;
            margin-bottom: 8px;
        }
        .slot-info p {
            color: #666;
            font-size: 14px;
            margin-bottom: 4px;
        }
        .slot-info span {
            background: #e8f4fd;
            color: #0f3460;
            padding: 3px 10px;
            border-radius: 20px;
            font-size: 12px;
            margin-right: 5px;
        }
        .book-btn {
            background: #0f3460;
            color: white;
            padding: 12px 25px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
            transition: background 0.3s;
            white-space: nowrap;
        }
        .book-btn:hover { background: #16213e; }
        .no-results {
            text-align: center;
            padding: 60px;
            background: white;
            border-radius: 15px;
            color: #666;
        }
        .no-results .icon { font-size: 50px; margin-bottom: 15px; }
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
        <div class="results-header">
            <h2>Search Results for "<%= city %>"</h2>
            <p><%= slots != null ? slots.size() : 0 %> charging slot(s) found</p>
        </div>
        <% if (slots != null && slots.size() > 0) { %>
            <% for (Slot slot : slots) { %>
            <div class="slot-card">
                <div class="slot-info">
                    <h3>⚡ <%= slot.getSlotname() %></h3>
                    <p>📍 <%= slot.getSlotaddress() %></p>
                    <p>
                        <span><%= slot.getCity() %></span>
                        <span><%= slot.getState() %></span>
                        <span><%= slot.getCountry() %></span>
                        <span><%= slot.getSlotarea() %></span>
                    </p>
                </div>
                <a href="Pay.jsp?slotname=<%= slot.getSlotname() %>" class="book-btn">Book & Pay</a>
            </div>
            <% } %>
        <% } else { %>
        <div class="no-results">
            <div class="icon">🔍</div>
            <h3>No slots found in <%= city %></h3>
            <p>Try searching for a different city</p>
            <br>
            <a href="Search.jsp" class="book-btn">Search Again</a>
        </div>
        <% } %>
    </div>
</body>
</html>