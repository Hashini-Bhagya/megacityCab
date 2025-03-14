<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Register - MegaCityCab</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome@6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet">
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const roleRadios = document.querySelectorAll('input[name="role"]');
            const vehicleFields = document.getElementById('vehicleFields');
            
            function toggleVehicleFields() {
                const isRider = document.querySelector('input[name="role"]:checked').value === 'rider';
                vehicleFields.classList.toggle('d-none', !isRider);
                
                // Toggle required attributes
                const vehicleInputs = vehicleFields.querySelectorAll('input, select');
                vehicleInputs.forEach(input => {
                    input.required = isRider;
                    if(!isRider) input.value = ''; // Clear values if not rider
                });
            }

            roleRadios.forEach(radio => radio.addEventListener('change', toggleVehicleFields));
            toggleVehicleFields(); // Initial check
        });
    </script>
</head>
<body class="auth-container">
    <div class="auth-card">
    
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
        
         <div class="form-header">
            <h2><i class="fas fa-user-plus me-2"></i>Create Account</h2>
        </div>


        <form action="register" method="post">
            <div class="role-selection mb-4">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="role" id="user" value="USER" checked>
                    <label class="form-check-label" for="user">Passenger</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="role" id="rider" value="rider">
                    <label class="form-check-label" for="rider">Driver</label>
                </div>
            </div>

            <div class="row g-3">
                <div class="col-md-6">
                    <label class="form-label">Full Name</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                
                <div class="col-md-6">
                    <label class="form-label">NIC Number</label>
                    <input type="text" name="nic" class="form-control" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Phone Number</label>
                    <input type="tel" name="tpnum" class="form-control" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>

                <div class="col-12">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
            </div>

            <div id="vehicleFields" class="d-none mt-4">
                <h6 class="mb-3">Vehicle Information</h6>
                
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Vehicle Type</label>
                        <select name="vehicleSelect" class="form-select">
                            <option value="motorcycle">Motor Bike</option>
                            <option value="threewheel">Three Wheel</option>
                            <option value="car">Car</option>
                            <option value="van">Van</option>
                            <option value="truck">Truck</option>
                        </select>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label">Vehicle Model</label>
                        <input type="text" name="vehicleModel" class="form-control">
                    </div>

                    <div class="col-12">
                        <label class="form-label">Vehicle Number</label>
                        <input type="text" name="vehicleNumber" class="form-control">
                    </div>
                </div>
            </div>

            <button type="submit" class="btn btn-primary w-100 mt-4">Register</button>
            
            <div class="text-center mt-3">
                <p>Already have an account? <a href="login.jsp" class="auth-link">Login here</a></p>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>