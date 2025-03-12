<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>MegaCityCab - Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <!-- Navigation Bar 
    <nav class="navbar">
        <div class="logo">MegaCityCab</div>
        <div class="actions">
            <a href="login.jsp" class="button">Login</a>
            <a href="register.jsp" class="button">Register</a>
        </div>
    </nav>
    
    -->

    <!-- Main Content -->
    <div class="main-container">
        <div class="left-content">
            <h1>Your Reliable Travel Partner MEGA CITY CAB...</h1>
            <p>Experience premium cab services in the city with 24/7 availability, 
            professional drivers, and instant bookings. Whether you're commuting 
            to work or exploring the city, we've got you covered!</p>
            
            <div class="cta-buttons">
                <a href="register.jsp" class="book-now-btn">Get Started</a>
                <a href="login.jsp" class="book-now-btn secondary">Existing User</a>
            </div>
        </div>

        <!-- Image Grid -->
        <div class="image-grid">
            <div class="grid-item" style="background-image: url('images/cab1.jpg')"></div>
            <div class="grid-item" style="background-image: url('images/cab2.jpg')"></div>
            <div class="grid-item" style="background-image: url('images/cab3.jpg')"></div>
            <div class="grid-item" style="background-image: url('images/cab4.jpg')"></div>
        </div>
    </div>

    <!-- Features Section -->
    <section class="features">
        <div class="feature-item">
            <img src="images/cabSrvice1.jpeg" alt="24/7 Service">
            <h3>24/7 Availability</h3>
            <p>MegacityCab operates round-the-clock, ensuring you can book a ride anytime, day or night, for your convenience and emergency travel needs.  </p>
        </div>
        <div class="feature-item">
            <img src="images/register-bg.jpg" alt="Safety">
            <h3>Safe Travel</h3>
            <p>Your safety is a priority with MegacityCab, offering GPS tracking, verified drivers, and emergency support to ensure a secure and comfortable journey.  </p>
        </div>
        <div class="feature-item">
            <img src="images/cabService2.jpeg" alt="Cashless">
            <h3>Cashless Payments</h3>
            <p> Enjoy hassle-free transactions with cashless payment options, allowing you to pay securely via digital wallets, credit cards, or other online methods.</p>
        </div>
    </section>
</body>
</html>