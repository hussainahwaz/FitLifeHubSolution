<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FitLifeHub.Register" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FitLifeHub - Register</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #f093fb 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        /* Animated gradient background */
        body::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: 
                radial-gradient(circle at 20% 50%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
                radial-gradient(circle at 80% 80%, rgba(255, 119, 255, 0.3) 0%, transparent 50%),
                radial-gradient(circle at 40% 20%, rgba(138, 180, 248, 0.3) 0%, transparent 50%);
            animation: gradientShift 15s ease infinite;
        }

        @keyframes gradientShift {
            0%, 100% {
                transform: translate(0, 0) rotate(0deg);
            }
            33% {
                transform: translate(5%, 5%) rotate(120deg);
            }
            66% {
                transform: translate(-5%, 5%) rotate(240deg);
            }
        }

        /* Floating bubbles effect */
        .bubble {
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation: float 20s infinite;
        }

        .bubble:nth-child(1) { width: 80px; height: 80px; left: 10%; animation-delay: 0s; }
        .bubble:nth-child(2) { width: 60px; height: 60px; left: 20%; animation-delay: 2s; }
        .bubble:nth-child(3) { width: 100px; height: 100px; left: 35%; animation-delay: 4s; }
        .bubble:nth-child(4) { width: 70px; height: 70px; left: 50%; animation-delay: 0s; }
        .bubble:nth-child(5) { width: 90px; height: 90px; left: 70%; animation-delay: 3s; }
        .bubble:nth-child(6) { width: 65px; height: 65px; left: 85%; animation-delay: 1s; }

        @keyframes float {
            0% {
                transform: translateY(100vh) scale(0);
                opacity: 0;
            }
            10% {
                opacity: 0.6;
            }
            90% {
                opacity: 0.6;
            }
            100% {
                transform: translateY(-100vh) scale(1.2);
                opacity: 0;
            }
        }

        .container {
            display: flex;
            max-width: 1200px;
            width: 95%;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            position: relative;
            z-index: 1;
            min-height: 650px;
        }

        .form-section {
            flex: 1;
            padding: 50px 50px;
            max-width: 500px;
        }

        .visual-section {
            flex: 1.2;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #f093fb 100%);
            position: relative;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .visual-section::before {
            content: '';
            position: absolute;
            width: 200%;
            height: 200%;
            background: 
                radial-gradient(circle at 30% 40%, rgba(255, 255, 255, 0.2) 0%, transparent 40%),
                radial-gradient(circle at 70% 60%, rgba(255, 255, 255, 0.15) 0%, transparent 40%);
            animation: visualPulse 8s ease-in-out infinite;
        }

        @keyframes visualPulse {
            0%, 100% { transform: translate(-25%, -25%) scale(1); }
            50% { transform: translate(-30%, -30%) scale(1.1); }
        }

        .visual-image {
            position: relative;
            z-index: 1;
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0.9;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 30px;
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        .logo-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 20px;
            font-weight: bold;
        }

        .form-header {
            margin-bottom: 35px;
        }

        .form-header h1 {
            font-size: 32px;
            color: #2d3748;
            margin-bottom: 5px;
        }

        .form-header p {
            color: #718096;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: 500;
            color: #4a5568;
            margin-bottom: 8px;
            font-size: 14px;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper input {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.3s ease;
            background: white;
        }

        .input-wrapper input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .validator {
            display: block;
            color: #e53e3e;
            font-size: 12px;
            margin-top: 5px;
        }

        .btn-register {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            color: white;
            font-size: 16px;
            font-weight: 600;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
        }

        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
        }

        .btn-register:active {
            transform: translateY(0);
        }

        .divider {
            text-align: center;
            margin: 25px 0;
            color: #a0aec0;
            font-size: 14px;
            position: relative;
        }

        .divider::before,
        .divider::after {
            content: '';
            position: absolute;
            top: 50%;
            width: 42%;
            height: 1px;
            background: #e2e8f0;
        }

        .divider::before { left: 0; }
        .divider::after { right: 0; }

        .social-buttons {
            display: flex;
            gap: 15px;
            margin-bottom: 25px;
        }

        .social-btn {
            flex: 1;
            padding: 12px;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            background: white;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .social-btn:hover {
            border-color: #667eea;
            background: #f7fafc;
        }

        .social-btn img {
            width: 24px;
            height: 24px;
        }

        .signin-link {
            text-align: center;
            color: #718096;
            font-size: 14px;
            margin-top: 20px;
        }

        .signin-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
        }

        .signin-link a:hover {
            text-decoration: underline;
        }

        #lblMessage {
            text-align: center;
            margin-top: 15px;
            font-weight: 500;
            padding: 10px;
            border-radius: 8px;
        }

        .close-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            width: 30px;
            height: 30px;
            background: rgba(255, 255, 255, 0.2);
            border: none;
            border-radius: 50%;
            color: white;
            font-size: 20px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 2;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }
            
            .visual-section {
                min-height: 200px;
            }

            .form-section {
                padding: 30px 25px;
            }
        }
    </style>
</head>
<body>
    <!-- Floating bubbles -->
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>

    <form id="form1" runat="server">
        <div class="container">
            <!-- Left side - Form -->
            <div class="form-section">
                <div class="logo">
                    <div class="logo-icon">FL</div>
                    <span>FitLifeHub</span>
                </div>

                <div class="form-header">
                    <p>Start your journey</p>
                    <h1>Sign Up to FitLifeHub</h1>
                </div>

                <!-- Username -->
                <div class="form-group">
                    <asp:Label ID="lblUsername" runat="server" Text="Your name" AssociatedControlID="txtUsername"></asp:Label>
                    <div class="input-wrapper">
                        <asp:TextBox ID="txtUsername" runat="server" placeholder="Enter your name"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server"
                        ControlToValidate="txtUsername"
                        ErrorMessage="Username is required."
                        CssClass="validator"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <!-- Email -->
                <div class="form-group">
                    <asp:Label ID="lblEmail" runat="server" Text="Email address" AssociatedControlID="txtEmail"></asp:Label>
                    <div class="input-wrapper">
                        <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Email is required."
                        CssClass="validator"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Please enter a valid email address."
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        CssClass="validator"
                        Display="Dynamic"></asp:RegularExpressionValidator>
                </div>

                <!-- Password -->
                <div class="form-group">
                    <asp:Label ID="lblPassword" runat="server" Text="Password" AssociatedControlID="txtPassword"></asp:Label>
                    <div class="input-wrapper">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                        ControlToValidate="txtPassword"
                        ErrorMessage="Password is required."
                        CssClass="validator"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <!-- Register Button -->
                <asp:Button ID="btnRegister" runat="server" Text="Sign up" OnClick="btnRegister_Click" CssClass="btn-register"/>

                <div class="divider">or sign up with</div>

                <!-- Social Login Buttons -->
                <div class="social-buttons">
                    <button type="button" class="social-btn" title="Sign up with Facebook">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="#1877F2"><path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/></svg>
                    </button>
                    <button type="button" class="social-btn" title="Sign up with Google">
                        <svg width="24" height="24" viewBox="0 0 24 24"><path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/><path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/><path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/><path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/></svg>
                    </button>
                    <button type="button" class="social-btn" title="Sign up with Apple">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="#000000"><path d="M17.05 20.28c-.98.95-2.05.8-3.08.35-1.09-.46-2.09-.48-3.24 0-1.44.62-2.2.44-3.06-.35C2.79 15.25 3.51 7.59 9.05 7.31c1.35.07 2.29.74 3.08.8 1.18-.24 2.31-.93 3.57-.84 1.51.12 2.65.72 3.4 1.8-3.12 1.87-2.38 5.98.48 7.13-.57 1.5-1.31 2.99-2.54 4.09l.01-.01zM12.03 7.25c-.15-2.23 1.66-4.07 3.74-4.25.29 2.58-2.34 4.5-3.74 4.25z"/></svg>
                    </button>
                </div>

                <div class="signin-link">
                    Have an account? <a href="Login.aspx">Sign in</a>
                </div>

                <!-- Message Label -->
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </div>

            <!-- Right side - Visual -->
            <div class="visual-section">
                <button type="button" class="close-btn" onclick="return false;">×</button>
                <img src="https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?w=800&h=1000&fit=crop" 
                     alt="Fitness" 
                     class="visual-image" />
            </div>
        </div>
    </form>
</body>
</html>
