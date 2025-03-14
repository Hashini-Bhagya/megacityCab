<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        .admin-navbar {
            background: linear-gradient(135deg, #2c3e50, #3498db);
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            padding: 0.8rem 1rem;
        }
        
        .nav-link {
            color: rgba(255,255,255,0.9) !important;
            transition: all 0.3s ease;
            margin: 0 0.8rem;
            position: relative;
        }
        
        .nav-link:hover,
        .nav-link.active {
            color: #fff !important;
            transform: translateY(-2px);
        }
        
        .nav-link.active::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 100%;
            height: 2px;
            background: #fff;
            animation: underline 0.3s ease;
        }
        
        @keyframes underline {
            from { width: 0 }
            to { width: 100% }
        }
        
        .brand-text {
            font-weight: 600;
            letter-spacing: 0.5px;
        }
        
        .logout-btn {
            background: rgba(255,255,255,0.1);
            border: 1px solid rgba(255,255,255,0.2);
            transition: all 0.3s ease;
        }
        
        .logout-btn:hover {
            background: rgba(255,255,255,0.2);
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg admin-navbar">
        <div class="container-fluid">
            <a class="navbar-brand brand-text text-white" href="#">
                <i class="fas fa-taxi me-2"></i>Megacity Admin
            </a>
            
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                    data-bs-target="#adminNav" aria-controls="adminNav" 
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon text-white"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="adminNav">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link ${param.page == 'dashboard' ? 'active' : ''}" 
                           href="adminDashboard">
                           <i class="fas fa-road me-1"></i>Manage Rides
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${param.page == 'users' ? 'active' : ''}" 
                           href="adminUsers">
                           <i class="fas fa-users-cog me-1"></i>Manage Users
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${param.page == 'riders' ? 'active' : ''}" 
                           href="adminRiders">
                           <i class="fas fa-motorcycle me-1"></i>View Riders
                        </a>
                    </li>
                </ul>
                
                <div class="d-flex align-items-center">
                    <span class="text-white me-3">
                        <i class="fas fa-user-shield me-2"></i>
                        <c:out value="${sessionScope.user.name}"/>
                    </span>
                    <a href="${pageContext.request.contextPath}/logout" 
                       class="btn btn-sm logout-btn text-white">
                       <i class="fas fa-sign-out-alt me-2"></i>Logout
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Error Message -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible fade show m-3">
            <i class="fas fa-exclamation-circle me-2"></i>
            <c:out value="${error}"/>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>