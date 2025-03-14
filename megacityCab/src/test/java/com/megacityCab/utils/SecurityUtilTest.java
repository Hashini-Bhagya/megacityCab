package com.megacityCab.utils;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import static org.junit.jupiter.api.Assertions.*;

class SecurityUtilTest {

    @Test
    void hashPassword_GeneratesValidHash() {
        String password = "securePassword123!";
        String hashed = SecurityUtil.hashPassword(password);
        
        assertNotNull(hashed);
        assertTrue(hashed.startsWith("$2a$"));
        assertTrue(hashed.length() > 20);
    }

    @Test
    void hashPassword_SamePasswordDifferentHashes() {
        String password = "samePassword";
        String hash1 = SecurityUtil.hashPassword(password);
        String hash2 = SecurityUtil.hashPassword(password);
        
        assertNotEquals(hash1, hash2);
    }

    @Test
    void checkPassword_CorrectPassword_ReturnsTrue() {
        String password = "user@Password";
        String hashed = SecurityUtil.hashPassword(password);
        assertTrue(SecurityUtil.checkPassword(password, hashed));
    }

    @Test
    void checkPassword_WrongPassword_ReturnsFalse() {
        String originalPassword = "correctPassword";
        String wrongPassword = "wrongPassword";
        String hashed = SecurityUtil.hashPassword(originalPassword);
        
        assertFalse(SecurityUtil.checkPassword(wrongPassword, hashed));
    }

    @ParameterizedTest
    @ValueSource(strings = {
        "",                          // empty password
        " ",                         // space
                  // 100-character password
        "p@ssw0rd\uD83D\uDE00",     // password with emoji
        "test' OR 1=1;--"           // SQL injection attempt
    })
    void checkPassword_EdgeCases(String password) {
        String hashed = SecurityUtil.hashPassword(password);
        assertTrue(SecurityUtil.checkPassword(password, hashed),
            "Failed for password: " + password);
    }

    @Test
    void checkPassword_InvalidHash_ThrowsException() {
        String validPassword = "test123";
        String invalidHash = "invalid_hash_format";
        
        assertThrows(IllegalArgumentException.class,
            () -> SecurityUtil.checkPassword(validPassword, invalidHash));
    }
}