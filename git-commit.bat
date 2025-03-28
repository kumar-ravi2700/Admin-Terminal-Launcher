@echo off
echo Git Commit Helper

REM Check if a commit message was provided
if "%~1"=="" (
    echo Please provide a commit message
    echo Usage: git-commit "Your commit message"
    exit /b 1
)

REM Add all changes
git add .

REM Commit with the provided message
git commit -m "%~1"

REM Push to GitHub
git push

echo Commit and push completed successfully!
pause
