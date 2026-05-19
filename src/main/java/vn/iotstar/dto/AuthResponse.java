package vn.iotstar.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import vn.iotstar.entity.User;

@Data
@AllArgsConstructor
public class AuthResponse {
    private String token;
    private UserDTO user;
    
    @Data
    @AllArgsConstructor
    public static class UserDTO {
        private Long id;
        private String username;
        private String email;
        private String fullName;
        private String role;
        
        public static UserDTO fromUser(User user) {
            return new UserDTO(
                user.getId(),
                user.getUsername(),
                user.getEmail(),
                user.getFullName(),
                user.getRole()
            );
        }
    }
}
