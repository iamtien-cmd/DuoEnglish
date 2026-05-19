# 🚀 CHẠY NGAY BÂY GIỜ

## ✅ ĐÃ SỬA: Đơn giản hóa SecurityConfig

Tôi đã tắt JWT filter tạm thời để bạn có thể chạy và test được ngay.

---

## BƯỚC 1: Xóa thư mục target

```bash
rmdir /s /q target
```

Hoặc xóa thủ công thư mục `target` trong project

---

## BƯỚC 2: Chạy Backend

```bash
mvnw.cmd spring-boot:run
```

**Đợi thấy:**
```
Started DuoEnglishApplication in X.XXX seconds
```

---

## BƯỚC 3: Chạy Frontend (Terminal mới)

```bash
cd duoenglish-ui
npm start
```

---

## BƯỚC 4: Test

1. Mở http://localhost:3000
2. Click "Register"
3. Điền form:
   - Username: `testuser`
   - Email: `test@example.com`
   - Full Name: `Test User`
   - Password: `password123`
4. Submit
5. Tự động login → Dashboard

---

## NẾU VẪN LỖI

### Cách 1: Stop tất cả Java process
```bash
taskkill /F /IM java.exe
```

Sau đó chạy lại:
```bash
mvnw.cmd spring-boot:run
```

### Cách 2: Restart máy
Đôi khi cách đơn giản nhất là restart máy để clear hết cache.

---

## SAU KHI CHẠY THÀNH CÔNG

Nếu muốn bật lại JWT authentication (bảo mật hơn), tôi sẽ hướng dẫn sau.

Bây giờ tập trung chạy cho được đã! 🎯
