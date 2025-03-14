package com.megacityCab.servlets;

import com.megacityCab.dao.RideDAO;
import com.megacityCab.dao.RiderDAO;
import com.megacityCab.model.Ride;
import com.megacityCab.model.Rider;
import com.megacityCab.model.User;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/userDashboard")
public class UserDashboardServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        try {
            RideDAO rideDAO = new RideDAO();
            List<Ride> userRides = rideDAO.getUserRides(user.getId());
            
            // Get rider details for assigned rides
            Map<Integer, Rider> riderMap = new HashMap<>();
            RiderDAO riderDAO = new RiderDAO();
            
            for (Ride ride : userRides) {
                if (ride.getAssignedRiderId() != null) {
                    Rider rider = riderDAO.getRiderById(ride.getAssignedRiderId());
                    riderMap.put(ride.getRideId(), rider);
                }
            }
            
            request.setAttribute("userRides", userRides);
            request.setAttribute("riderMap", riderMap);
            
        } catch (Exception e) {
            request.setAttribute("error", "Failed to load rides");
        }
        
        request.getRequestDispatcher("/user.jsp").forward(request, response);
    }
}