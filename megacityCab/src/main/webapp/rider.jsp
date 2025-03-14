<%@ page import="com.megacityCab.dao.RiderDAO" %>
<%@ page import="com.megacityCab.model.Rider" %>
<%@ page import="com.megacityCab.model.User" %>
<%@ page import="com.megacityCab.dao.RideDAO" %>
<%@ page import="com.megacityCab.model.Ride" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.megacityCab.model.User.Role" %>


<!DOCTYPE html>
<html>
<head>
    <title>Rider-Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/rider.css">
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
  
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

</head>
<body>
    <c:if test="${empty sessionScope.user || sessionScope.user.role ne 'RIDER'}">
        <c:redirect url="login.jsp"/>
    </c:if>
    
    
     <c:if test="${not empty param.success}">
    <div class="alert success">
        <c:choose>
            <c:when test="${param.success == 'ride_completed'}">
                Ride marked as completed!
            </c:when>
        </c:choose>
    </div>
</c:if>

<c:if test="${not empty param.error}">
    <div class="alert error">
        <c:choose>
            <c:when test="${param.error == 'completion_failed'}">
                Failed to complete ride. Please try again.
            </c:when>
            <c:when test="${param.error == 'invalid_ride_id'}">
                Invalid ride selection
            </c:when>
            <c:otherwise>
                Error processing request
            </c:otherwise>
        </c:choose>
    </div>
</c:if>

    
     
     
     <div class="profile-section">     
            <div class="admin-name">
            <i class="fas fa-user-check icon-brown"></i>
                Hi ,  <c:out value="${sessionScope.user.name}"/>
            </div>
            <a href="${pageContext.request.contextPath}/logout" class="logout-link">Logout</a>
        </div>
    
    <div class="container-fluid rider-container">
    <div class="row">
        <!-- Vehicle Details Card -->
        <div class="col-md-4">
            <div class="vehicle-card animate__animated animate__fadeInLeft">
                <c:if test="${not empty rider}">
                    <div class="vehicle-header">
                        <i class="fas fa-motorcycle"></i>
                        <h3>Your Vehicle Details</h3>
                    </div>
                    <div class="vehicle-body">
                        <div class="detail-item">
                            <i class="fas fa-car-side"></i>
                            <span>Type:</span>
                            <c:out value="${rider.vehicleType}"/>
                        </div>
                        <div class="detail-item">
                            <i class="fas fa-tag"></i>
                            <span>Model:</span>
                            <c:out value="${rider.vehicleModel}"/>
                        </div>
                        <div class="detail-item">
                            <i class="fas fa-hashtag"></i>
                            <span>Number:</span>
                            <c:out value="${rider.vehicleNumber}"/>
                        </div>
                        <div class="detail-item">
                            <i class="fas fa-phone"></i>
                            <span>Contact:</span>
                            <c:out value="${rider.phone}"/>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
        
    <div class="col-md-8">
            <div class="rides-section animate__animated animate__fadeInRight">
                <h2 class="section-title">
                    <i class="fas fa-list-check"></i>
                    Assigned Rides
                </h2>
                
        <div class="table-responsive">
                    <table class="rides-table table table-hover">
            <tr>
                <th>Ride ID</th>
                <th>Pickup</th>
                <th>Destination</th>
                <th>Vehicle Type</th>
                <th>Distance (km)</th>
        		<th>Cost (LKR)</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${assignedRides}" var="ride">
                <tr>
                    <td><c:out value="${ride.rideId}"/></td>
                    <td><c:out value="${ride.pickupLocation}"/></td>
                    <td><c:out value="${ride.destination}"/></td>
                    <td><c:out value="${ride.selectedVehicle}"/></td>
                    <td><fmt:formatNumber value="${ride.distance}" pattern="#0.0"/></td>
            		<td>LKR <fmt:formatNumber value="${ride.cost}" pattern="#,##0.00"/></td>
            		<td><c:out value="${ride.status}"/></td>
                    <td>
                    
                   <c:if test="${ride.status eq 'ASSIGNED'}">
                                <form action="${pageContext.request.contextPath}/completeRide" method="post">
                                    <input type="hidden" name="rideId" value="${ride.rideId}">
                                    <button type="submit" class="btn-complete">
                                        <i class="fas fa-check-circle"></i>
                                        Complete Ride
                                    </button>
                                    </form>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    </div>
    </div>
    </div>
    </div>
    
   
</body>
</html>