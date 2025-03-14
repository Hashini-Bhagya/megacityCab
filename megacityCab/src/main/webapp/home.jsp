<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>MegaCityCab - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        .hero-section {
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('images/home3.jpeg');
            background-size: cover;
            color: white;
            padding: 120px 0;
        }
        
        
        .feature-icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            transition: transform 0.3s;
        }
        
       /*  .feature-card:hover .feature-icon {
            transform: translateY(-10px);
            
        }
              
        .cta-button {
            transition: all 0.3s;
            padding: 15px 30px;
            font-size: 1.1rem;
           
        } */
        
          /* ... existing styles ... */

    .feature-card {
        transition: all 0.3s ease;
        cursor: pointer;
    }

    .feature-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        background: linear-gradient(45deg, #f8f9fa, #ffffff);
    }

    .cta-button {
        transition: all 0.3s;
        padding: 15px 30px;
        font-size: 1.1rem;
        position: relative;
        overflow: hidden;
    }

    .cta-button:hover {
        transform: scale(1.05);
        box-shadow: 0 5px 15px rgba(0,0,0,0.2);
    }

    .btn-warning.cta-button:hover {
        background-color: #ffca2c;
        border-color: #ffca2c;
        color: #000;
    }

    .btn-outline-light.cta-button:hover {
        background-color: rgba(255,255,255,0.1);
        border-color: #fff;
        color: #fff;
    }

    /* Add a subtle animation for the promo section button */
    .promo-section .cta-button:hover {
        transform: translateY(-3px);
        box-shadow: 0 5px 15px rgba(255,255,255,0.2);
    }
        
        .nav-logo {
            font-weight: 700;
            font-size: 1.5rem;
            letter-spacing: 2px;
        }
        
        .stat-number {
            font-size: 2.5rem;
            font-weight: bold;
            color: #ffc107;
        }
        
          
        .promo-section {
    
    width: 100%;
    display: flex;
    align-items: center;
    padding: 30px;
     border-radius: 50px;
    height: 280px;
    background: linear-gradient(145deg, #1a1a1a, #000000);
    color: white;
    background: linear-gradient(90deg, rgba(28, 28, 28, 1) 65%, rgba(0, 0, 0, 1) 100%);
    
    }
    
    
    @keyframes fadeInUp {
        0% {
            opacity: 0;
            transform: translateY(40px);
        }
        100% {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .promo-section img {
        transition: transform 0.5s ease;
    }

    .promo-section img:hover {
        transform: scale(1.05);
    }
    
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container">
            <a class="navbar-brand nav-logo" href="login.jsp"><i class="fa-solid fa-taxi"></i> MEGACITY</a>
            <div class="d-flex">
                <a href="register.jsp" class="btn btn-outline-light me-2">Sign up</a>
                <a href="login.jsp" class="btn btn-warning">Login </a>
                
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section text-center">
        <div class="container">
            <h1 class="display-4 mb-4 animate__animated animate__fadeIn">Your Reliable Travel Partner MEGA CITY CAB...</h1>
            <p class="lead mb-5">Experience premium cab services in the city with 24/7 availability, 
            professional drivers, and instant bookings. Whether you're commuting 
            to work or exploring the city, we've got you covered!</p>
            <div class="d-flex gap-3 justify-content-center">
                <a href="login.jsp" class="btn btn-warning cta-button">Book Now</a>
                <a href="login.jsp" class="btn btn-outline-light cta-button">Existing User</a>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="py-5 bg-light">
        <div class="container">
            <div class="row text-center g-4">
                <div class="col-md-4">
                    <div class="stat-number">15K+</div>
                    <p>Daily Rides</p>
                </div>
                <div class="col-md-4">
                    <div class="stat-number">500+</div>
                    <p>Verified Drivers</p>
                </div>
                <div class="col-md-4">
                    <div class="stat-number">24/7</div>
                    <p>Service Available</p>
                </div>
            </div>
        </div>
    </section>
    
    
    <!-- Promo Section -->
<section class="promo-section py-5">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-7">
                <img src="images/webHome.jpeg" alt="Promo Car" class="img-fluid rounded-4 shadow-lg">
            </div>
            <div class="col-lg-5 text-center text-lg-start">
                <h2 class="fw-bold">Signup & Unlock Upto <span class="text-warning">50% Off</span></h2>
                <p class="fs-5">On Your <span class="text-success">First 2 Rides!</span></p>
                <a href="login.jsp" class="btn btn-outline-light cta-button"> Sign Up</a>
            </div>
        </div>
    </div>
</section>


    <!-- Features Section -->
    <section class="py-5">
        <div class="container">
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card feature-card h-100 text-center p-4">
                        <i class="fas fa-clock feature-icon text-warning"></i>
                        <h3>24/7 Availability</h3>
                        <p>RMegacityCab operates round-the-clock, ensuring you can book a ride anytime,
                         day or night, for your convenience and emergency travel needs.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card feature-card h-100 text-center p-4">
                        <i class="fas fa-shield-alt feature-icon text-warning"></i>
                        <h3>Safe Travel</h3>
                        <p>Your safety is a priority with MegacityCab, offering GPS tracking, 
                        verified drivers, and emergency support to ensure a secure and comfortable journey. </p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card feature-card h-100 text-center p-4">
                        <i class="fas fa-credit-card feature-icon text-warning"></i>
                        <h3>Cashless Payments</h3>
                        <p>Enjoy hassle-free transactions with cashless payment options, 
                        allowing you to pay securely via digital wallets, credit cards, or other online methods.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
    
    document.addEventListener("DOMContentLoaded", () => {
        const promoImage = document.querySelector(".promo-section img");
        promoImage.addEventListener("mouseover", () => {
            promoImage.style.transform = "scale(1.1)";
        });

        promoImage.addEventListener("mouseout", () => {
            promoImage.style.transform = "scale(1)";
        });
    });
    
    
    </script>
    
    <%@ include file="footer.jsp" %>
    
</body>
</html>