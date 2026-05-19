@echo off
echo ========================================
echo   KIEM TRA KET NOI DUOENGLISH
echo ========================================
echo.

echo [1] Kiem tra Backend (port 8080)...
curl -s http://localhost:8080/api/auth/login > nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Backend dang chay tai http://localhost:8080
) else (
    echo [FAIL] Backend chua chay hoac loi
    echo        Chay: mvnw.cmd spring-boot:run
)

echo.
echo [2] Kiem tra Frontend (port 3000)...
curl -s http://localhost:3000 > nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Frontend dang chay tai http://localhost:3000
) else (
    echo [FAIL] Frontend chua chay hoac loi
    echo        Chay: cd duoenglish-ui ^&^& npm start
)

echo.
echo [3] Kiem tra file .env...
if exist "duoenglish-ui\.env" (
    echo [OK] File .env ton tai
    type duoenglish-ui\.env
) else (
    echo [FAIL] File .env khong ton tai
    echo        Tao file duoenglish-ui\.env voi noi dung:
    echo        REACT_APP_API_URL=http://localhost:8080
)

echo.
echo ========================================
echo   KET THUC KIEM TRA
echo ========================================
pause
