<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FitLifeHub.Default" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FitLifeHub - Transform Your Fitness Journey</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700;800&family=Space+Mono:wght@400;700&display=swap" rel="stylesheet" />
    <!-- Brand Colors CSS - Contains all color definitions and reusable styles -->
    <link href="styles/brand-colors.css" rel="stylesheet" type="text/css" />
    <style>
        /* Only page-specific styles here - colors come from brand-colors.css */
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(135deg, #e8f4f8 0%, #fff 50%, #fef5ec 100%);
        }

        /* Navigation Bar - Fixed at top */
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            background: white;
            border-bottom: 2px solid var(--primary-blue);
            box-shadow: 0 2px 12px rgba(45, 114, 143, 0.1);
            z-index: 1000;
        }

        .navbar-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar-brand {
            display: flex;
            align-items: center;
            gap: 0.8rem;
            text-decoration: none;
            font-weight: 800;
            font-size: 1.5rem;
            color: var(--primary-dark-blue);
        }

        .logo-icon {
            width: 45px;
            height: 45px;
            background: linear-gradient(135deg, var(--primary-blue), var(--primary-orange));
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 800;
            font-size: 1.1rem;
        }

        .navbar-menu {
            display: flex;
            align-items: center;
            gap: 2.5rem;
            list-style: none;
        }

        .navbar-menu a {
            text-decoration: none;
            color: var(--text-gray);
            font-weight: 600;
            transition: color 0.3s ease;
            position: relative;
        }

        .navbar-menu a:hover {
            color: var(--primary-blue);
        }

        .navbar-menu a::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--primary-orange);
            transition: width 0.3s ease;
        }

        .navbar-menu a:hover::after {
            width: 100%;
        }

        .navbar-actions {
            display: flex;
            gap: 1rem;
        }

        .btn-nav-secondary {
            padding: 0.6rem 1.5rem;
            background: transparent;
            color: var(--primary-blue);
            border: 2px solid var(--primary-blue);
            border-radius: 8px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .btn-nav-secondary:hover {
            background: var(--primary-blue);
            color: white;
        }

        .btn-nav-primary {
            padding: 0.6rem 1.5rem;
            background: var(--primary-orange);
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .btn-nav-primary:hover {
            background: var(--primary-orange-hover);
            transform: translateY(-2px);
        }

        /* Hero Section */
        .hero {
            min-height: 100vh;
            display: flex;
            align-items: center;
            position: relative;
            padding-top: 80px;
            overflow: hidden;
        }

        .hero-bg {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: 
                radial-gradient(circle at 20% 50%, rgba(59, 142, 165, 0.15) 0%, transparent 50%),
                radial-gradient(circle at 80% 80%, rgba(244, 158, 76, 0.15) 0%, transparent 50%);
            animation: heroGlow 20s ease-in-out infinite;
        }

        @keyframes heroGlow {
            0%, 100% { opacity: 0.5; transform: scale(1); }
            50% { opacity: 0.8; transform: scale(1.05); }
        }

        .hero-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 2rem;
            position: relative;
            z-index: 2;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 4rem;
            align-items: center;
        }

        .hero-content h1 {
            font-size: 5rem;
            font-weight: 800;
            line-height: 1.1;
            margin-bottom: 1.5rem;
        }

        .hero-content h1 .highlight {
            background: linear-gradient(135deg, var(--primary-orange) 0%, var(--accent-red) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            display: block;
        }

        .hero-content p {
            font-size: 1.25rem;
            margin-bottom: 2.5rem;
            line-height: 1.8;
        }

        .hero-buttons {
            display: flex;
            gap: 1rem;
        }

        .hero-stats {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 2rem;
            margin-top: 4rem;
            padding-top: 3rem;
            border-top: 1px solid var(--border-light);
        }

        .stat-number {
            font-size: 2.5rem;
            font-weight: 800;
            display: block;
            font-family: 'Space Mono', monospace;
        }

        .stat-label {
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Hero Visual */
        .hero-visual {
            position: relative;
            height: 600px;
        }

        .hero-image-wrapper {
            width: 100%;
            height: 100%;
            border-radius: 30px;
            overflow: hidden;
            box-shadow: 0 25px 60px rgba(45, 114, 143, 0.3);
        }

        .hero-image-wrapper img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Floating Cards */
        .floating-card {
            position: absolute;
            background: rgba(255, 255, 255, 0.95);
            padding: 1.5rem;
            border-radius: 20px;
            box-shadow: 0 8px 24px rgba(244, 158, 76, 0.25);
            animation: float 3s ease-in-out infinite;
        }

        .floating-card .card-icon {
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }

        .floating-card .card-title {
            font-weight: 600;
            color: var(--text-gray);
            font-size: 0.9rem;
            margin-bottom: 0.3rem;
        }

        .floating-card .card-value {
            font-size: 1.8rem;
            font-weight: 800;
            font-family: 'Space Mono', monospace;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }

        .floating-card.card-1 { top: 10%; right: -10%; }
        .floating-card.card-2 { bottom: 15%; left: -10%; animation-delay: 1s; }

        /* Categories Section */
        .categories-section {
            padding: 8rem 2rem;
            background: white;
        }

        .section-header {
            max-width: 1400px;
            margin: 0 auto 4rem;
            text-align: center;
        }

        .section-label {
            font-weight: 700;
            font-size: 0.9rem;
            letter-spacing: 2px;
            margin-bottom: 1rem;
        }

        .section-title {
            font-size: 3.5rem;
            font-weight: 800;
            margin-bottom: 1.5rem;
        }

        .section-description {
            font-size: 1.2rem;
            max-width: 700px;
            margin: 0 auto;
            line-height: 1.8;
        }

        .categories-grid {
            max-width: 1400px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2rem;
        }

        /* Enhanced Category Cards with Hover Effect */
        .category-card {
            background: white;
            border-radius: 12px;
            padding: 2rem;
            border: 1px solid var(--border-light);
            box-shadow: 0 2px 8px rgba(45, 114, 143, 0.08);
            transition: all 0.3s ease;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }

        .category-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(59, 142, 165, 0.05) 0%, rgba(244, 158, 76, 0.05) 100%);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .category-card:hover {
            box-shadow: 0 12px 28px rgba(45, 114, 143, 0.2);
            transform: translateY(-8px);
            border-color: var(--primary-blue);
        }

        .category-card:hover::before {
            opacity: 1;
        }

        .category-icon {
            font-size: 3rem;
            margin-bottom: 1.5rem;
            position: relative;
            z-index: 1;
        }

        .category-name {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 0.8rem;
            position: relative;
            z-index: 1;
        }

        .category-card p {
            position: relative;
            z-index: 1;
            margin-bottom: 1rem;
        }

        .category-card .badge {
            position: relative;
            z-index: 1;
        }

        /* Features Section */
        .features-section {
            padding: 8rem 2rem;
            background: linear-gradient(135deg, #e8f4f8 0%, #fff 100%);
        }

        .features-grid {
            max-width: 1400px;
            margin: 4rem auto 0;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2.5rem;
        }

        .feature-card {
            background: white;
            padding: 2.5rem;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(45, 114, 143, 0.1);
            transition: all 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 30px rgba(45, 114, 143, 0.15);
        }

        .feature-icon-wrapper {
            width: 80px;
            height: 80px;
            margin: 0 auto 1.5rem;
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
        }

        .feature-title {
            font-size: 1.4rem;
            font-weight: 700;
            margin-bottom: 1rem;
            color: var(--primary-dark-blue);
        }

        .feature-card p {
            line-height: 1.7;
        }

        /* CTA Section */
        .cta-section {
            padding: 8rem 2rem;
            text-align: center;
            color: white;
        }

        .cta-container {
            max-width: 900px;
            margin: 0 auto;
        }

        .cta-title {
            font-size: 3.5rem;
            font-weight: 800;
            margin-bottom: 1.5rem;
            color: white;
        }

        .cta-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
        }

        .btn-white {
            background: white;
            color: var(--primary-blue);
            padding: 1rem 2.5rem;
            border-radius: 10px;
            font-weight: 700;
            font-size: 1.1rem;
            text-decoration: none;
            transition: all 0.3s ease;
            display: inline-block;
        }

        .btn-white:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(255, 255, 255, 0.3);
        }

        .btn-outline-white {
            background: transparent;
            color: white;
            border: 2px solid white;
            padding: 1rem 2.5rem;
            border-radius: 10px;
            font-weight: 700;
            font-size: 1.1rem;
            text-decoration: none;
            transition: all 0.3s ease;
            display: inline-block;
        }

        .btn-outline-white:hover {
            background: white;
            color: var(--primary-blue);
            transform: translateY(-3px);
        }

        /* Footer - NOW WITH PROPER BACKGROUND COLOR */
        .footer {
            background: var(--primary-dark-blue);
            color: white;
            padding: 4rem 2rem 2rem;
        }

        .footer-container {
            max-width: 1400px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr;
            gap: 3rem;
            margin-bottom: 3rem;
        }

        .footer-brand .footer-logo {
            display: flex;
            align-items: center;
            gap: 0.8rem;
            text-decoration: none;
            font-weight: 800;
            font-size: 1.5rem;
            color: white;
            margin-bottom: 1.5rem;
        }

        .footer-brand .logo-icon {
            width: 45px;
            height: 45px;
            background: linear-gradient(135deg, var(--primary-blue), var(--primary-orange));
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 800;
            font-size: 1.1rem;
        }

        .footer-section h4 {
            color: white;
            font-size: 1.1rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
        }

        .footer-links {
            list-style: none;
        }

        .footer-links li {
            margin-bottom: 0.8rem;
        }

        .footer-links a {
            color: rgba(255, 255, 255, 0.7);
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-links a:hover {
            color: var(--accent-yellow);
        }

        .footer-bottom {
            max-width: 1400px;
            margin: 0 auto;
            padding-top: 2rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            text-align: center;
            color: rgba(255, 255, 255, 0.6);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .navbar-menu {
                display: none;
            }

            .hero-container {
                grid-template-columns: 1fr;
            }

            .hero-content h1 {
                font-size: 3rem;
            }

            .section-title {
                font-size: 2.5rem;
            }

            .footer-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <!-- Navigation Bar - NOW INCLUDED -->
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
                    <a href="Login.aspx" class="btn-nav-secondary">Login</a>
                    <a href="Register.aspx" class="btn-nav-primary">Sign Up</a>
                </div>
            </div>
        </nav>

        <!-- Hero Section -->
        <section class="hero">
            <div class="hero-bg"></div>
            <div class="hero-container">
                <div class="hero-content">
                    <h1>
                        Transform Your Body,
                        <span class="highlight">Elevate Your Life</span>
                    </h1>
                    <p class="text-gray">
                        Join thousands of fitness enthusiasts who trust FitLifeHub for personalized workouts, 
                        expert guidance, and powerful progress tracking. Start your transformation today.
                    </p>
                    <div class="hero-buttons">
                        <a href="Register.aspx" class="btn-primary">Start Free Trial</a>
                        <a href="WorkoutCatalog.aspx" class="btn-secondary">Browse Workouts</a>
                    </div>
                    <div class="hero-stats">
                        <div class="stat-item">
                            <span class="stat-number text-primary">500+</span>
                            <span class="stat-label text-gray">Workout Plans</span>
                        </div>
                        <div class="stat-item">
                            <span class="stat-number text-primary">10K+</span>
                            <span class="stat-label text-gray">Active Users</span>
                        </div>
                        <div class="stat-item">
                            <span class="stat-number text-primary">50+</span>
                            <span class="stat-label text-gray">Expert Trainers</span>
                        </div>
                    </div>
                </div>
                <div class="hero-visual">
                    <div class="hero-image-wrapper">
                        <img src="https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=800&h=1000&fit=crop" alt="Fitness Training" />
                    </div>
                    <div class="floating-card card-1">
                        <div class="card-icon">💪</div>
                        <div class="card-title">Active Streak</div>
                        <div class="card-value text-blue">28 Days</div>
                    </div>
                    <div class="floating-card card-2">
                        <div class="card-icon">🔥</div>
                        <div class="card-title">Calories Burned</div>
                        <div class="card-value text-blue">2,450</div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Categories Section - WITH IMPROVED HOVER EFFECTS -->
        <section class="categories-section">
            <div class="section-header">
                <div class="section-label text-primary">WORKOUT CATEGORIES</div>
                <h2 class="section-title">Find Your Perfect Workout</h2>
                <p class="section-description text-gray">
                    From strength training to yoga, we've got everything you need to reach your fitness goals.
                </p>
            </div>
            <div class="categories-grid">
                <div class="category-card" onclick="location.href='WorkoutCatalog.aspx?category=strength'">
                    <div class="category-icon">💪</div>
                    <h3 class="category-name">Strength Training</h3>
                    <p class="text-gray">Build muscle and increase power with progressive resistance workouts.</p>
                    <span class="badge badge-orange">120+ Workouts</span>
                </div>
                <div class="category-card" onclick="location.href='WorkoutCatalog.aspx?category=cardio'">
                    <div class="category-icon">🏃</div>
                    <h3 class="category-name">Cardio</h3>
                    <p class="text-gray">Boost endurance and burn calories with high-energy cardio sessions.</p>
                    <span class="badge badge-orange">95+ Workouts</span>
                </div>
                <div class="category-card" onclick="location.href='WorkoutCatalog.aspx?category=flexibility'">
                    <div class="category-icon">🧘</div>
                    <h3 class="category-name">Flexibility & Yoga</h3>
                    <p class="text-gray">Improve mobility and find balance with guided stretching and yoga.</p>
                    <span class="badge badge-orange">80+ Workouts</span>
                </div>
                <div class="category-card" onclick="location.href='WorkoutCatalog.aspx?category=hiit'">
                    <div class="category-icon">⚡</div>
                    <h3 class="category-name">HIIT</h3>
                    <p class="text-gray">Maximize results with intense interval training for fat burning.</p>
                    <span class="badge badge-orange">75+ Workouts</span>
                </div>
                <div class="category-card" onclick="location.href='WorkoutCatalog.aspx?category=core'">
                    <div class="category-icon">🎯</div>
                    <h3 class="category-name">Core Training</h3>
                    <p class="text-gray">Strengthen your core for better stability and athletic performance.</p>
                    <span class="badge badge-orange">65+ Workouts</span>
                </div>
                <div class="category-card" onclick="location.href='WorkoutCatalog.aspx?category=recovery'">
                    <div class="category-icon">🌟</div>
                    <h3 class="category-name">Recovery</h3>
                    <p class="text-gray">Restore and rejuvenate with foam rolling and active recovery.</p>
                    <span class="badge badge-orange">45+ Workouts</span>
                </div>
            </div>
        </section>

        <!-- Features Section -->
        <section class="features-section">
            <div class="section-header">
                <div class="section-label text-primary">WHY FITLIFEHUB</div>
                <h2 class="section-title">Everything You Need to Succeed</h2>
                <p class="section-description text-gray">
                    Powerful features designed to keep you motivated and on track.
                </p>
            </div>
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon-wrapper bg-gradient-orange shadow-orange">📊</div>
                    <h3 class="feature-title">Progress Tracking</h3>
                    <p class="text-gray">Monitor your workouts, track improvements, and visualize your fitness journey with detailed analytics.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon-wrapper bg-gradient-orange shadow-orange">🎓</div>
                    <h3 class="feature-title">Expert Guidance</h3>
                    <p class="text-gray">Learn from certified trainers with video tutorials, form tips, and personalized recommendations.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon-wrapper bg-gradient-orange shadow-orange">📱</div>
                    <h3 class="feature-title">Anytime, Anywhere</h3>
                    <p class="text-gray">Access your workouts on any device. Train at home, gym, or on the go with our responsive platform.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon-wrapper bg-gradient-orange shadow-orange">🎯</div>
                    <h3 class="feature-title">Personalized Plans</h3>
                    <p class="text-gray">Save and customize workout routines that match your fitness level and goals.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon-wrapper bg-gradient-orange shadow-orange">📚</div>
                    <h3 class="feature-title">Educational Content</h3>
                    <p class="text-gray">Stay informed with articles on nutrition, recovery, and fitness science from industry experts.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon-wrapper bg-gradient-orange shadow-orange">👥</div>
                    <h3 class="feature-title">Community Support</h3>
                    <p class="text-gray">Connect with trainers, ask questions, and get motivated by a community of fitness enthusiasts.</p>
                </div>
            </div>
        </section>

        <!-- CTA Section -->
        <section class="cta-section bg-gradient-blue">
            <div class="cta-container">
                <h2 class="cta-title">Ready to Transform Your Fitness?</h2>
                <p style="font-size: 1.3rem; color: rgba(255, 255, 255, 0.9); margin-bottom: 2.5rem;">
                    Join FitLifeHub today and get instant access to 500+ workouts, expert trainers, and powerful tracking tools. 
                    Your fitness journey starts now.
                </p>
                <div class="cta-buttons">
                    <a href="Register.aspx" class="btn-white">Create Free Account</a>
                    <a href="WorkoutCatalog.aspx" class="btn-outline-white">Explore Workouts</a>
                </div>
            </div>
        </section>

        <!-- Footer - NOW WITH DARK BLUE BACKGROUND -->
        <footer class="footer">
            <div class="footer-container">
                <div class="footer-brand">
                    <a href="Default.aspx" class="footer-logo">
                        <div class="logo-icon">FL</div>
                        <span>FitLifeHub</span>
                    </a>
                    <p style="color: rgba(255, 255, 255, 0.7); line-height: 1.7;">
                        Your complete digital fitness platform. Transform your body, elevate your life, and achieve your goals with expert guidance.
                    </p>
                </div>
                <div class="footer-section">
                    <h4>Quick Links</h4>
                    <ul class="footer-links">
                        <li><a href="Default.aspx">Home</a></li>
                        <li><a href="WorkoutCatalog.aspx">Workouts</a></li>
                        <li><a href="FitnessArticles.aspx">Articles</a></li>
                        <li><a href="AboutUs.aspx">About Us</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h4>Account</h4>
                    <ul class="footer-links">
                        <li><a href="Register.aspx">Sign Up</a></li>
                        <li><a href="Login.aspx">Login</a></li>
                        <li><a href="UserDashboard.aspx">Dashboard</a></li>
                        <li><a href="MyProfile.aspx">My Profile</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h4>Support</h4>
                    <ul class="footer-links">
                        <li><a href="ContactUs.aspx">Contact Us</a></li>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Terms of Service</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2026 FitLifeHub. All rights reserved. Built by Group 25 - APU2F2506CS(CYB)</p>
            </div>
        </footer>

    </form>
</body>
</html>
