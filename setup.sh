#!/bin/bash

echo "🦉 DuoEnglish Setup Script"
echo "=========================="

# Check prerequisites
echo "Checking prerequisites..."

if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker first."
    exit 1
fi

if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 18+ first."
    exit 1
fi

if ! command -v java &> /dev/null; then
    echo "❌ Java is not installed. Please install Java 17+ first."
    exit 1
fi

echo "✅ All prerequisites are installed"

# Start Docker services
echo ""
echo "Starting Docker services (SQL Server & Redis)..."
docker-compose up -d

echo "⏳ Waiting for services to be ready..."
sleep 10

# Setup frontend
echo ""
echo "Setting up frontend..."
cd duoenglish-ui

if [ ! -f ".env" ]; then
    echo "Creating .env file..."
    cp .env.example .env
fi

echo "Installing npm dependencies..."
npm install

echo ""
echo "✅ Setup complete!"
echo ""
echo "To start the application:"
echo "1. Backend: ./mvnw spring-boot:run"
echo "2. Frontend: cd duoenglish-ui && npm start"
echo ""
echo "Backend will run on: http://localhost:8080"
echo "Frontend will run on: http://localhost:3000"
echo ""
echo "Docker services:"
echo "- SQL Server: localhost:1433"
echo "- Redis: localhost:6379"
