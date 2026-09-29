@echo off
cd /d "%~dp0"
echo Installing dependencies (first run only)...
npm install
if errorlevel 1 (
  echo.
  echo Dependency installation failed. Please ensure Node.js 18+ is installed and internet access is available.
  pause
  exit /b 1
)
echo Starting STSetu...
npm run dev
