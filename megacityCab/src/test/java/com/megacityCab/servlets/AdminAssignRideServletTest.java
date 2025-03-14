package com.megacityCab.servlets;

import com.megacityCab.dao.RideDAO;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

import static org.mockito.Mockito.*;

public class AdminAssignRideServletTest {

    @InjectMocks
    private AdminAssignRideServlet adminAssignRideServlet;

    @Mock
    private HttpServletRequest request;

    @Mock
    private HttpServletResponse response;

    @Mock
    private RideDAO rideDAO;

    @SuppressWarnings("deprecation")
	@BeforeEach
    public void setUp() {
        MockitoAnnotations.initMocks(this); // Initialize the mocks
    }

    @Test
    public void testDoPost_Success() throws Exception {
        // Mock the request parameters
        when(request.getParameter("rideId")).thenReturn("1");
        when(request.getParameter("riderId")).thenReturn("2");

        // Mock the DAO method to return true (success)
        when(rideDAO.assignRider(1, 2)).thenReturn(true);

        // Call the servlet doPost method
        adminAssignRideServlet.doPost(request, response);

        // Verify that the response redirects to the success URL
        verify(response).sendRedirect("adminDashboard?success=ride_assigned");
    }

    @Test
    public void testDoPost_Failure() throws Exception {
        // Mock the request parameters
        when(request.getParameter("rideId")).thenReturn("1");
        when(request.getParameter("riderId")).thenReturn("2");

        // Mock the DAO method to return false (failure)
        when(rideDAO.assignRider(1, 2)).thenReturn(false);

        // Call the servlet doPost method
        adminAssignRideServlet.doPost(request, response);

        // Verify that the response redirects to the error URL with rideId
        verify(response).sendRedirect("adminDashboard?error=assignment_failed&rideId=1");
    }

    @Test
    public void testDoPost_InvalidIdFormat() throws ServletException, IOException {
        // Mock the request parameters with invalid format (non-numeric)
        when(request.getParameter("rideId")).thenReturn("invalid");
        when(request.getParameter("riderId")).thenReturn("2");

        // Call the servlet doPost method
        adminAssignRideServlet.doPost(request, response);

        // Verify that the response redirects to the invalid_id error page
        verify(response).sendRedirect("adminDashboard?error=invalid_id");
    }

    @Test
    public void testDoPost_ExceptionHandling() throws Exception {
        // Mock the request parameters
        when(request.getParameter("rideId")).thenReturn("1");
        when(request.getParameter("riderId")).thenReturn("2");

        // Mock the DAO method to throw an exception
        when(rideDAO.assignRider(1, 2)).thenThrow(new RuntimeException("Database error"));

        // Call the servlet doPost method
        adminAssignRideServlet.doPost(request, response);

        // Verify that the response redirects to the server_error page
        verify(response).sendRedirect("adminDashboard?error=server_error");
    }
}
