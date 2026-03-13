<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SMEVCS - User Registration</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #1a1a2e, #16213e, #0f3460);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            width: 500px;
        }
        h2 {
            text-align: center;
            color: #0f3460;
            margin-bottom: 5px;
            font-size: 24px;
        }
        .subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 30px;
            font-size: 14px;
        }
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group.full { grid-column: span 2; }
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
            transition: border-color 0.3s;
        }
        input:focus {
            outline: none;
            border-color: #0f3460;
        }
        .btn {
            width: 100%;
            padding: 12px;
            background: #0f3460;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
            margin-top: 10px;
        }
        .btn:hover { background: #16213e; }
        .links {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }
        .links a {
            color: #0f3460;
            text-decoration: none;
            font-weight: bold;
        }
        .section-title {
            color: #0f3460;
            font-size: 14px;
            font-weight: bold;
            margin: 15px 0 10px;
            padding-bottom: 5px;
            border-bottom: 2px solid #eee;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>⚡ Register</h2>
        <p class="subtitle">Create your SMEVCS account</p>
        <form action="UserRegistrationController" method="post">
            <p class="section-title">Personal Information</p>
            <div class="form-row">
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" name="name" placeholder="Your name" required/>
                </div>
                <div class="form-group">
                    <label>Mobile Number</label>
                    <input type="text" name="mobile_no" placeholder="Mobile number" required/>
                </div>
                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" name="email" placeholder="Email address" required/>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" placeholder="Password" required/>
                </div>
                <div class="form-group full">
                    <label>Address</label>
                    <input type="text" name="address" placeholder="Your address" required/>
                </div>
            </div>
            <p class="section-title">Vehicle Information</p>
            <div class="form-row">
                <div class="form-group">
                    <label>Vehicle Number</label>
                    <input type="text" name="vehicle_no" placeholder="Vehicle number" required/>
                </div>
                <div class="form-group">
                    <label>Vehicle Name</label>
                    <input type="text" name="vehicle_name" placeholder="Vehicle name" required/>
                </div>
                <div class="form-group full">
                    <label>Vehicle Owner Name</label>
                    <input type="text" name="vehicle_owner_name" placeholder="Owner name" required/>
                </div>
            </div>
            <button type="submit" class="btn">Create Account</button>
        </form>
        <div class="links">
            <p>Already have an account? <a href="UserLogin.jsp">Login here</a></p>
        </div>
    </div>
</body>
</html>