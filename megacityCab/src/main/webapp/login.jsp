<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">

</head>
<body>
 
    <div class="login-container">
      
        <c:if test="${not empty param.error}">
            <div class="alert error">Invalid credentials</div>
        </c:if>
        
        <c:if test="${not empty param.registered}">
            <div class="alert success">Registration successful! Please login.</div>
        </c:if>
        
       <div class="card animated">
          <div class="form-header">   
          <h2 class="mb-3">MEGA CITY CAB </h2>
        </div>
        
        <form action="login" method="post">
            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" required>
            </div>
            <div class="form-group">
                <label>Password:</label>
                <input type="password" name="password" required>
            </div>
            <button type="submit">Login</button>
            <p>Don't have an account? <a href="register.jsp">Register here</a></p>
        </form>
      
    </div>
    </div>
      
</body>
</html>