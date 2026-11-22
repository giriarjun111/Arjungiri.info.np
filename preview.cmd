@echo off
REM ---------------------------------------------------------------------------
REM  Preview arjungiri.info.np locally.
REM  Starts a tiny web server in this folder and opens the site, so folder URLs
REM  like /digital-painting/ and /digital-painting-blog/ work exactly as they do
REM  on Netlify. Close the minimized "site" window to stop the server.
REM ---------------------------------------------------------------------------
cd /d "%~dp0"

where python >nul 2>nul
if errorlevel 1 (
  echo Python was not found on PATH.
  echo Install Python, or open the pages directly, e.g.
  echo   digital-painting\index.html
  pause
  exit /b 1
)

start "site" /min cmd /c "python -m http.server 8000"
timeout /t 2 >nul
start "" "http://localhost:8000/"
