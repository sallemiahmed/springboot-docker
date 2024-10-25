package com.example.springbootdocker;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class DataInitializer implements CommandLineRunner {

    @Autowired
    private UserRepository userRepository;

    @Override
    public void run(String... args) throws Exception {
        // Check if there are existing users to avoid duplication
        if (userRepository.count() == 0) {
            User user1 = new User();
            user1.setName("John Doe");
            user1.setEmail("john.doe@example.com");

            User user2 = new User();
            user2.setName("Jane Doe");
            user2.setEmail("jane.doe@example.com");

            userRepository.save(user1);
            userRepository.save(user2);
        }
    }
}
