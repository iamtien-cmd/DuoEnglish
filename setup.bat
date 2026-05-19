@echo off
echo 🦉 DuoEnglish Setup Script
echo ==========================

echo Checking prerequisites...

where docker >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ Docker is not installed. Please install Docker first.
    exit /b 1
)

where node >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed. Please install Node.js 18+ first.
    exit /b 1
)

where java >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ Java is not installed. Please install Java 17+ first.
    exit /b 1
)

echo ✅ All prerequisites are installed

echo.
echo Starting Docker services (SQL Server ^& Redis)...
docker-compose up -d

echo ⏳ Waiting for services to be ready...
timeout /t 10 /nobreak >nul

echo.
echo Setting up frontend...
cd duoenglish-ui

if not exist ".env" (
    echo Creating .env file...
    copy .env.example .env
)

echo Installing npm dependencies...
call npm install

cd ..

echo.
echo ✅ Setup complete!
echo.
echo To start the application:
echo 1. Backend: mvnw.cmd spring-boot:run
echo 2. Frontend: cd duoenglish-ui ^&^& npm start
echo.
echo Backend will run on: http://localhost:8080
echo Frontend will run on: http://localhost:3000
echo.
echo Docker services:
echo - SQL Server: localhost:1433
echo - Redis: localhost:6379

pause
