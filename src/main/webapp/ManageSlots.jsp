<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.bean.Slot" %>
<%@ page import="com.dao.AdminDao" %>
<%
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }
    AdminDao dao = new AdminDao();
    List<Slot> slots = dao.getAllSlots();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SMEVCS - Manage Slots</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            min-height: 100vh;
        }
        .navbar {
            background: linear-gradient(135deg, #c0392b, #a93226);
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
        .top-section {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            margin-bottom: 40px;
        }
        .add-form {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }
        .add-form h3 {
            color: #c0392b;
            margin-bottom: 20px;
            font-size: 18px;
        }
        .form-group { margin-bottom: 15px; }
        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: bold;
            font-size: 13px;
        }
        input {
            width: 100%;
            padding: 10px;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 13px;
        }
        input:focus {
            outline: none;
            border-color: #c0392b;
        }
        .btn-add {
            width: 100%;
            padding: 12px;
            background: #c0392b;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .btn-add:hover { background: #a93226; }
        .slots-list {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }
        .slots-list h3 {
            color: #0f3460;
            margin-bottom: 20px;
            font-size: 18px;
        }
        .slot-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px;
            border-bottom: 1px solid #eee;
            font-size: 13px;
        }
        .slot-item:last-child { border-bottom: none; }
        .slot-item .slot-name {
            font-weight: bold;
            color: #0f3460;
        }
        .slot-item .slot-city { color: #666; }
        .btn-delete {
            background: #e74c3c;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 12px;
        }
        .btn-delete:hover { background: #c0392b; }
        .no-slots {
            text-align: center;
            color: #666;
            padding: 20px;
        }
        .back-btn {
            display: inline-block;
            margin-bottom: 20px;
            color: #c0392b;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1>🔐 SMEVCS Admin</h1>
        <div>
            <a href="AdminHome.jsp">Dashboard</a>
            <a href="LogoutController">Logout</a>
        </div>
    </div>
    <div class="content">
        <a href="AdminHome.jsp" class="back-btn">← Back to Dashboard</a>
        <div class="top-section">
            <div class="add-form">
                <h3>➕ Add New Slot</h3>
                <form action="ManageSlotsController" method="post">
                    <input type="hidden" name="action" value="add"/>
                    <div class="form-group">
                        <label>Slot Name</label>
                        <input type="text" name="slotname" placeholder="e.g. EV Station A1" required/>
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <input type="text" name="slotaddress" placeholder="Full address" required/>
                    </div>
                    <div class="form-group">
                        <label>Area</label>
                        <input type="text" name="slotarea" placeholder="Area/District" required/>
                    </div>
                    <div class="form-group">
                        <label>City</label>
                        <input type="text" name="city" placeholder="City" required/>
                    </div>
                    <div class="form-group">
                        <label>State</label>
                        <input type="text" name="state" placeholder="State" required/>
                    </div>
                    <div class="form-group">
                        <label>Country</label>
                        <input type="text" name="country" placeholder="Country" required/>
                    </div>
                    <button type="submit" class="btn-add">➕ Add Slot</button>
                </form>
            </div>
            <div class="slots-list">
                <h3>📍 All Slots (<%= slots != null ? slots.size() : 0 %>)</h3>
                <% if (slots != null && slots.size() > 0) { %>
                    <% for (Slot slot : slots) { %>
                    <div class="slot-item">
                        <div>
                            <div class="slot-name">⚡ <%= slot.getSlotname() %></div>
                            <div class="slot-city">📍 <%= slot.getCity() %>, <%= slot.getState() %></div>
                        </div>
                        <form action="ManageSlotsController" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete"/>
                            <input type="hidden" name="id" value="<%= slot.getId() %>"/>
                            <button type="submit" class="btn-delete"
                                onclick="return confirm('Delete this slot?')">🗑️ Delete</button>
                        </form>
                    </div>
                    <% } %>
                <% } else { %>
                <div class="no-slots">No slots added yet</div>
                <% } %>
            </div>
        </div>
    </div>
</body>
</html>