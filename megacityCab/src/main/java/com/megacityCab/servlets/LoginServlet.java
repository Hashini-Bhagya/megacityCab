package com.megacityCab.servlets;

import com.megacityCab.dao.UserDAO;
import com.megacityCab.model.User;
import com.megacityCab.utils.SecurityUtil;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            UserDAO userDAO = new UserDAO();
            User user = userDAO.findByEmail(email);

            if (user != null && SecurityUtil.checkPassword(password, user.getPasswordHash())) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                
                // Redirect to DASHBOARD SERVLET instead of JSP
                switch(user.getRole()) {
                    case ADMIN:
                        response.sendRedirect("adminDashboard"); 
                        break;
                    case RIDER:
                        response.sendRedirect("riderDashboard");
                        break;
                    case USER:
                    default:
                        response.sendRedirect("userDashboard"); 
                }
            } else {
                response.sendRedirect("login.jsp?error=invalid_credentials");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=server_error");
        }
    }
}