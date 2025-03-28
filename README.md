# Windows Terminal - Run As Administrator

A simple utility to launch Windows Terminal with administrator privileges.

## Contents

- `OATerminal.bat` - Batch script that launches Windows Terminal as administrator

## How It Works

The batch file uses PowerShell to start Windows Terminal with elevated privileges:

```bat
@echo off
:: Change directory to user profile
cd %USERPROFILE%
:: This will launch Windows Terminal in administrator mode
powershell -Command "Start-Process wt -Verb RunAs"
```

## Usage

### Direct Use
- Double-click the `OATerminal.bat` file.
- Approve the UAC prompt that appears.

### Creating a Shortcut (Recommended)

1. Right-click on `OATerminal.bat` and select "Create shortcut".
2. Right-click the new shortcut and select "Properties".
3. (Optional) Change the icon:
   - Click "Change Icon".
   - Browse to `%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe` for a PowerShell icon.
   - Or browse to the Windows Terminal executable for its icon.
4. (Optional) Set a keyboard shortcut:
   - In the Shortcut tab, click in the "Shortcut key" field.
   - Press your desired key combination (e.g., Ctrl+Alt+T).
5. Click "Apply" then "OK".

### Adding to Path Environment Variable

If you want to run the batch file from anywhere using Command Prompt:

1. **Add the Directory to the Path Variable**:
   - Press **Win + S** and search for "Environment Variables".
   - Select **Edit the system environment variables**.
   - In the **System Properties** window, click **Environment Variables**.
   - Under **System variables**, locate `Path` and click **Edit**.
   - Click **New** and enter the directory where your batch file is located (e.g., `d:\DEV-Personal\WindowTerminal\RunAsAdmin`).
   - Click **OK** to save changes.

2. **Run the Batch File from Anywhere**:
   - Open Command Prompt.
   - Simply type the name of your batch file (e.g., `OATerminal`) and hit **Enter**.
   - It will execute the batch file regardless of your current directory.

### Using AutoHotkey for Custom Shortcuts

For custom system-wide shortcuts (like Win+T):
1. Install **AutoHotkey** if you don't have it.
2. Create an AutoHotkey script with content:
   ```ahk
   #t::Run, "%USERPROFILE%\RunTerminalAsAdmin.lnk", , RunAs
   ```
3. Save the script and run it.
4. To make it start automatically with Windows, place a shortcut to the script in your Startup folder.

## Notes

- A UAC prompt will always appear when launching.
- The batch file must remain in the same location for the shortcut to work.
- The script changes the working directory to %USERPROFILE% before launching Windows Terminal.
- The batch file automatically creates a shortcut on your home path.
