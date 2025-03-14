package com.megacityCab.model;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class UserTest {

    @Test
    void testDefaultRole() {
        User user = new User();
        assertEquals(User.Role.USER, user.getRole(), "Default role should be USER");
    }

    @Test
    void testSetRole() {
        User user = new User();
        
        // Valid role
        user.setRole(User.Role.ADMIN);
        assertEquals(User.Role.ADMIN, user.getRole());
        
        // Null role (should default to USER)
        user.setRole(null);
        assertEquals(User.Role.USER, user.getRole());
    }

    @Test
    void testSetRoleFromString() {
        User user = new User();

        // Valid roles (case-insensitive)
        user.setRoleFromString("admin");
        assertEquals(User.Role.ADMIN, user.getRole());

        user.setRoleFromString("RIDER");
        assertEquals(User.Role.RIDER, user.getRole());

        // Invalid/unknown role
        user.setRoleFromString("INVALID_ROLE");
        assertEquals(User.Role.USER, user.getRole());

        // Empty/null input
        user.setRoleFromString("");
        assertEquals(User.Role.USER, user.getRole());

        user.setRoleFromString(null);
        assertEquals(User.Role.USER, user.getRole());
    }

    @Test
    void testSettersAndGetters() {
        User user = new User();

        user.setId(123);
        user.setName("John Doe");
        user.setNic("987654321X");
        user.setPhone("0771234567");
        user.setEmail("john@example.com");
        user.setPasswordHash("hashed_123");

        assertAll("Verify all setters/getters",
            () -> assertEquals(123, user.getId()),
            () -> assertEquals("John Doe", user.getName()),
            () -> assertEquals("987654321X", user.getNic()),
            () -> assertEquals("0771234567", user.getPhone()),
            () -> assertEquals("john@example.com", user.getEmail()),
            () -> assertEquals("hashed_123", user.getPasswordHash())
        );
    }
}