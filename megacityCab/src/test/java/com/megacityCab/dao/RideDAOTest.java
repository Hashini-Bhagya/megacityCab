package com.megacityCab.dao;

import com.megacityCab.model.Ride;
import com.megacityCab.utils.DBUtil;
import org.junit.jupiter.api.*;
import java.sql.*;
import java.time.LocalDateTime;
import static org.junit.jupiter.api.Assertions.*;

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
class RideDAOTest {

    private RideDAO rideDAO;
    private Connection testConn;

    @BeforeAll
    void setupDatabase() throws Exception {
        // Initialize test mode FIRST
        Class.forName("org.h2.Driver");
        testConn = DriverManager.getConnection(
            "jdbc:h2:mem:test;DB_CLOSE_DELAY=-1;INIT=CREATE SCHEMA IF NOT EXISTS PUBLIC",
            "sa",
            ""
        );
        DBUtil.enableTestMode(testConn);

        // Create tables
        try (Statement stmt = testConn.createStatement()) {
            stmt.execute("CREATE TABLE rides (" +
                "ride_id INT PRIMARY KEY AUTO_INCREMENT," +
                "user_id INT NOT NULL," +
                "pickup_location VARCHAR(255) NOT NULL," +
                "destination VARCHAR(255) NOT NULL," +
                "scheduled_time TIMESTAMP NOT NULL," +
                "deadline_time TIMESTAMP," +
                "distance DOUBLE NOT NULL," +
                "cost DOUBLE NOT NULL," +
                "selected_vehicle VARCHAR(50) NOT NULL," +
                "status VARCHAR(50) NOT NULL," +
                "booked_time TIMESTAMP," +
                "assigned_rider_id INT)");
        }
        
        rideDAO = new RideDAO();
    }

    @AfterEach
    void cleanUp() throws SQLException {
        try (Statement stmt = testConn.createStatement()) {
            stmt.execute("DELETE FROM rides");
        }
    }

    @AfterAll
    void tearDown() throws SQLException {
        if (testConn != null && !testConn.isClosed()) {
            testConn.close();
        }
        DBUtil.enableTestMode(null); // Reset after all tests
    }

    // Test methods remain the same as previous version
    @Test
    void testCreateAndGetRide() throws Exception {
        Ride ride = createSampleRide();
        assertTrue(rideDAO.createRide(ride));
        
        Ride retrieved = rideDAO.getRideById(1);
        assertNotNull(retrieved);
        assertEquals("Central Park", retrieved.getPickupLocation());
        assertEquals(Ride.Status.REQUESTED, retrieved.getStatus());
    }

    @Test
    void testUpdateRide() throws Exception {
        Ride ride = createSampleRide();
        rideDAO.createRide(ride);
        
        ride.setPickupLocation("Updated Location");
        ride.setDistance(20.0);
        assertTrue(rideDAO.updateRide(ride));
        
        Ride updated = rideDAO.getRideById(1);
        assertEquals("Updated Location", updated.getPickupLocation());
        assertEquals(20.0, updated.getDistance(), 0.001);
    }

    // Other test methods (deleteRide, getUserRides, etc.) 
    // remain identical to previous implementation
    
    private Ride createSampleRide() {
        Ride ride = new Ride();
        ride.setUserId(100);
        ride.setPickupLocation("Central Park");
        ride.setDestination("Times Square");
        ride.setScheduledTime(LocalDateTime.now().plusHours(1));
        ride.setDistance(15.0);
        ride.setCost(325.00);
        ride.setSelectedVehicle(Ride.SelectedVehicle.CAR);
        ride.setStatus(Ride.Status.REQUESTED);
        return ride;
    }
}