# TEST NGAY - 3 PHÚT

## Bước 1: Tạo Database (30 giây)
Mở SQL Server Management Studio, chạy:
```sql
CREATE DATABASE english_db;
```

## Bước 2: Chạy Backend (1 phút)
Mở Terminal 1:
```bash
mvnw.cmd spring-boot:run
```
Đợi thấy: `Started DuoEnglishApplication`

## Bước 3: Chạy Frontend (1 phút)
Mở Terminal 2:
```bash
cd duoenglish-ui
npm start
```
Trình duyệt tự mở http://localhost:3000

## Bước 4: Test Login (30 giây)

### Cách 1: Tạo user qua SQL
```sql
USE english_db;

INSERT INTO users (username, email, password, full_name, role)
VALUES (
    'admin',
    'admin@test.com',
    '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
    'Admin User',
    'USER'
);
```

Login với:
- Email: `admin@test.com`
- Password: `password123`

### Cách 2: Dùng Register (đơn giản hơn)
1. Click "Register" trên trang login
2. Điền form và submit
3. Tự động login

## ✅ Thành Công Khi:
- Sau khi login, chuyển đến trang Dashboard
- Thấy thông tin user hiển thị
- Không có lỗi trong Console (F12)

## ❌ Nếu Lỗi:
Chạy file `test-connection.bat` để kiểm tra
