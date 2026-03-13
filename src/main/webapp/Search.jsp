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
    <title>SMEVCS - Search Slots</title>
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
        .search-section {
            background: linear-gradient(135deg, #0f3460, #16213e);
            padding: 50px 30px;
            text-align: center;
            color: white;
        }
        .search-section h2 { font-size: 28px; margin-bottom: 10px; }
        .search-section p { opacity: 0.8; margin-bottom: 30px; }
        .search-box {
            display: flex;
            justify-content: center;
            gap: 10px;
            max-width: 500px;
            margin: 0 auto;
        }
        .search-box input {
            flex: 1;
            padding: 15px 20px;
            border: none;
            border-radius: 30px;
            font-size: 16px;
            outline: none;
        }
        .search-box button {
            padding: 15px 30px;
            background: #e94560;
            color: white;
            border: none;
            border-radius: 30px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .search-box button:hover { background: #c73652; }
        .content {
            max-width: 800px;
            margin: 40px auto;
            padding: 0 20px;
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
    <div class="search-section">
        <h2>🔍 Find Charging Slots</h2>
        <p>Search for available EV charging stations in your city</p>
        <form action="SearchSlotcontroller" method="post">
            <div class="search-box">
                <input type="text" name="city" placeholder="Enter city name..." required/>
                <button type="submit">Search</button>
            </div>
        </form>
    </div>
    <div class="content">
        <a href="UserHome.jsp" class="back-btn">← Back to Home</a>
    </div>
</body>
</html>