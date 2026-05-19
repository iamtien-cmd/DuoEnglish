package vn.iotstar.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import vn.iotstar.dto.AuthResponse;
import vn.iotstar.dto.LoginRequest;
import vn.iotstar.entity.User;
import vn.iotstar.service.JwtService;
import vn.iotstar.service.UserService;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:3000")
public class LoginController {
    
    private final UserService userService;
    private final JwtService jwtService;
    
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest request) {
        try {
            User user = userService.login(
                request.getEmail(),
                request.getPassword()
            );
            
            String token = jwtService.generateToken(user.getEmail());
            
            AuthResponse response = new AuthResponse(
                token,
                AuthResponse.UserDTO.fromUser(user)
            );
            
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.badRequest()
                .body(new ErrorResponse(e.getMessage()));
        }
    }
    
    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody RegisterRequest request) {
        try {
            User user = userService.register(
                request.getUsername(),
                request.getEmail(),
                request.getPassword(),
                request.getFullName()
            );
            
            String token = jwtService.generateToken(user.getEmail());
            
            AuthResponse response = new AuthResponse(
                token,
                AuthResponse.UserDTO.fromUser(user)
            );
            
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.badRequest()
                .body(new ErrorResponse(e.getMessage()));
        }
    }
    
    static class RegisterRequest {
        private String username;
        private String email;
        private String password;
        private String fullName;
        
        public String getUsername() { return username; }
        public void setUsername(String username) { this.username = username; }
        
        public String getEmail() { return email; }
        public void setEmail(String email) { this.email = email; }
        
        public String getPassword() { return password; }
        public void setPassword(String password) { this.password = password; }
        
        public String getFullName() { return fullName; }
        public void setFullName(String fullName) { this.fullName = fullName; }
    }
    
    static class ErrorResponse {
        private String message;
        
        public ErrorResponse(String message) {
            this.message = message;
        }
        
        public String getMessage() { return message; }
        public void setMessage(String message) { this.message = message; }
    }
}
