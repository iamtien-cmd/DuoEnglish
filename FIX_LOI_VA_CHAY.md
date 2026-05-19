# ✅ ĐÃ SỬA LỖI - HƯỚNG DẪN CHẠY LẠI

## Lỗi Đã Sửa
❌ **Lỗi cũ:** `java.lang.NoClassDefFoundError: JwtAuthenticationFilter`

✅ **Đã tạo:**
- `JwtAuthenticationFilter.java` - Filter để xử lý JWT token
- `CustomUserDetailsService.java` - Load user từ database
- Cập nhật `JwtService.java` - Thêm validation token
- Sửa `SecurityConfig.java` - Cấu hình đúng

---

## CHẠY LẠI BACKEND

### Bước 1: Clean project
```bash
mvnw.cmd clean
```

### Bước 2: Compile lại
```bash
mvnw.cmd compile
```

### Bước 3: Chạy application
```bash
mvnw.cmd spring-boot:run
```

### Bước 4: Đợi thấy
```
Started DuoEnglishApplication in X.XXX seconds
```

---

## HOẶC CHẠY NHANH (1 lệnh)

```bash
mvnw.cmd clean spring-boot:run
```

---

## KIỂM TRA BACKEND ĐÃ CHẠY

Mở trình duyệt: http://localhost:8080

Hoặc dùng curl:
```bash
curl http://localhost:8080/api/auth/login
```

Kết quả mong đợi: `405 Method Not Allowed` (OK - vì thiếu body)

---

## SAU KHI BACKEND CHẠY THÀNH CÔNG

### Chạy Frontend (Terminal mới)
```bash
cd duoenglish-ui
npm start
```

### Test Login
1. Mở http://localhost:3000
2. Click "Register"
3. Điền form và submit
4. Tự động login → Dashboard

---

## NẾU VẪN LỖI

### Lỗi: "Cannot connect to database"
```bash
# Kiểm tra SQL Server đang chạy
# Kiểm tra database english_db đã tạo
```

### Lỗi: "Port 8080 already in use"
```bash
# Tìm và kill process đang dùng port 8080
netstat -ano | findstr :8080
taskkill /PID <PID> /F
```

### Lỗi compile
```bash
# Clean và rebuild
mvnw.cmd clean install -DskipTests
```

---

## CẤU TRÚC ĐÃ TẠO

```
src/main/java/vn/iotstar/
├── config/
│   ├── SecurityConfig.java           ✅ Cấu hình security
│   ├── JwtAuthenticationFilter.java  ✅ JWT filter (MỚI)
│   └── CorsConfig.java               ✅ CORS config
├── service/
│   ├── JwtService.java               ✅ JWT service (ĐÃ CẬP NHẬT)
│   ├── UserService.java              ✅ User service
│   └── CustomUserDetailsService.java ✅ UserDetails (MỚI)
├── entity/
│   └── User.java                     ✅ User entity
├── repository/
│   └── UserRepository.java           ✅ User repository
├── controller/
│   └── LoginController.java          ✅ Auth controller
└── dto/
    ├── LoginRequest.java             ✅ Login DTO
    └── AuthResponse.java             ✅ Response DTO
```

---

## LUỒNG AUTHENTICATION

```
1. User gửi login request
   ↓
2. LoginController nhận request
   ↓
3. UserService kiểm tra email/password
   ↓
4. JwtService tạo token
   ↓
5. Trả về token + user info
   ↓
6. Frontend lưu token vào localStorage
   ↓
7. Các request sau gửi token trong header:
   Authorization: Bearer <token>
   ↓
8. JwtAuthenticationFilter kiểm tra token
   ↓
9. CustomUserDetailsService load user
   ↓
10. Cho phép truy cập nếu token hợp lệ
```

---

## ✅ THÀNH CÔNG KHI

- ✅ Backend chạy không lỗi
- ✅ Thấy log: `Started DuoEnglishApplication`
- ✅ Truy cập http://localhost:8080 không lỗi
- ✅ Frontend kết nối được backend
- ✅ Register/Login thành công

---

## 🚀 BẮT ĐẦU NGAY

```bash
# Terminal 1 - Backend
mvnw.cmd clean spring-boot:run

# Terminal 2 - Frontend (sau khi backend chạy)
cd duoenglish-ui
npm start
```

**Chúc bạn thành công! 🎉**
