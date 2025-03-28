@echo off
echo Initializing Git repository and connecting to GitHub...

git init
git add .
git commit -m "Initial commit"
gh repo create Admin-Terminal-Launcher --public --source=. --remote=origin --push
gh repo view --web

echo Repository setup complete!
pause
