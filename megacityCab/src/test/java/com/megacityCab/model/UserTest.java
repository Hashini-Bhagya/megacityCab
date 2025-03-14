package com.megacityCab.model;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class UserTest {

    @Test
    public void testId() {
        User user = new User();
        user.setId(1);
        assertEquals(1, user.getId(), "User ID should be 1");
    }

    @Test
    public void testName() {
        User user = new User();
        user.setName("John Doe");
        assertEquals("John Doe", user.getName(), "User name should be 'John Doe'");
    }

    @Test
    public void testNic() {
        User user = new User();
        user.setNic("123456789V");
        assertEquals("123456789V", user.getNic(), "User NIC should be '123456789V'");
    }

    @Test
    public void testPhone() {
        User user = new User();
        user.setPhone("123-456-7890");
        assertEquals("123-456-7890", user.getPhone(), "User phone number should be '123-456-7890'");
    }

    @Test
    public void testEmail() {
        User user = new User();
        user.setEmail("johndoe@example.com");
        assertEquals("johndoe@example.com", user.getEmail(), "User email should be 'johndoe@example.com'");
    }

    @Test
    public void testPasswordHash() {
        User user = new User();
        user.setPasswordHash("hashedPassword123");
        assertEquals("hashedPassword123", user.getPasswordHash(), "Password hash should be 'hashedPassword123'");
    }

    @Test
    public void testDefaultRole() {
        User user = new User();
        assertEquals(User.Role.USER, user.getRole(), "Default role should be 'USER'");
    }

    @Test
    public void testSetRole() {
        User user = new User();
        user.setRole(User.Role.RIDER);
        assertEquals(User.Role.RIDER, user.getRole(), "Role should be set to 'RIDER'");
    }

    @Test
    public void testSetRoleFromStringValid() {
        User user = new User();
        user.setRoleFromString("admin");
        assertEquals(User.Role.ADMIN, user.getRole(), "Role should be set to 'ADMIN'");
    }

    @Test
    public void testSetRoleFromStringInvalid() {
        User user = new User();
        user.setRoleFromString("invalidRole");
        assertEquals(User.Role.USER, user.getRole(), "Role should default to 'USER' for invalid input");
    }

    @Test
    public void testSetRoleFromStringNull() {
        User user = new User();
        user.setRoleFromString(null);
        assertEquals(User.Role.USER, user.getRole(), "Role should default to 'USER' when input is null");
    }

    @Test
    public void testSetRoleFromStringEmpty() {
        User user = new User();
        user.setRoleFromString("");
        assertEquals(User.Role.USER, user.getRole(), "Role should default to 'USER' for empty input");
    }
}
