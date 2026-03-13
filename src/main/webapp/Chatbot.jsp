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
    <title>SMEVCS - Chatbot</title>
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
        .chat-container {
            max-width: 700px;
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
        .chat-box {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .chat-header {
            background: linear-gradient(135deg, #0f3460, #16213e);
            padding: 20px;
            color: white;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .bot-avatar {
            width: 45px;
            height: 45px;
            background: rgba(255,255,255,0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
        }
        .chat-header h3 { font-size: 16px; }
        .chat-header p { font-size: 12px; opacity: 0.8; }
        .chat-messages {
            height: 400px;
            overflow-y: auto;
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        .message {
            display: flex;
            gap: 10px;
            align-items: flex-end;
        }
        .message.user { flex-direction: row-reverse; }
        .message-bubble {
            max-width: 70%;
            padding: 12px 16px;
            border-radius: 18px;
            font-size: 14px;
            line-height: 1.5;
        }
        .bot .message-bubble {
            background: #f0f2f5;
            color: #333;
            border-bottom-left-radius: 4px;
        }
        .user .message-bubble {
            background: #0f3460;
            color: white;
            border-bottom-right-radius: 4px;
        }
        .message-icon {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            flex-shrink: 0;
        }
        .bot .message-icon { background: #e8f4fd; }
        .user .message-icon { background: #0f3460; }
        .quick-replies {
            padding: 10px 20px;
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            border-top: 1px solid #eee;
        }
        .quick-reply {
            background: #e8f4fd;
            color: #0f3460;
            border: none;
            padding: 8px 15px;
            border-radius: 20px;
            font-size: 13px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .quick-reply:hover { background: #0f3460; color: white; }
        .chat-input {
            display: flex;
            padding: 15px;
            border-top: 1px solid #eee;
            gap: 10px;
        }
        .chat-input input {
            flex: 1;
            padding: 12px 15px;
            border: 2px solid #ddd;
            border-radius: 25px;
            font-size: 14px;
            outline: none;
        }
        .chat-input input:focus { border-color: #0f3460; }
        .chat-input button {
            background: #0f3460;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 25px;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.3s;
        }
        .chat-input button:hover { background: #16213e; }
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
    <div class="chat-container">
        <a href="UserHome.jsp" class="back-btn">← Back to Home</a>
        <div class="chat-box">
            <div class="chat-header">
                <div class="bot-avatar">🤖</div>
                <div>
                    <h3>SMEVCS Assistant</h3>
                    <p>🟢 Online - Here to help!</p>
                </div>
            </div>
            <div class="chat-messages" id="chatMessages">
                <div class="message bot">
                    <div class="message-icon">🤖</div>
                    <div class="message-bubble">
                        Hello <%= name %>! 👋 Welcome to SMEVCS. I'm here to help you with EV charging queries. What would you like to know?
                    </div>
                </div>
            </div>
            <div class="quick-replies">
                <button class="quick-reply" onclick="sendQuick('How do I book a slot?')">How do I book a slot?</button>
                <button class="quick-reply" onclick="sendQuick('What are the charges?')">What are the charges?</button>
                <button class="quick-reply" onclick="sendQuick('How long does charging take?')">Charging time?</button>
                <button class="quick-reply" onclick="sendQuick('How do I view my bookings?')">View my bookings</button>
            </div>
            <div class="chat-input">
                <input type="text" id="userInput" placeholder="Type your message..." 
                    onkeypress="if(event.key==='Enter') sendMessage()"/>
                <button onclick="sendMessage()">➤</button>
            </div>
        </div>
    </div>
    <script>
        const responses = {
            'how do i book a slot': 'To book a slot: Go to Home → Search Slots → Enter your city → Click "Book & Pay" on your preferred slot! ⚡',
            'what are the charges': 'Charging rates vary by duration: 1 Hour = ₹50, 2 Hours = ₹90, 3 Hours = ₹130, Full Day = ₹400. Payment via UPI, Card or Net Banking. 💳',
            'how long does charging take': 'Charging time depends on your EV battery. Typically: Fast charging takes 1-2 hours, Standard charging takes 4-8 hours. ⚡',
            'how do i view my bookings': 'You can view your bookings by going to Home → Booking History. All your past bookings will be listed there! 📋',
            'default': "I'm not sure about that. Please contact our support or try asking about bookings, charges, or charging time! 😊"
        };

        function sendMessage() {
            const input = document.getElementById('userInput');
            const msg = input.value.trim();
            if (!msg) return;
            addMessage(msg, 'user');
            input.value = '';
            setTimeout(() => {
                const key = Object.keys(responses).find(k => msg.toLowerCase().includes(k));
                addMessage(key ? responses[key] : responses['default'], 'bot');
            }, 600);
        }

        function sendQuick(msg) {
            addMessage(msg, 'user');
            setTimeout(() => {
                const key = Object.keys(responses).find(k => msg.toLowerCase().includes(k));
                addMessage(key ? responses[key] : responses['default'], 'bot');
            }, 600);
        }

        function addMessage(text, sender) {
            const messages = document.getElementById('chatMessages');
            const div = document.createElement('div');
            div.className = `message ${sender}`;
            div.innerHTML = `
                <div class="message-icon">${sender === 'bot' ? '🤖' : '👤'}</div>
                <div class="message-bubble">${text}</div>
            `;
            messages.appendChild(div);
            messages.scrollTop = messages.scrollHeight;
        }
    </script>
</body>
</html>