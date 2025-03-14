<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - MegaCityCab</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet">
</head>
<body class="auth-container">
    <div class="auth-card">
        <c:if test="${not empty param.error}">
            <div class="alert alert-danger">Invalid credentials</div>
        </c:if>
        
        <c:if test="${not empty param.registered}">
            <div class="alert alert-success">Registration successful! Please login.</div>
        </c:if>

        <div class="form-header">
            <h2><i class="fas fa-taxi me-2"></i>MEGA CITY CAB</h2>
        </div>

        <form action="login" method="post">
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="email" class="form-control" required>
            </div>
            
            <div class="mb-4">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-primary w-100">Login</button>
            
            <div class="text-center mt-3">
                <p>Don't have an account? <a href="register.jsp" class="auth-link">Register here</a></p>
            </div>
        </form>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>