@echo off
REM Start server: try Python, else Node
setlocal

echo Starting local server...

where python >nul 2>&1
if %ERRORLEVEL%==0 (
  echo Found python, starting server.py
  python "%~dp0server.py"
  goto :eof
)

where py >nul 2>&1
if %ERRORLEVEL%==0 (
  echo Found py launcher, starting server.py
  py "%~dp0server.py"
  goto :eof
)

where node >nul 2>&1
if %ERRORLEVEL%==0 (
  echo Python not found; using Node to serve files
  node "%~dp0serve.js"
  goto :eof
)

echo Neither python nor node found in PATH. Please install one of them.
pause
@echo off
echo Starting local HTTP server...
echo Open http://localhost:8000 in your browser
echo Press Ctrl+C to stop the server
python server.py
pause
