@echo off
:: Change directory to user profile
cd %USERPROFILE%
:: This will launch Windows Terminal in administrator mode
powershell -Command "Start-Process wt -Verb RunAs"
:: Create a desktop shortcut to this batch file
powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%USERPROFILE%\acmd.lnk'); $Shortcut.TargetPath = '%~f0'; $Shortcut.WorkingDirectory = '%USERPROFILE%'; $Shortcut.Description = 'Launch Windows Terminal as Administrator'; $Shortcut.Save()"
powershell -Command "$userProfile = $env:USERPROFILE; $path = [Environment]::GetEnvironmentVariable('PATH', 'Machine'); if($path -notlike '*' + $userProfile + '*') { [Environment]::SetEnvironmentVariable('PATH', $path + ';' + $userProfile, 'Machine'); echo 'Added user profile to system PATH.' } else { echo 'User profile is already in system PATH.' }"
echo Shortcut created on Home
echo Assign Keyboard Shortcut
echo To assign a keyboard shortcut to this batch file:
echo 1. Right-click on the acmd.lnk shortcut in your Home folder
echo 2. Select 'Properties'
echo 3. Click in the 'Shortcut key' field
echo 4. Press your desired key combination (e.g., Ctrl+Alt+T)
echo 5. Click 'OK' to save

echo.
echo Use AutoHotkey for System-Wide Hotkey (Optional)
echo For advanced hotkeys using the Windows key or other system combinations:
echo 1. Download and install AutoHotkey from https://www.autohotkey.com/
echo 2. Create an AutoHotkey script (.ahk file) with your desired hotkey
echo 3. Example script to launch this batch file with Win+Alt+T:
echo    #!t::Run, %USERPROFILE%\acmd.lnk
echo 4. Save the script and run it, or add to startup folder for permanent use