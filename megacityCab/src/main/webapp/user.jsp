<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.megacityCab.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${empty sessionScope.user}">
    <c:redirect url="login.jsp"/>
</c:if>

<!DOCTYPE html>
<html>
<head>
    <title>User-Dashboard</title>
   
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css">
    
   <!-- Add Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"> 


</head>
<body>

  

   <div class="profile-section">     
            <div class="admin-name">
            <i class="fas fa-user-check icon-brown"></i>
                Hi ,  <c:out value="${sessionScope.user.name}"/>
            </div>
            <a href="${pageContext.request.contextPath}/logout" class="logout-link">Logout</a>
        </div>
    
         
         <!-- Book Ride Form Section -->
<div class="booking-container">
    <div class="booking-section">
        <h2 class="mb-4"><i class="fas fa-taxi icon-yellow"></i> Book a Ride</h2>
        <form action="bookRide" method="post">
        
          <div class="form-group">
                <label><i class="fa-solid fa-location-dot"></i> Pickup Location:</label>
                <input type="text" name="pickup" required>
            </div>
            <div class="form-group">
                <label><i class="fa-solid fa-location-dot"></i> Drop off Location:</label>
                <input type="text" name="destination" required>
            </div>
            <div class="form-group">
                <label><i class="fa-solid fa-calendar-days"></i> Date and Time:</label>
                <input type="datetime-local" 
                       name="scheduledTime" 
                       required
                       pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}">
            </div>
            <div class="form-group">
    			<label><i class="fa-solid fa-car"></i> Vehicle Type:</label>
    				<select name="SelectedVehicle" required>
					    <option value="">Select Vehicle</option>
					    <option value="MOTOR_BIKE"> Motor Bike (LKR 100/km)</option>
					    <option value="THREE_WHEEL">Three Wheel (LKR 150/km)</option>
					    <option value="CAR">Car (LKR 200/km)</option>
					    <option value="VAN">Van (LKR 250/km)</option>
					    <option value="TRUCK">Truck (LKR 500/km)</option>
					</select>
			</div>
            <div class="form-group">
    			<label><i class="fa-solid fa-road"></i> Distance (km):</label>
    			<input type="number" name="distance" step="0.1" required>
			</div>
			
            <c:if test="${not empty param.error}">
                <div class="alert error">
                    <c:choose>
                        <c:when test="${param.error == 'missing_time'}">
                            Please select a date and time
                        </c:when>
                        <c:when test="${param.error == 'invalid_time_format'}">
                            Invalid date/time format
                        </c:when>
                        <c:otherwise>
                            Error booking ride
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:if>
            
            
             <div class="form-actions">
                <button type="submit" class="btn-book-now">
                    <i class="fas fa-check-circle"></i> Book Now
                </button>
            </div>
            
             <!-- Vehicle Icons ABOVE Book Now Button -->
            <div class="vehicle-icons">
                <div class="vehicle-icon" data-vehicle="MOTOR_BIKE">
                    <i class="fas fa-motorcycle fa-2x"></i>
                   
                </div>
                <div class="vehicle-icon" data-vehicle="THREE_WHEEL">
                    <i class="fas fa-truck-pickup fa-2x"></i>
                   
                </div>
                <div class="vehicle-icon" data-vehicle="CAR">
                    <i class="fas fa-car fa-2x"></i>
                    
                </div>
                <div class="vehicle-icon" data-vehicle="VAN">
                    <i class="fas fa-shuttle-van fa-2x"></i>
                    
                </div>
                <div class="vehicle-icon" data-vehicle="TRUCK">
                    <i class="fas fa-truck fa-2x"></i>
                    
                </div>
            </div>

           
        </form>
    </div>
		
	<!-- Carousel Section - Updated with controls -->
<div class="booking-illustration carousel slide" id="rideCarousel" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="${pageContext.request.contextPath}/images/new3.jpg" class="d-block w-100" alt="Cab Service 1">
        </div>
        <div class="carousel-item">
            <img src="${pageContext.request.contextPath}/images/new2.jpeg" class="d-block w-100" alt="Cab Service 2">
        </div>
        <div class="carousel-item">
            <img src="${pageContext.request.contextPath}/images/New1.jpeg" class="d-block w-100" alt="Cab Service 3">
        </div>
    </div>
    </div>
    
       <!-- Carousel Controls -->
    <!--    <div>
    <button class="carousel-control-prev" type="button" data-bs-target="#rideCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#rideCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
    </div> -->
    
</div>

		
		
		<!-- Activities List -->
		
		<h2 class="mx-3"><i class="fas fa-history icon-yellow"></i> Your Activities</h2>
        <div class="rides-list">
    <c:forEach items="${userRides}" var="ride">
        <div class="ride-card">
            <div class="ride-info">
                <span>Pickup</span>
                <div>${ride.pickupLocation}</div>
            </div>
            <div class="ride-info">
                <span>Destination</span>
                <div>${ride.destination}</div>
            </div>
            <div class="ride-info">
                <span>Vehicle</span>
                <div>${ride.selectedVehicle}</div>
            </div>
            <div class="ride-info">
                <span>Status</span>
                <div class="status-badge ${ride.status eq 'ASSIGNED' ? 'assigned' : 'pending'}">
                    ${ride.status}
                </div>
            </div>
            <div class="ride-info">
                <span>Time</span>
                <div>
                    <fmt:formatDate value="${ride.scheduledTimeAsDate}" 
                                  pattern="yyyy-MM-dd HH:mm" />
                </div>
            </div>
             <div class="ride-info">
             <span>Actions</span>
                <c:if test="${ride.editable}">
                    <form action="deleteRide" method="post">
                        <input type="hidden" name="rideId" value="${ride.rideId}">
                        <button type="submit" class="btn-cancel">
                            <i class="fas fa-times-circle"></i> Cancel
                        </button>
                    </form>
                </c:if>
             
                
                <c:if test="${ride.status == 'ASSIGNED'}">
                    <c:set var="rider" value="${riderMap[ride.rideId]}"/>
                    <c:if test="${not empty rider}">
                        <button class="show-rider-btn"
                                data-vehicle-number="${rider.vehicleNumber}"
                                data-vehicle-type="${rider.vehicleType}"
                                data-phone="${rider.phone}">
                            <i class="fas fa-info-circle"></i> View Details
                        </button>
                    </c:if>
                </c:if>
            </div>
        </div>
    </c:forEach>
</div>


   <!-- Modal (keep this at bottom) -->
<div id="riderModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h3>Rider Details</h3>
        <div class="modal-body">
            <p>Vehicle Number: <span id="modalVehicleNumber"></span></p>
            <p>Vehicle Type: <span id="modalVehicleType"></span></p>
            <p>Contact: <span id="modalPhone"></span></p>
        </div>
    </div>
</div>



    <script>
// Initialize Carousel with proper options
const carousel = new bootstrap.Carousel('#rideCarousel', {
    interval: 3000,
    wrap: true,
    pause: false
});

// Modal Handling (updated for list view)
document.addEventListener('DOMContentLoaded', () => {
    const modal = document.getElementById('riderModal');
    const span = document.querySelector('.close');
    
    document.querySelectorAll('.show-rider-btn').forEach(btn => {
        btn.addEventListener('click', () => {
            document.getElementById('modalVehicleNumber').textContent = 
                btn.dataset.vehicleNumber;
            document.getElementById('modalVehicleType').textContent = 
                btn.dataset.vehicleType;
            document.getElementById('modalPhone').textContent = 
                btn.dataset.phone;
            modal.style.display = 'block';
        });
    });

    span.onclick = () => modal.style.display = 'none';
    window.onclick = (event) => {
        if (event.target === modal) modal.style.display = 'none';
    }
});
</script>

<%@ include file="footer.jsp" %>

</body>
</html>