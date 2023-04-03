package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class DemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}
	
    // A simple greeting method
    @GetMapping("/")
    public String hello() {
        return "Hello, world!";
    }

    // A method that returns the square of a number
    @GetMapping("/square/{num}")
    public int getSquare(@PathVariable int num) {
        return num * num;
    }
    
    // A method that returns the square of a number
    @PostMapping("/square/{num}")
    public int postSquare(@PathVariable int num) {
        return num * num;
    }
}
