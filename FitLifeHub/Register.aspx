<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FitLifeHub.Register" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up - FitLifeHub</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700;800&family=Space+Mono:wght@400;700&display=swap" rel="stylesheet" />
    <link href="styles/brand-colors.css" rel="stylesheet" type="text/css" />
    <style>
        body {
            background: linear-gradient(135deg, #e8f4f8 0%, #fff 50%, #fef5ec 100%);
            min-height: 100vh;
            padding-top: 80px;
        }

        .register-container {
            max-width: 900px;
            margin: 3rem auto;
            padding: 0 2rem;
        }

        .register-header {
            text-align: center;
            margin-bottom: 3rem;
        }

        .register-header h1 {
            font-size: 3rem;
            font-weight: 800;
            margin-bottom: 0.5rem;
        }

        .register-header p {
            font-size: 1.1rem;
            color: var(--text-gray);
        }

        .register-card {
            background: white;
            border-radius: 20px;
            padding: 3rem;
            box-shadow: 0 10px 40px rgba(45, 114, 143, 0.15);
        }

        .form-section {
            margin-bottom: 2.5rem;
        }

        .form-section-title {
            font-size: 1.3rem;
            font-weight: 700;
            color: var(--primary-dark-blue);
            margin-bottom: 1.5rem;
            padding-bottom: 0.8rem;
            border-bottom: 2px solid var(--accent-yellow);
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .form-row.single {
            grid-template-columns: 1fr;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .password-strength {
            margin-top: 0.5rem;
            font-size: 0.85rem;
        }

        .strength-bar {
            height: 4px;
            background: #e0e6ed;
            border-radius: 4px;
            margin-top: 0.5rem;
            overflow: hidden;
        }

        .strength-fill {
            height: 100%;
            transition: all 0.3s ease;
            width: 0%;
        }

        .strength-weak { 
            background: var(--accent-red); 
            width: 33%;
        }
        .strength-medium { 
            background: var(--status-warning); 
            width: 66%;
        }
        .strength-strong { 
            background: var(--status-success); 
            width: 100%;
        }

        .terms-box {
            background: rgba(59, 142, 165, 0.05);
            padding: 1.5rem;
            border-radius: 12px;
            border-left: 4px solid var(--primary-blue);
            margin-bottom: 2rem;
        }

        .login-link {
            text-align: center;
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 1px solid var(--border-light);
        }

        .login-link a {
            color: var(--primary-blue);
            font-weight: 600;
            text-decoration: none;
        }

        .login-link a:hover {
            color: var(--primary-orange);
        }

        /* Custom Radio/Checkbox Styling */
        .radio-group {
            display: flex;
            gap: 1.5rem;
            flex-wrap: wrap;
        }

        .radio-option {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .radio-option input[type="radio"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
        }

        .radio-option label {
            cursor: pointer;
            margin: 0;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .form-row {
                grid-template-columns: 1fr;
            }

            .register-card {
                padding: 2rem 1.5rem;
            }

            .register-header h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <!-- Navigation Bar -->
        <nav class="navbar">
            <div class="navbar-container">
                <a href="Default.aspx" class="navbar-brand">
                    <div class="logo-icon">FL</div>
                    <span>FitLifeHub</span>
                </a>
                <ul class="navbar-menu">
                    <li><a href="Default.aspx">Home</a></li>
                    <li><a href="WorkoutCatalog.aspx">Workouts</a></li>
                    <li><a href="FitnessArticles.aspx">Articles</a></li>
                    <li><a href="AboutUs.aspx">About</a></li>
                    <li><a href="ContactUs.aspx">Contact</a></li>
                </ul>
                <div class="navbar-actions">
                    <a href="Login.aspx" class="btn-secondary btn-sm">Login</a>
                </div>
            </div>
        </nav>

        <!-- Registration Form -->
        <div class="register-container">
            <div class="register-header">
                <h1>Create Your Account</h1>
                <p>Join FitLifeHub and start your fitness transformation today!</p>
            </div>

            <div class="register-card">
                
                <!-- Error/Success Messages -->
                <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="mb-3">
                    <asp:Label ID="lblMessage" runat="server" />
                </asp:Panel>

                <!-- Section 1: Account Information -->
                <div class="form-section">
                    <h2 class="form-section-title">Account Information</h2>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label form-label-required" for="txtUsername">Username</label>
                            <asp:TextBox 
                                ID="txtUsername" 
                                runat="server" 
                                CssClass="form-control" 
                                placeholder="Choose a unique username"
                                MaxLength="50"
                                required="required" />
                            <asp:RequiredFieldValidator 
                                ID="rfvUsername" 
                                runat="server" 
                                ControlToValidate="txtUsername"
                                ErrorMessage="Username is required" 
                                CssClass="form-error"
                                Display="Dynamic" />
                            <asp:RegularExpressionValidator
                                ID="revUsername"
                                runat="server"
                                ControlToValidate="txtUsername"
                                ValidationExpression="^[a-zA-Z0-9_]{3,50}$"
                                ErrorMessage="Username must be 3-50 characters (letters, numbers, underscore only)"
                                CssClass="form-error"
                                Display="Dynamic" />
                        </div>

                        <div class="form-group">
                            <label class="form-label form-label-required" for="txtEmail">Email Address</label>
                            <asp:TextBox 
                                ID="txtEmail" 
                                runat="server" 
                                CssClass="form-control" 
                                TextMode="Email"
                                placeholder="your.email@example.com"
                                MaxLength="100"
                                required="required" />
                            <asp:RequiredFieldValidator 
                                ID="rfvEmail" 
                                runat="server" 
                                ControlToValidate="txtEmail"
                                ErrorMessage="Email is required" 
                                CssClass="form-error"
                                Display="Dynamic" />
                            <asp:RegularExpressionValidator
                                ID="revEmail"
                                runat="server"
                                ControlToValidate="txtEmail"
                                ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"
                                ErrorMessage="Please enter a valid email address"
                                CssClass="form-error"
                                Display="Dynamic" />
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label form-label-required" for="txtPassword">Password</label>
                            <asp:TextBox 
                                ID="txtPassword" 
                                runat="server" 
                                CssClass="form-control" 
                                TextMode="Password"
                                placeholder="Create a strong password"
                                MaxLength="255"
                                required="required"
                                onkeyup="checkPasswordStrength(this.value)" />
                            <asp:RequiredFieldValidator 
                                ID="rfvPassword" 
                                runat="server" 
                                ControlToValidate="txtPassword"
                                ErrorMessage="Password is required" 
                                CssClass="form-error"
                                Display="Dynamic" />
                            <div class="password-strength">
                                <span id="strengthText" class="text-gray">Password strength: </span>
                                <div class="strength-bar">
                                    <div id="strengthFill" class="strength-fill"></div>
                                </div>
                            </div>
                            <small class="form-text">At least 8 characters, including uppercase, lowercase, number, and special character</small>
                        </div>

                        <div class="form-group">
                            <label class="form-label form-label-required" for="txtConfirmPassword">Confirm Password</label>
                            <asp:TextBox 
                                ID="txtConfirmPassword" 
                                runat="server" 
                                CssClass="form-control" 
                                TextMode="Password"
                                placeholder="Re-enter your password"
                                MaxLength="255"
                                required="required" />
                            <asp:RequiredFieldValidator 
                                ID="rfvConfirmPassword" 
                                runat="server" 
                                ControlToValidate="txtConfirmPassword"
                                ErrorMessage="Please confirm your password" 
                                CssClass="form-error"
                                Display="Dynamic" />
                            <asp:CompareValidator
                                ID="cvPassword"
                                runat="server"
                                ControlToValidate="txtConfirmPassword"
                                ControlToCompare="txtPassword"
                                ErrorMessage="Passwords do not match"
                                CssClass="form-error"
                                Display="Dynamic" />
                        </div>
                    </div>
                </div>

                <!-- Section 2: Personal Information -->
                <div class="form-section">
                    <h2 class="form-section-title">Personal Information</h2>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label form-label-required" for="txtFullName">Full Name</label>
                            <asp:TextBox 
                                ID="txtFullName" 
                                runat="server" 
                                CssClass="form-control" 
                                placeholder="John Doe"
                                MaxLength="100"
                                required="required" />
                            <asp:RequiredFieldValidator 
                                ID="rfvFullName" 
                                runat="server" 
                                ControlToValidate="txtFullName"
                                ErrorMessage="Full name is required" 
                                CssClass="form-error"
                                Display="Dynamic" />
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="txtPhoneNumber">Phone Number</label>
                            <asp:TextBox 
                                ID="txtPhoneNumber" 
                                runat="server" 
                                CssClass="form-control" 
                                TextMode="Phone"
                                placeholder="+60 12-345 6789"
                                MaxLength="20" />
                            <asp:RegularExpressionValidator
                                ID="revPhone"
                                runat="server"
                                ControlToValidate="txtPhoneNumber"
                                ValidationExpression="^[\+]?[(]?[0-9]{1,3}[)]?[-\s\.]?[(]?[0-9]{1,4}[)]?[-\s\.]?[0-9]{1,4}[-\s\.]?[0-9]{1,9}$"
                                ErrorMessage="Please enter a valid phone number"
                                CssClass="form-error"
                                Display="Dynamic" />
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label" for="txtDateOfBirth">Date of Birth</label>
                            <asp:TextBox 
                                ID="txtDateOfBirth" 
                                runat="server" 
                                CssClass="form-control" 
                                TextMode="Date" />
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="ddlGender">Gender</label>
                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                <asp:ListItem Value="">Select Gender</asp:ListItem>
                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                                <asp:ListItem Value="Other">Other</asp:ListItem>
                                <asp:ListItem Value="Prefer not to say">Prefer not to say</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <!-- Section 3: Fitness Profile -->
                <div class="form-section">
                    <h2 class="form-section-title">Fitness Profile</h2>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label" for="ddlFitnessLevel">Fitness Level</label>
                            <asp:DropDownList ID="ddlFitnessLevel" runat="server" CssClass="form-control">
                                <asp:ListItem Value="">Select Fitness Level</asp:ListItem>
                                <asp:ListItem Value="Beginner">Beginner - Just starting out</asp:ListItem>
                                <asp:ListItem Value="Intermediate">Intermediate - Regular exercise</asp:ListItem>
                                <asp:ListItem Value="Advanced">Advanced - Experienced athlete</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="ddlFitnessGoal">Fitness Goal</label>
                            <asp:DropDownList ID="ddlFitnessGoal" runat="server" CssClass="form-control">
                                <asp:ListItem Value="">Select Your Goal</asp:ListItem>
                                <asp:ListItem Value="Weight Loss">Weight Loss</asp:ListItem>
                                <asp:ListItem Value="Muscle Gain">Muscle Gain</asp:ListItem>
                                <asp:ListItem Value="Endurance">Build Endurance</asp:ListItem>
                                <asp:ListItem Value="Flexibility">Improve Flexibility</asp:ListItem>
                                <asp:ListItem Value="General Fitness">General Fitness</asp:ListItem>
                                <asp:ListItem Value="Athletic Performance">Athletic Performance</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label" for="txtHeight">Height (cm)</label>
                            <asp:TextBox 
                                ID="txtHeight" 
                                runat="server" 
                                CssClass="form-control" 
                                TextMode="Number"
                                placeholder="170"
                                step="0.01"
                                min="50"
                                max="300" />
                            <asp:RangeValidator
                                ID="rvHeight"
                                runat="server"
                                ControlToValidate="txtHeight"
                                MinimumValue="50"
                                MaximumValue="300"
                                Type="Double"
                                ErrorMessage="Height must be between 50 and 300 cm"
                                CssClass="form-error"
                                Display="Dynamic" />
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="txtWeight">Weight (kg)</label>
                            <asp:TextBox 
                                ID="txtWeight" 
                                runat="server" 
                                CssClass="form-control" 
                                TextMode="Number"
                                placeholder="70"
                                step="0.01"
                                min="20"
                                max="500" />
                            <asp:RangeValidator
                                ID="rvWeight"
                                runat="server"
                                ControlToValidate="txtWeight"
                                MinimumValue="20"
                                MaximumValue="500"
                                Type="Double"
                                ErrorMessage="Weight must be between 20 and 500 kg"
                                CssClass="form-error"
                                Display="Dynamic" />
                        </div>
                    </div>
                </div>

                <!-- Terms and Conditions -->
                <div class="terms-box">
                    <div class="form-check">
                        <asp:CheckBox 
                            ID="chkTerms" 
                            runat="server" 
                            CssClass="form-check-input" />
                        <label class="form-check-label" for="chkTerms">
                            I agree to the <a href="#" class="text-blue">Terms of Service</a> and 
                            <a href="#" class="text-blue">Privacy Policy</a>
                        </label>
                    </div>
                    <asp:CustomValidator
                        ID="cvTerms"
                        runat="server"
                        ErrorMessage="You must agree to the terms and conditions"
                        CssClass="form-error d-block mt-2"
                        OnServerValidate="ValidateTerms"
                        Display="Dynamic" />
                </div>

                <!-- Submit Button -->
                <asp:Button 
                    ID="btnRegister" 
                    runat="server" 
                    Text="Create Account" 
                    CssClass="btn btn-primary btn-lg btn-block"
                    OnClick="btnRegister_Click" />

                <!-- Login Link -->
                <div class="login-link">
                    <p class="text-gray">
                        Already have an account? 
                        <a href="Login.aspx">Sign in here</a>
                    </p>
                </div>
            </div>
        </div>

    </form>

    <script type="text/javascript">
        // Password Strength Checker
        function checkPasswordStrength(password) {
            const strengthText = document.getElementById('strengthText');
            const strengthFill = document.getElementById('strengthFill');
            
            let strength = 0;
            let text = 'Password strength: ';
            
            // Check length
            if (password.length >= 8) strength++;
            if (password.length >= 12) strength++;
            
            // Check for lowercase
            if (/[a-z]/.test(password)) strength++;
            
            // Check for uppercase
            if (/[A-Z]/.test(password)) strength++;
            
            // Check for numbers
            if (/[0-9]/.test(password)) strength++;
            
            // Check for special characters
            if (/[^A-Za-z0-9]/.test(password)) strength++;
            
            // Update UI
            strengthFill.className = 'strength-fill';
            
            if (strength === 0) {
                text += 'None';
                strengthFill.style.width = '0%';
            } else if (strength <= 2) {
                text += 'Weak';
                strengthFill.classList.add('strength-weak');
            } else if (strength <= 4) {
                text += 'Medium';
                strengthFill.classList.add('strength-medium');
            } else {
                text += 'Strong';
                strengthFill.classList.add('strength-strong');
            }
            
            strengthText.textContent = text;
        }
    </script>
</body>
</html>
