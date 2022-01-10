package dev.evertonsavio.app;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.ComponentScan;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@ComponentScan(basePackages = "dev.evertonsavio.app")
class MainServiceApplicationTest {

    @Test
    void main() {
        assertEquals(1, 1);
    }
}