package com.megacityCab.model;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class RiderTest {

    @Test
    public void testRiderId() {
        Rider rider = new Rider();
        rider.setRiderId(1);
        assertEquals(1, rider.getRiderId(), "Rider ID should be 1");
    }

    @Test
    public void testUserId() {
        Rider rider = new Rider();
        rider.setUserId(100);
        assertEquals(100, rider.getUserId(), "User ID should be 100");
    }

    @Test
    public void testVehicleType() {
        Rider rider = new Rider();
        rider.setVehicleType("Car");
        assertEquals("Car", rider.getVehicleType(), "Vehicle Type should be 'Car'");
    }

    @Test
    public void testVehicleModel() {
        Rider rider = new Rider();
        rider.setVehicleModel("Toyota Corolla");
        assertEquals("Toyota Corolla", rider.getVehicleModel(), "Vehicle Model should be 'Toyota Corolla'");
    }

    @Test
    public void testVehicleNumber() {
        Rider rider = new Rider();
        rider.setVehicleNumber("ABC-1234");
        assertEquals("ABC-1234", rider.getVehicleNumber(), "Vehicle Number should be 'ABC-1234'");
    }

    @Test
    public void testPhone() {
        Rider rider = new Rider();
        rider.setPhone("123-456-7890");
        assertEquals("123-456-7890", rider.getPhone(), "Phone number should be '123-456-7890'");
    }
}
