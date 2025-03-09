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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <h1>Welcome User: <c:out value="${sessionScope.user.name}"/></h1>
    <a href="${pageContext.request.contextPath}/logout">Logout</a>

        <h2>Book a Ride</h2>
        <div class="booking-section">
        <form action="bookRide" method="post">
            <div class="form-group">
                <label>Pickup Location:</label>
                <input type="text" name="pickup" required>
            </div>
            <div class="form-group">
                <label>Destination:</label>
                <input type="text" name="destination" required>
            </div>
            <div class="form-group">
                <label>Date and Time:</label>
                <input type="datetime-local" 
                       name="scheduledTime" 
                       required
                       pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}">
            </div>
            <div class="form-group">
    			<label>Vehicle Type:</label>
    				<select name="SelectedVehicle" required>
					    <option value="">Select Vehicle</option>
					    <option value="MOTOR_BIKE">Motor Bike (LKR 30/km)</option>
					    <option value="THREE_WHEEL">Three Wheel (LKR 35/km)</option>
					    <option value="CAR">Car (LKR 45/km)</option>
					    <option value="VAN">Van (LKR 60/km)</option>
					    <option value="TRUCK">Truck (LKR 80/km)</option>
					</select>
			</div>
            <div class="form-group">
    			<label>Distance (km):</label>
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

            <button type="submit">Book Ride</button>
        </form>
		</div>
        <h2>Your Upcoming Rides</h2>
        <div class="upcoming-rides">
        <table class="rides-table">
            <tr>
                <th>Pickup</th>
                <th>Destination</th>
                <th>Vehicle Type</th>
                <th>Distance (km)</th>
                <th>Cost</th>
                <th>Scheduled Time</th>
                <th>Status</th>
                <th>Assigned Rider</th>
                <th>Actions</th>
            </tr>
            <c:forEach items="${userRides}" var="ride">
                <c:if test="${ride.status != 'COMPLETED'}">
                    <tr>
                        <td><c:out value="${ride.pickupLocation}"/></td>
                        <td><c:out value="${ride.destination}"/></td>
                        <td><c:out value="${ride.selectedVehicle}"/></td>
                        <td><fmt:formatNumber value="${ride.distance}" pattern="#0.0"/></td>
                        <td>LKR <fmt:formatNumber value="${ride.cost}" pattern="#,##0.00"/></td>
                        <td>
                            <fmt:formatDate value="${ride.scheduledTimeAsDate}" 
                                          pattern="yyyy-MM-dd HH:mm" />
                        </td>
                        <td><c:out value="${ride.status}"/></td>
                        <td>
                            <c:if test="${ride.status == 'ASSIGNED'}">
                                <c:set var="rider" value="${riderMap[ride.rideId]}"/>
                                <c:if test="${not empty rider}">
                                    <button class="show-rider-btn"
                                            data-vehicle-number="${rider.vehicleNumber}"
                                            data-vehicle-type="${rider.vehicleType}"
                                            data-phone="${rider.phone}">
                                        View Rider Details
                                    </button>
                                </c:if>
                            </c:if>
                        </td>
                        <td>
						    <c:if test="${ride.editable}">
						        <form action="deleteRide" method="post">
						            <input type="hidden" name="rideId" value="${ride.rideId}">
						            <button type="submit">Cancel Ride</button>
						        </form>
						    </c:if>
						</td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>
    </div>

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
</body>
</html>