package vn.iotstar.service;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import vn.iotstar.entity.User;
import vn.iotstar.repository.UserRepository;

@Service
@RequiredArgsConstructor
public class UserService {
    
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    
    public User login(String email, String password) {
        User user = userRepository.findByEmail(email)
            .orElseThrow(() -> new RuntimeException("Invalid email or password"));
        
        if (!passwordEncoder.matches(password, user.getPassword())) {
            throw new RuntimeException("Invalid email or password");
        }
        
        return user;
    }
    
    public User register(String username, String email, String password, String fullName) {
        if (userRepository.existsByEmail(email)) {
            throw new RuntimeException("Email already exists");
        }
        
        if (userRepository.existsByUsername(username)) {
            throw new RuntimeException("Username already exists");
        }
        
        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(passwordEncoder.encode(password));
        user.setFullName(fullName);
        user.setRole("USER");
        
        return userRepository.save(user);
    }
}
