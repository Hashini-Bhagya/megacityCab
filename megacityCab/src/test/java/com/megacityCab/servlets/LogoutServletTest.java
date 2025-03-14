package com.megacityCab.servlets;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class LogoutServletTest {

    @Mock
    private HttpServletRequest request;

    @Mock
    private HttpServletResponse response;

    @Mock
    private HttpSession session;

    @InjectMocks
    private LogoutServlet logoutServlet;

    @Test
    void testDoGetWithExistingSession() throws IOException, ServletException {
        // Arrange
        when(request.getSession(false)).thenReturn(session);
        when(request.getContextPath()).thenReturn("/megacitycab");

        // Act
        logoutServlet.doGet(request, response);

        // Assert
        verify(session).invalidate();
        verify(response).setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        verify(response).setHeader("Pragma", "no-cache");
        verify(response).setDateHeader("Expires", 0);
        verify(response).sendRedirect("/megacitycab/home.jsp");
    }

    @Test
    void testDoGetWithoutSession() throws IOException, ServletException {
        // Arrange
        when(request.getSession(false)).thenReturn(null);
        when(request.getContextPath()).thenReturn("/megacitycab");

        // Act
        logoutServlet.doGet(request, response);

        // Assert
        verify(session, never()).invalidate();
        verify(response).sendRedirect("/megacitycab/home.jsp");
    }

    @Test
    void testCacheHeadersAlwaysSet() throws IOException, ServletException {
        // Arrange
        when(request.getSession(false)).thenReturn(null);
        when(request.getContextPath()).thenReturn("");

        // Act
        logoutServlet.doGet(request, response);

        // Assert
        verify(response).setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        verify(response).setHeader("Pragma", "no-cache");
        verify(response).setDateHeader("Expires", 0);
        verify(response).sendRedirect("/home.jsp");
    }
}