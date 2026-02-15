<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FitLifeHub - Transform Your Fitness Journey</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="styles/brand-colors.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700;800&family=Space+Mono:wght@400;700&display=swap" rel="stylesheet" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            /* Brand Colors */
            --primary: #F49E4C;
            --primary-dark: #AB3428;
            --secondary: #3B8EA5;
            --dark: #2D728F;
            --dark-light: #3B8EA5;
            --text: #1a2332;
            --text-dim: #6c757d;
            --accent: #F5EE9E;
            --success: #3B8EA5;
        }

        body {
            font-family: 'Outfit', sans-serif;
            background: linear-gradient(135deg, #e8f4f8 0%, #fff 50%, #fef5ec 100%);
            color: var(--text);
            overflow-x: hidden;
            line-height: 1.6;
        }

        /* Navigation */
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            background: rgba(255, 255, 255, 0.98);
            backdrop-filter: blur(20px);
            z-index: 1000;
            border-bottom: 2px solid var(--secondary);
            box-shadow: 0 2px 12px rgba(45, 114, 143, 0.1);
        }

        .nav-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 1.2rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 1.6rem;
            font-weight: 800;
            color: var(--text);
            text-decoration: none;
        }

        .logo-icon {
            width: 45px;
            height: 45px;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 900;
            font-size: 22px;
            color: white;
            box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3);
        }

        .nav-links {
            display: flex;
            gap: 2.5rem;
            list-style: none;
            align-items: center;
        }

        .nav-links a {
            color: var(--text-dim);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
            position: relative;
        }

        .nav-links a:hover {
            color: var(--primary);
        }

        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--primary);
            transition: width 0.3s ease;
        }

        .nav-links a:hover::after {
            width: 100%;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: white;
            padding: 0.8rem 1.8rem;
            border-radius: 50px;
            border: none;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(255, 107, 53, 0.4);
            text-decoration: none;
            display: inline-block;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 25px rgba(255, 107, 53, 0.6);
        }

        .btn-secondary {
            background: transparent;
            color: var(--text);
            padding: 0.8rem 1.8rem;
            border-radius: 50px;
            border: 2px solid var(--text-dim);
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .btn-secondary:hover {
            border-color: var(--primary);
            color: var(--primary);
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
                radial-gradient(circle at 20% 50%, rgba(255, 107, 53, 0.15) 0%, transparent 50%),
                radial-gradient(circle at 80% 80%, rgba(0, 217, 255, 0.15) 0%, transparent 50%),
                radial-gradient(circle at 40% 20%, rgba(255, 210, 63, 0.1) 0%, transparent 50%);
            animation: heroGlow 20s ease-in-out infinite;
        }

        @keyframes heroGlow {
            0%, 100% { opacity: 0.5; transform: scale(1); }
            50% { opacity: 0.8; transform: scale(1.05); }
        }

        .hero-grid {
            position: absolute;
            width: 100%;
            height: 100%;
            background-image: 
                linear-gradient(rgba(255, 255, 255, 0.02) 1px, transparent 1px),
                linear-gradient(90deg, rgba(255, 255, 255, 0.02) 1px, transparent 1px);
            background-size: 50px 50px;
            opacity: 0.3;
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
            background: linear-gradient(135deg, var(--text) 0%, var(--text-dim) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .hero-content h1 .highlight {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            display: block;
        }

        .hero-content p {
            font-size: 1.25rem;
            color: var(--text-dim);
            margin-bottom: 2.5rem;
            max-width: 90%;
            line-height: 1.8;
        }

        .hero-buttons {
            display: flex;
            gap: 1rem;
            align-items: center;
        }

        .hero-stats {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 2rem;
            margin-top: 4rem;
            padding-top: 3rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        .stat-item {
            text-align: center;
        }

        .stat-number {
            font-size: 2.5rem;
            font-weight: 800;
            color: var(--primary);
            display: block;
            font-family: 'Space Mono', monospace;
        }

        .stat-label {
            font-size: 0.9rem;
            color: var(--text-dim);
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .hero-visual {
            position: relative;
            height: 600px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .hero-image-wrapper {
            position: relative;
            width: 100%;
            height: 100%;
            border-radius: 30px;
            overflow: hidden;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.5);
        }

        .hero-image-wrapper img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .hero-image-wrapper::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(255, 107, 53, 0.3), rgba(0, 217, 255, 0.3));
            mix-blend-mode: multiply;
            z-index: 1;
        }

        .floating-card {
            position: absolute;
            background: rgba(26, 31, 58, 0.9);
            backdrop-filter: blur(20px);
            padding: 1.5rem;
            border-radius: 20px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.5);
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }

        .floating-card.card-1 {
            top: 10%;
            right: -10%;
            animation-delay: 0s;
        }

        .floating-card.card-2 {
            bottom: 15%;
            left: -10%;
            animation-delay: 1s;
        }

        .card-icon {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin-bottom: 0.8rem;
        }

        .card-title {
            font-weight: 700;
            font-size: 1.1rem;
            margin-bottom: 0.3rem;
        }

        .card-value {
            font-size: 1.8rem;
            font-weight: 800;
            color: var(--secondary);
            font-family: 'Space Mono', monospace;
        }

        /* Categories Section */
        .categories-section {
            padding: 8rem 2rem;
            background: white;
            position: relative;
        }

        .section-header {
            max-width: 1400px;
            margin: 0 auto 4rem;
            text-align: center;
        }

        .section-label {
            font-size: 0.9rem;
            color: var(--primary);
            font-weight: 700;
            text-transform: uppercase;
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
            color: var(--text-dim);
            max-width: 700px;
            margin: 0 auto;
        }

        .categories-grid {
            max-width: 1400px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2rem;
        }

        .category-card {
            background: #f8f9fa;
            border-radius: 25px;
            padding: 2.5rem;
            border: 2px solid rgba(59, 142, 165, 0.1);
            transition: all 0.4s ease;
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
            background: linear-gradient(135deg, var(--secondary), var(--primary));
            opacity: 0;
            transition: opacity 0.4s ease;
        }

        .category-card:hover {
            transform: translateY(-10px);
            border-color: var(--primary);
            box-shadow: 0 20px 50px rgba(244, 158, 76, 0.2);
        }

        .category-card:hover::before {
            opacity: 0.1;
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

        .category-description {
            color: var(--text-dim);
            line-height: 1.6;
            margin-bottom: 1rem;
            position: relative;
            z-index: 1;
        }

        .category-count {
            font-size: 0.9rem;
            color: var(--primary);
            font-weight: 600;
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
            grid-template-columns: repeat(3, 1fr);
            gap: 3rem;
        }

        .feature-card {
            text-align: center;
            padding: 2rem;
        }

        .feature-icon-wrapper {
            width: 80px;
            height: 80px;
            margin: 0 auto 1.5rem;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
            box-shadow: 0 10px 30px rgba(255, 107, 53, 0.3);
        }

        .feature-title {
            font-size: 1.4rem;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .feature-description {
            color: var(--text-dim);
            line-height: 1.7;
        }

        /* CTA Section */
        .cta-section {
            padding: 8rem 2rem;
            background: linear-gradient(135deg, var(--secondary), var(--primary));
            position: relative;
            overflow: hidden;
        }

        .cta-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml,<svg width="100" height="100" xmlns="http://www.w3.org/2000/svg"><defs><pattern id="grid" width="50" height="50" patternUnits="userSpaceOnUse"><path d="M 50 0 L 0 0 0 50" fill="none" stroke="rgba(255,255,255,0.1)" stroke-width="1"/></pattern></defs><rect width="100" height="100" fill="url(%23grid)"/></svg>');
            opacity: 0.3;
        }

        .cta-container {
            max-width: 900px;
            margin: 0 auto;
            text-align: center;
            position: relative;
            z-index: 1;
        }

        .cta-title {
            font-size: 3.5rem;
            font-weight: 800;
            color: white;
            margin-bottom: 1.5rem;
            line-height: 1.2;
        }

        .cta-description {
            font-size: 1.3rem;
            color: rgba(255, 255, 255, 0.9);
            margin-bottom: 2.5rem;
            line-height: 1.7;
        }

        .cta-buttons {
            display: flex;
            gap: 1.5rem;
            justify-content: center;
        }

        .btn-white {
            background: white;
            color: var(--primary);
            padding: 1rem 2.5rem;
            border-radius: 50px;
            border: none;
            font-weight: 700;
            font-size: 1.1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            text-decoration: none;
            display: inline-block;
        }

        .btn-white:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.3);
        }

        .btn-outline-white {
            background: transparent;
            color: white;
            padding: 1rem 2.5rem;
            border-radius: 50px;
            border: 3px solid white;
            font-weight: 700;
            font-size: 1.1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .btn-outline-white:hover {
            background: white;
            color: var(--primary);
            transform: translateY(-3px);
        }

        /* Footer */
        .footer {
            background: var(--dark);
            padding: 4rem 2rem 2rem;
            border-top: 2px solid var(--secondary);
            color: white;
        }

        .footer-container {
            max-width: 1400px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr;
            gap: 3rem;
            margin-bottom: 3rem;
        }

        .footer-brand {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .footer-logo {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 1.5rem;
            font-weight: 800;
            color: var(--text);
            text-decoration: none;
        }

        .footer-description {
            color: var(--text-dim);
            line-height: 1.7;
            max-width: 350px;
        }

        .footer-section h4 {
            font-size: 1.1rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            color: var(--text);
        }

        .footer-links {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 0.8rem;
        }

        .footer-links a {
            color: var(--text-dim);
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-links a:hover {
            color: var(--primary);
        }

        .footer-bottom {
            max-width: 1400px;
            margin: 0 auto;
            padding-top: 2rem;
            border-top: 1px solid rgba(255, 255, 255, 0.05);
            text-align: center;
            color: var(--text-dim);
            font-size: 0.9rem;
        }

        /* Responsive */
        @media (max-width: 1024px) {
            .hero-container {
                grid-template-columns: 1fr;
                text-align: center;
            }

            .hero-visual {
                display: none;
            }

            .hero-content p {
                max-width: 100%;
            }

            .hero-buttons {
                justify-content: center;
            }

            .features-grid {
                grid-template-columns: 1fr;
            }

            .footer-container {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media (max-width: 768px) {
            .nav-links {
                display: none;
            }

            .hero-content h1 {
                font-size: 3rem;
            }

            .section-title {
                font-size: 2.5rem;
            }

            .cta-title {
                font-size: 2.5rem;
            }

            .cta-buttons {
                flex-direction: column;
            }

            .footer-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <!-- Navigation -->
        <nav class="navbar">
            <div class="nav-container">
                <a href="Default.aspx" class="logo">
                    <div class="logo-icon">FL</div>
                    <span>FitLifeHub</span>
                </a>
                <ul class="nav-links">
                    <li><a href="Default.aspx">Home</a></li>
                    <li><a href="WorkoutCatalog.aspx">Workouts</a></li>
                    <li><a href="FitnessArticles.aspx">Articles</a></li>
                    <li><a href="AboutUs.aspx">About</a></li>
                    <li><a href="ContactUs.aspx">Contact</a></li>
                </ul>
                <div style="display: flex; gap: 1rem;">
                    <a href="Login.aspx" class="btn-secondary">Login</a>
                    <a href="Register.aspx" class="btn-primary">Get Started</a>
                </div>
            </div>
        </nav>

        <!-- Hero Section -->
        <section class="hero">
            <div class="hero-bg"></div>
            <div class="hero-grid"></div>
            <div class="hero-container">
                <div class="hero-content">
                    <h1>
                        Transform Your Body.
                        <span class="highlight">Elevate Your Life.</span>
                    </h1>
                    <p>
                        Join thousands of students and young adults on their fitness journey. 
                        Access expert workout plans, track your progress, and achieve your goals with FitLifeHub.
                    </p>
                    <div class="hero-buttons">
                        <a href="Register.aspx" class="btn-primary" style="padding: 1rem 2.5rem; font-size: 1.1rem;">Start Free Today</a>
                        <a href="WorkoutCatalog.aspx" class="btn-secondary">Browse Workouts</a>
                    </div>
                    <div class="hero-stats">
                        <div class="stat-item">
                            <span class="stat-number">500+</span>
                            <span class="stat-label">Workout Plans</span>
                        </div>
                        <div class="stat-item">
                            <span class="stat-number">10K+</span>
                            <span class="stat-label">Active Users</span>
                        </div>
                        <div class="stat-item">
                            <span class="stat-number">50+</span>
                            <span class="stat-label">Expert Trainers</span>
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
                        <div class="card-value">28 Days</div>
                    </div>
                    <div class="floating-card card-2">
                        <div class="card-icon">🔥</div>
                        <div class="card-title">Calories Burned</div>
                        <div class="card-value">2,450</div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Categories Section -->
        <section class="categories-section">
            <div class="section-header">
                <div class="section-label">WORKOUT CATEGORIES</div>
                <h2 class="section-title">Find Your Perfect Workout</h2>
                <p class="section-description">
                    From strength training to yoga, we've got everything you need to reach your fitness goals.
                </p>
            </div>
            <div class="categories-grid">
                <div class="category-card" onclick="location.href='WorkoutCatalog.aspx?category=strength'">
                    <div class="category-icon">💪</div>
                    <h3 class="category-name">Strength Training</h3>
                    <p class="category-description">Build muscle and increase power with progressive resistance workouts.</p>
                    <span class="category-count">120+ Workouts</span>
                </div>
                <div class="category-card" onclick="location.href='WorkoutCatalog.aspx?category=cardio'">
                    <div class="category-icon">🏃</div>
                    <h3 class="category-name">Cardio</h3>
                    <p class="category-description">Boost endurance and burn calories with high-energy cardio sessions.</p>
                    <span class="category-count">95+ Workouts</span>
                </div>
                <div class="category-card" onclick="location.href='WorkoutCatalog.aspx?category=flexibility'">
                    <div class="category-icon">🧘</div>
                    <h3 class="category-name">Flexibility & Yoga</h3>
                    <p class="category-description">Improve mobility and find balance with guided stretching and yoga.</p>
                    <span class="category-count">80+ Workouts</span>
                </div>
                <div class="category-card" onclick="location.href='WorkoutCatalog.aspx?category=hiit'">
                    <div class="category-icon">⚡</div>
                    <h3 class="category-name">HIIT</h3>
                    <p class="category-description">Maximize results with intense interval training for fat burning.</p>
                    <span class="category-count">75+ Workouts</span>
                </div>
                <div class="category-card" onclick="location.href='WorkoutCatalog.aspx?category=core'">
                    <div class="category-icon">🎯</div>
                    <h3 class="category-name">Core Training</h3>
                    <p class="category-description">Strengthen your core for better stability and athletic performance.</p>
                    <span class="category-count">65+ Workouts</span>
                </div>
                <div class="category-card" onclick="location.href='WorkoutCatalog.aspx?category=recovery'">
                    <div class="category-icon">🌟</div>
                    <h3 class="category-name">Recovery</h3>
                    <p class="category-description">Restore and rejuvenate with foam rolling and active recovery.</p>
                    <span class="category-count">45+ Workouts</span>
                </div>
            </div>
        </section>

        <!-- Features Section -->
        <section class="features-section">
            <div class="section-header">
                <div class="section-label">WHY FITLIFEHUB</div>
                <h2 class="section-title">Everything You Need to Succeed</h2>
                <p class="section-description">
                    Powerful features designed to keep you motivated and on track.
                </p>
            </div>
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon-wrapper">📊</div>
                    <h3 class="feature-title">Progress Tracking</h3>
                    <p class="feature-description">
                        Monitor your workouts, track improvements, and visualize your fitness journey with detailed analytics.
                    </p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon-wrapper">🎓</div>
                    <h3 class="feature-title">Expert Guidance</h3>
                    <p class="feature-description">
                        Learn from certified trainers with video tutorials, form tips, and personalized recommendations.
                    </p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon-wrapper">📱</div>
                    <h3 class="feature-title">Anytime, Anywhere</h3>
                    <p class="feature-description">
                        Access your workouts on any device. Train at home, gym, or on the go with our responsive platform.
                    </p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon-wrapper">🎯</div>
                    <h3 class="feature-title">Personalized Plans</h3>
                    <p class="feature-description">
                        Save and customize workout routines that match your fitness level and goals.
                    </p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon-wrapper">📚</div>
                    <h3 class="feature-title">Educational Content</h3>
                    <p class="feature-description">
                        Stay informed with articles on nutrition, recovery, and fitness science from industry experts.
                    </p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon-wrapper">👥</div>
                    <h3 class="feature-title">Community Support</h3>
                    <p class="feature-description">
                        Connect with trainers, ask questions, and get motivated by a community of fitness enthusiasts.
                    </p>
                </div>
            </div>
        </section>

        <!-- CTA Section -->
        <section class="cta-section">
            <div class="cta-container">
                <h2 class="cta-title">Ready to Transform Your Fitness?</h2>
                <p class="cta-description">
                    Join FitLifeHub today and get instant access to 500+ workouts, expert trainers, and powerful tracking tools. 
                    Your fitness journey starts now.
                </p>
                <div class="cta-buttons">
                    <a href="Register.aspx" class="btn-white">Create Free Account</a>
                    <a href="WorkoutCatalog.aspx" class="btn-outline-white">Explore Workouts</a>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="footer">
            <div class="footer-container">
                <div class="footer-brand">
                    <a href="Default.aspx" class="footer-logo">
                        <div class="logo-icon">FL</div>
                        <span>FitLifeHub</span>
                    </a>
                    <p class="footer-description">
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

    <script>
        // Smooth scroll for anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });

        // Add scroll effect to navbar
        let lastScroll = 0;
        window.addEventListener('scroll', () => {
            const navbar = document.querySelector('.navbar');
            const currentScroll = window.pageYOffset;

            if (currentScroll > 100) {
                navbar.style.background = 'rgba(10, 14, 39, 0.98)';
                navbar.style.boxShadow = '0 5px 20px rgba(0, 0, 0, 0.3)';
            } else {
                navbar.style.background = 'rgba(10, 14, 39, 0.95)';
                navbar.style.boxShadow = 'none';
            }

            lastScroll = currentScroll;
        });
    </script>
</body>
</html>
