<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FitLifeHub.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - FitLifeHub</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700;800&display=swap" rel="stylesheet" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --primary: #FF6B35;
            --primary-dark: #E85A2A;
            --secondary: #00D9FF;
            --dark: #0A0E27;
            --dark-light: #1A1F3A;
            --text: #E8E9F3;
            --text-dim: #A0A3BD;
        }

        body {
            font-family: 'Outfit', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #f093fb 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        body::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: 
                radial-gradient(circle at 20% 50%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
                radial-gradient(circle at 80% 80%, rgba(255, 119, 255, 0.3) 0%, transparent 50%);
            animation: gradientShift 15s ease infinite;
        }

        @keyframes gradientShift {
            0%, 100% { transform: translate(0, 0) rotate(0deg); }
            33% { transform: translate(5%, 5%) rotate(120deg); }
            66% { transform: translate(-5%, 5%) rotate(240deg); }
        }

        .container {
            width: 90%;
            max-width: 450px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 25px;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.4);
            position: relative;
            z-index: 1;
            padding: 3rem 2.5rem;
        }

        .logo {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            margin-bottom: 2rem;
        }

        .logo-icon {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            font-weight: 900;
            color: white;
            box-shadow: 0 8px 20px rgba(255, 107, 53, 0.4);
        }

        .logo-text {
            font-size: 1.8rem;
            font-weight: 800;
            color: var(--dark);
        }

        .form-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .form-header h1 {
            font-size: 2rem;
            color: var(--dark);
            margin-bottom: 0.5rem;
        }

        .form-header p {
            color: #718096;
            font-size: 0.95rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            color: #4a5568;
            margin-bottom: 0.5rem;
            font-size: 0.95rem;
        }

        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 0.9rem 1rem;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            font-size: 1rem;
            font-family: 'Outfit', sans-serif;
            transition: all 0.3s ease;
            background: white;
        }

        .form-group input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(255, 107, 53, 0.1);
        }

        .validator {
            display: block;
            color: #e53e3e;
            font-size: 0.85rem;
            margin-top: 0.4rem;
        }

        .remember-forgot {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            font-size: 0.9rem;
        }

        .remember-me {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: #4a5568;
        }

        .remember-me input[type="checkbox"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
        }

        .forgot-password {
            color: var(--primary);
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .forgot-password:hover {
            color: var(--primary-dark);
        }

        .btn-login {
            width: 100%;
            padding: 1rem;
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            border: none;
            color: white;
            font-size: 1.1rem;
            font-weight: 700;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 8px 20px rgba(255, 107, 53, 0.3);
            font-family: 'Outfit', sans-serif;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 30px rgba(255, 107, 53, 0.4);
        }

        .btn-login:active {
            transform: translateY(0);
        }

        .divider {
            text-align: center;
            margin: 1.5rem 0;
            color: #a0aec0;
            font-size: 0.9rem;
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

        .signup-link {
            text-align: center;
            color: #718096;
            font-size: 0.95rem;
            margin-top: 1.5rem;
        }

        .signup-link a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 700;
        }

        .signup-link a:hover {
            text-decoration: underline;
        }

        #lblMessage {
            text-align: center;
            padding: 0.8rem;
            border-radius: 10px;
            margin-bottom: 1rem;
            font-weight: 600;
            display: none;
        }

        #lblMessage.show {
            display: block;
        }

        #lblMessage.success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        #lblMessage.error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .back-home {
            text-align: center;
            margin-top: 1.5rem;
        }

        .back-home a {
            color: #718096;
            text-decoration: none;
            font-size: 0.9rem;
            transition: color 0.3s ease;
        }

        .back-home a:hover {
            color: var(--primary);
        }

        @media (max-width: 768px) {
            .container {
                padding: 2rem 1.5rem;
            }

            .form-header h1 {
                font-size: 1.6rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="logo">
                <div class="logo-icon">FL</div>
                <span class="logo-text">FitLifeHub</span>
            </div>

            <div class="form-header">
                <h1>Welcome Back</h1>
                <p>Login to continue your fitness journey</p>
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" Text="Email Address" AssociatedControlID="txtEmail"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                    ControlToValidate="txtEmail"
                    ErrorMessage="Email is required."
                    CssClass="validator"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <asp:Label ID="lblPassword" runat="server" Text="Password" AssociatedControlID="txtPassword"></asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                    ControlToValidate="txtPassword"
                    ErrorMessage="Password is required."
                    CssClass="validator"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="remember-forgot">
                <label class="remember-me">
                    <asp:CheckBox ID="chkRememberMe" runat="server" />
                    <span>Remember me</span>
                </label>
                <a href="#" class="forgot-password">Forgot Password?</a>
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn-login" />

            <div class="signup-link">
                Don't have an account? <a href="Register.aspx">Sign up</a>
            </div>

            <div class="back-home">
                <a href="Default.aspx">← Back to Home</a>
            </div>
        </div>
    </form>
</body>
</html>
