package com.megacityCab.model;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDateTime;

public class RideTest {

    private Ride ride;

    @BeforeEach
    public void setUp() {
        ride = new Ride();
        ride.setRideId(1);
        ride.setUserId(101);
        ride.setPickupLocation("Point A");
        ride.setDestination("Point B");
        ride.setAssignedRiderId(202);
        ride.setRequestTime("2025-03-12T10:00:00");
        ride.setScheduledTime(LocalDateTime.of(2025, 3, 12, 11, 0));
        ride.setBookedTime(LocalDateTime.of(2025, 3, 12, 10, 30));
        ride.setDeadlineTime(LocalDateTime.of(2025, 3, 12, 12, 0));
        ride.setDistance(15.0);
        ride.setStatus(Ride.Status.REQUESTED);
        ride.setSelectedVehicle(Ride.SelectedVehicle.CAR);
    }

    @Test
    public void testRideProperties() {
        assertEquals(1, ride.getRideId());
        assertEquals(101, ride.getUserId());
        assertEquals("Point A", ride.getPickupLocation());
        assertEquals("Point B", ride.getDestination());
        assertEquals(202, ride.getAssignedRiderId());
        assertEquals("2025-03-12T10:00:00", ride.getRequestTime());
        assertEquals(LocalDateTime.of(2025, 3, 12, 11, 0), ride.getScheduledTime());
        assertEquals(LocalDateTime.of(2025, 3, 12, 10, 30), ride.getBookedTime());
        assertEquals(LocalDateTime.of(2025, 3, 12, 12, 0), ride.getDeadlineTime());
        assertEquals(15.0, ride.getDistance(), 0.001);
        assertEquals(Ride.Status.REQUESTED, ride.getStatus());
        assertEquals(Ride.SelectedVehicle.CAR, ride.getSelectedVehicle());
    }

    @Test
    public void testCalculateCost() {
        double expectedCost = 100.00 + (15.0 * 45);
        assertEquals(expectedCost, ride.calculateCost(), 0.01);
    }

    @Test
    public void testIsEditable() {
        assertTrue(ride.isEditable());

        ride.setStatus(Ride.Status.ASSIGNED);
        assertFalse(ride.isEditable());
    }

    @Test
    public void testSetAndGetAssignedRiderId() {
        ride.setAssignedRiderId(303);
        assertEquals(303, ride.getAssignedRiderId());
    }

    @Test
    public void testVehicleFromString() {
        assertEquals(Ride.SelectedVehicle.MOTOR_BIKE, Ride.SelectedVehicle.fromString("MOTOR_BIKE"));
        assertEquals(Ride.SelectedVehicle.TRUCK, Ride.SelectedVehicle.fromString("truck"));

        Exception exception = assertThrows(IllegalArgumentException.class, () -> {
            Ride.SelectedVehicle.fromString("PLANE");
        });

        assertTrue(exception.getMessage().contains("No enum constant"));
    }

    @Test
    public void testGetScheduledTimeAsDate() {
        assertNotNull(ride.getScheduledTimeAsDate());
    }

    @Test
    public void testSetAndGetCost() {
        ride.setCost(500.0);
        assertEquals(500.0, ride.getCost());
    }
}
