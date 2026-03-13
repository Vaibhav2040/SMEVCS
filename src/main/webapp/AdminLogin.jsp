<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SMEVCS - Admin Login</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #1a1a2e, #16213e, #0f3460);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            width: 400px;
        }
        h2 {
            text-align: center;
            color: #c0392b;
            margin-bottom: 10px;
            font-size: 24px;
        }
        .subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 30px;
            font-size: 14px;
        }
        .form-group { margin-bottom: 20px; }
        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: bold;
            font-size: 14px;
        }
        input {
            width: 100%;
            padding: 12px;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s;
        }
        input:focus {
            outline: none;
            border-color: #c0392b;
        }
        .btn {
            width: 100%;
            padding: 12px;
            background: #c0392b;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .btn:hover { background: #a93226; }
        .links {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }
        .links a {
            color: #0f3460;
            text-decoration: none;
            font-weight: bold;
        }
        .admin-badge {
            background: #c0392b;
            color: white;
            text-align: center;
            padding: 8px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 13px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>🔐 Admin Portal</h2>
        <p class="subtitle">SMEVCS Administration</p>
        <div class="admin-badge">⚠️ Restricted Access - Admins Only</div>
        <form action="AdminLoginController" method="post">
            <div class="form-group">
                <label>Admin Email</label>
                <input type="email" name="email" placeholder="Enter admin email" required/>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="Enter admin password" required/>
            </div>
            <button type="submit" class="btn">Login as Admin</button>
        </form>
        <div class="links">
            <p><a href="UserLogin.jsp">← Back to User Login</a></p>
        </div>
    </div>
</body>
</html>