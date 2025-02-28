### Description:
This batch script is designed to monitor a USB drive and take a predefined action when the drive is removed. It offers several configurable options for the action to be taken upon removal, such as locking the workstation, shutting down, restarting, or logging off the user. The script also includes password protection, sound alerts, and Windows notifications to inform the user when the USB drive is removed. Additionally, it logs events to a text file, and the logs can be encrypted (or kept plain text).

### Key Features:
- **Password Protection**: Before the script executes, the user must enter a password to start it.
- **Drive Monitoring**: Monitors a specific USB drive (set by `DRIVE_LETTER`).
- **Alerts**: Plays a sound and shows a Windows notification when the USB drive is removed.
- **Logging**: Logs the event of USB drive removal in a text file, with an option to encrypt the logs.
- **Actions**: Configurable actions to take upon USB drive removal, including lock, shutdown, restart, or log off the user.
- **Customizable**: You can easily change the drive letter, action to be taken, sound file, and other settings by editing the script.

### Configuration:
- **`DRIVE_LETTER`**: Specify the drive letter of the USB device to monitor (e.g., `E:\`).
- **`ACTION`**: Choose the action to take when the USB drive is removed. Options: `lock`, `shutdown`, `restart`, `logoff`.
- **`PASSWORD`**: Set a password to restrict access to the script.
- **`SOUND_FILE`**: Path to the sound file that will play when the USB drive is removed (default is the "Windows Exclamation" sound).
- **`ENCRYPT_LOGS`**: Set to `true` to scramble the logs, or `false` to keep them in plain text.

### How to Run:
1. **Save the Script**:
   - Open Notepad and copy the entire script into it.
   - Save the file with a `.bat` extension (e.g., `usb_security.bat`).

2. **Edit Configuration** (Optional):
   - Modify the `DRIVE_LETTER` variable to match the drive letter of the USB you want to monitor.
   - Change the `ACTION` to the desired action you want to take (lock, shutdown, restart, or logoff).
   - Optionally, set a password by modifying the `PASSWORD` variable.
   - Change the `SOUND_FILE` to a valid sound file path if you prefer a custom sound.

3. **Run the Script**:
   - Double-click the saved `.bat` file to run the script.
   - You will be prompted to enter the password. If the password is correct, the script will start monitoring the USB drive.
   - If the specified USB drive is removed, the script will perform the configured action and log the event.

4. **Exit**: 
   - The script will stop running once the action is executed, and it will exit automatically.

### Example Usage:
- If you set `DRIVE_LETTER=E:\` and `ACTION=lock`, the script will monitor the E:\ drive. If the USB drive is removed, your computer will automatically lock, and the event will be logged with a notification and sound alert.
