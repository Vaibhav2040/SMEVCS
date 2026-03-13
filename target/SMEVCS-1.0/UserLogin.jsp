<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SMEVCS - User Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            background: #0a0a0a;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            position: relative;
        }
        .bg-animation {
            position: fixed;
            inset: 0;
            z-index: 0;
            background: radial-gradient(ellipse at 20% 50%, #1a1f6e22 0%, transparent 50%),
                        radial-gradient(ellipse at 80% 20%, #6e1a5a22 0%, transparent 50%),
                        radial-gradient(ellipse at 50% 80%, #1a6e3a22 0%, transparent 50%);
        }
        .grid-overlay {
            position: fixed;
            inset: 0;
            z-index: 0;
            background-image: linear-gradient(rgba(255,255,255,0.03) 1px, transparent 1px),
                              linear-gradient(90deg, rgba(255,255,255,0.03) 1px, transparent 1px);
            background-size: 50px 50px;
        }
        .floating-orbs {
            position: fixed;
            inset: 0;
            z-index: 0;
            overflow: hidden;
        }
        .orb {
            position: absolute;
            border-radius: 50%;
            filter: blur(80px);
            opacity: 0.15;
            animation: float 8s ease-in-out infinite;
        }
        .orb1 { width: 400px; height: 400px; background: #4f6ef7; top: -100px; left: -100px; animation-delay: 0s; }
        .orb2 { width: 300px; height: 300px; background: #f7c44f; bottom: -50px; right: -50px; animation-delay: 3s; }
        .orb3 { width: 200px; height: 200px; background: #4ff7a0; top: 50%; left: 50%; animation-delay: 6s; }
        @keyframes float {
            0%, 100% { transform: translateY(0px) scale(1); }
            50% { transform: translateY(-30px) scale(1.05); }
        }
        .container {
            position: relative;
            z-index: 1;
            width: 100%;
            max-width: 420px;
            padding: 20px;
        }
        .logo-section {
            text-align: center;
            margin-bottom: 35px;
        }
        .logo-icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 70px;
            height: 70px;
            background: linear-gradient(135deg, #4f6ef7, #a44ff7);
            border-radius: 20px;
            font-size: 35px;
            margin-bottom: 15px;
            box-shadow: 0 0 40px rgba(79,110,247,0.4);
            animation: pulse 3s ease-in-out infinite;
        }
        @keyframes pulse {
            0%, 100% { box-shadow: 0 0 40px rgba(79,110,247,0.4); }
            50% { box-shadow: 0 0 60px rgba(79,110,247,0.7); }
        }
        .logo-section h1 {
            color: white;
            font-size: 28px;
            font-weight: 700;
            letter-spacing: 2px;
        }
        .logo-section p {
            color: rgba(255,255,255,0.5);
            font-size: 13px;
            margin-top: 5px;
        }
        .card {
            background: rgba(255,255,255,0.05);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255,255,255,0.1);
            border-radius: 24px;
            padding: 40px;
        }
        .card h2 {
            color: white;
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 5px;
        }
        .card .subtitle {
            color: rgba(255,255,255,0.4);
            font-size: 13px;
            margin-bottom: 30px;
        }
        .form-group { margin-bottom: 20px; }
        label {
            display: block;
            color: rgba(255,255,255,0.6);
            font-size: 13px;
            font-weight: 500;
            margin-bottom: 8px;
        }
        .input-wrapper {
            position: relative;
        }
        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 16px;
            opacity: 0.5;
        }
        input {
            width: 100%;
            padding: 14px 15px 14px 42px;
            background: rgba(255,255,255,0.07);
            border: 1px solid rgba(255,255,255,0.1);
            border-radius: 12px;
            color: white;
            font-size: 14px;
            font-family: 'Inter', sans-serif;
            transition: all 0.3s;
        }
        input::placeholder { color: rgba(255,255,255,0.25); }
        input:focus {
            outline: none;
            border-color: #4f6ef7;
            background: rgba(79,110,247,0.1);
            box-shadow: 0 0 0 3px rgba(79,110,247,0.15);
        }
        .btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #4f6ef7, #a44ff7);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            font-family: 'Inter', sans-serif;
            margin-top: 10px;
            position: relative;
            overflow: hidden;
        }
        .btn::after {
            content: '';
            position: absolute;
            inset: 0;
            background: white;
            opacity: 0;
            transition: opacity 0.3s;
        }
        .btn:hover::after { opacity: 0.1; }
        .btn:hover { transform: translateY(-1px); box-shadow: 0 10px 30px rgba(79,110,247,0.4); }
        .btn:active { transform: translateY(0); }
        .divider {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 25px 0;
        }
        .divider::before, .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: rgba(255,255,255,0.1);
        }
        .divider span { color: rgba(255,255,255,0.3); font-size: 12px; }
        .links {
            text-align: center;
            font-size: 13px;
        }
        .links a {
            color: #4f6ef7;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }
        .links a:hover { color: #a44ff7; }
        .links p { color: rgba(255,255,255,0.4); margin-bottom: 8px; }
        .admin-link {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            color: rgba(255,255,255,0.3) !important;
            font-size: 12px;
            margin-top: 5px;
        }
        .admin-link:hover { color: rgba(255,255,255,0.6) !important; }
    </style>
</head>
<body>
    <div class="bg-animation"></div>
    <div class="grid-overlay"></div>
    <div class="floating-orbs">
        <div class="orb orb1"></div>
        <div class="orb orb2"></div>
        <div class="orb orb3"></div>
    </div>
    <div class="container">
        <div class="logo-section">
            <div class="logo-icon">⚡</div>
            <h1>SMEVCS</h1>
            <p>Smart EV Charging Station Management</p>
        </div>
        <div class="card">
            <h2>Welcome back</h2>
            <p class="subtitle">Sign in to your account to continue</p>
            <form action="UserLoginController" method="post">
                <div class="form-group">
                    <label>Email Address</label>
                    <div class="input-wrapper">
                        <span class="input-icon">📧</span>
                        <input type="email" name="email" placeholder="Enter your email" required/>
                    </div>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <div class="input-wrapper">
                        <span class="input-icon">🔒</span>
                        <input type="password" name="password" placeholder="Enter your password" required/>
                    </div>
                </div>
                <button type="submit" class="btn">Sign In →</button>
            </form>
            <div class="divider"><span>or</span></div>
            <div class="links">
                <p>Don't have an account? <a href="UserRegister.jsp">Create one free</a></p>
                <a href="AdminLogin.jsp" class="admin-link">🔐 Admin Portal</a>
            </div>
        </div>
    </div>
</body>
</html>