@echo off
echo Starting DuoEnglish Development Environment...

echo.
echo [1/3] Starting Backend (Spring Boot)...
start "DuoEnglish Backend" cmd /k "mvnw.cmd spring-boot:run"

timeout /t 5 /nobreak > nul

echo.
echo [2/3] Starting Frontend (React)...
start "DuoEnglish Frontend" cmd /k "cd duoenglish-ui && npm start"

echo.
echo [3/3] Done!
echo.
echo Backend: http://localhost:8080
echo Frontend: http://localhost:3000
echo.
pause
