@echo off
echo.
echo ========================================
echo    FinSureTech Infrastructure Demo
echo ========================================
echo.
echo Starting FinSureTech Application...
echo.

REM Start the application stack
docker-compose up -d

REM Wait a moment for containers to start
timeout /t 3 /nobreak >nul

REM Check if containers are running
docker-compose ps

echo.
echo ========================================
echo    Opening Application in Browser
echo ========================================
echo.

REM Open the main application
start http://localhost:3001

REM Wait a moment then open monitoring
timeout /t 2 /nobreak >nul
start http://localhost:3000

echo.
echo ========================================
echo    Services Available:
echo ========================================
echo.
echo 🌐 FinSureTech App: http://localhost:3001
echo 🌐 Nginx Proxy:     http://localhost:80
echo 📊 Grafana:         http://localhost:3000
echo 📈 Prometheus:      http://localhost:9090
echo.
echo ========================================
echo    Demo is Ready!
echo ========================================
echo.
pause 