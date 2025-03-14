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
import java.util.List;

@WebServlet("/riderDashboard")
public class RiderDashboardServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
		
		 HttpSession session = request.getSession(false);
	        User user = (session != null) ? (User) session.getAttribute("user") : null;
	        
	        if(user == null || user.getRole() != User.Role.RIDER) {
	            response.sendRedirect("login.jsp");
	            return;
	        }

	        try {
	            RiderDAO riderDAO = new RiderDAO();
	            Rider rider = riderDAO.findByUserId(user.getId());
	            
	            RideDAO rideDAO = new RideDAO();
	            List<Ride> assignedRides = rideDAO.getRidesByRider(rider.getRiderId());
	            
	            request.setAttribute("rider", rider);
	            request.setAttribute("assignedRides", assignedRides);
	            
	        } catch (Exception e) {
	            request.setAttribute("error", "Error loading data: " + e.getMessage());
	        }
	        
	        request.getRequestDispatcher("/rider.jsp").forward(request, response);
	    }
	}