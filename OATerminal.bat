@echo off
:: Change directory to user profile
cd %USERPROFILE%
:: This will launch Windows Terminal in administrator mode
powershell -Command "Start-Process wt -Verb RunAs"
:: Create a desktop shortcut to this batch file
powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%USERPROFILE%\RunTerminalAsAdmin.lnk'); $Shortcut.TargetPath = '%~f0'; $Shortcut.WorkingDirectory = '%USERPROFILE%'; $Shortcut.Description = 'Launch Windows Terminal as Administrator'; $Shortcut.Save()"
echo Shortcut created on Home