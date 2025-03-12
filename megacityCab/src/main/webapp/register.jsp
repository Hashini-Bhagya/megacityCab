 <%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
<!-- <!--   Add below Bootstrap links -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> -->
<!-- Add Font Awesome -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"> -->
<!-- Google Fonts -->
<!-- <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> --> 
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>   
</head>
<body>
    <div class="register-container">
<!--         <h2>Register</h2>  -->

    <div class="card animated">
        <div class="form-header">
            
            <h2 class="mb-3">Create Account</h2>
        </div>
        
        <form action="register" method="post">
            <div class="role-selection">
                <label>
                    <input type="radio" name="role" value="USER" id="user" checked> Passenger
                    
                </label>
                <label>
                    <input type="radio" name="role" value="Rider" id="rider"> Rider
                </label>
            </div>

            <div class="form-group">
                <label>Name:</label>
                <input type="text" name="name" required>
            </div>

            <div class="form-group">
                <label>NIC:</label>
                <input type="text" name="nic" required>
            </div>

            <div class="form-group">
                <label>Phone:</label>
                <input type="tel" name="tpnum" required>
            </div>

            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" required>
            </div>

            <div class="form-group">
                <label>Password:</label>
                <input type="password" name="password" required>
            </div>

            <div id="vehicleFields" class="hidden">
                <div class="form-group">
                    <label>Vehicle Type:</label>
                    <select name="vehicleSelect" required>
                        <option value="motorcycle">Motor Bike</option>
                        <option value="threewheel">Three Wheel</option>
                        <option value="car">Car</option>
                        <option value="van">Van</option>
                        <option value="truck">Truck</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Vehicle Model:</label>
                    <input type="text" name="vehicleModel" required>
                </div>

                <div class="form-group">
                    <label>Vehicle Number:</label>
                    <input type="text" name="vehicleNumber" required>
                </div>
            </div>

            <button type="submit">Register</button>
            <p>Have an account? <a href="login.jsp">Login</a></p>
        </form>
    </div>  
  </div>  


</body>
</html>