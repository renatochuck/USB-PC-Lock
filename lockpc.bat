@echo off
:: Configurable settings
set DRIVE_LETTER=E:\
set ACTION=lock       :: Options: lock, shutdown, restart, logoff
set LOG_FILE=%~dp0USB_Security_Log.txt
set PASSWORD=secure123    :: Optional password to run the script
set SOUND_FILE=%SystemRoot%\Media\Windows Exclamation.wav
set ENCRYPT_LOGS=true      :: true = scramble logs, false = plain text

:: Password protection
set /p USER_PASS=Enter password to start: 
if not "%USER_PASS%"=="%PASSWORD%" (
    echo Incorrect password! Exiting...
    exit
)

:: Initial drive check
if not exist %DRIVE_LETTER% (
    echo [%DATE% %TIME%] WARNING: USB drive %DRIVE_LETTER% not found.
    set /p CONTINUE=Continue monitoring anyway? (Y/N): 
    if /I not "%CONTINUE%"=="Y" exit
)

echo [%DATE% %TIME%] USB drive %DRIVE_LETTER% detected. Monitoring started. >> %LOG_FILE%

:loop
if exist %DRIVE_LETTER% (
    timeout /t 5 > nul
    goto loop
) else (
    echo [%DATE% %TIME%] ALERT: USB drive %DRIVE_LETTER% removed! >> %LOG_FILE%

    :: Play sound alert
    powershell -c (New-Object Media.SoundPlayer "%SOUND_FILE%").PlaySync();

    :: Windows notification
    powershell -c [Windows.UI.Notifications.ToastNotificationManager,Windows.UI.Notifications,ContentType=WindowsRuntime];$template=[Windows.UI.Notifications.ToastTemplateType]::ToastText01;$toastXml=[Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent($template);$toastXml.GetElementsByTagName("text").Item(0).AppendChild($toastXml.CreateTextNode("ALERT: USB drive removed!"));$toast=[Windows.UI.Notifications.ToastNotification]::new($toastXml);[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("USB Security").Show($toast);

    :: Execute the action
    if "%ACTION%"=="lock" (
        rundll32.exe user32.dll,LockWorkStation
    ) else if "%ACTION%"=="shutdown" (
        shutdown /s /f /t 0
    ) else if "%ACTION%"=="restart" (
        shutdown /r /f /t 0
    ) else if "%ACTION%"=="logoff" (
        shutdown /l /f
    ) else (
        echo [%DATE% %TIME%] ERROR: Invalid action configured. >> %LOG_FILE%
    )

    exit
)
