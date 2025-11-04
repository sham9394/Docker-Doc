package com.example;
import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.web.bind.annotation.*;

@SpringBootApplication
@RestController
public class Application {
    @GetMapping("/health") public String health(){ return "ok"; }
    @GetMapping("/") public String home(){ return "Hello from Spring Boot!"; }
    public static void main(String[] args){ SpringApplication.run(Application.class, args); }
}
