$ErrorActionPreference = 'Stop'

# Chocolatey runs this before both upgrade and uninstall.
# Ask the user to quit instead of killing the process: on a normal quit the app gives the
# network priority back to Windows, and a forced stop would skip that. A running app also
# keeps LanWifiManager.exe locked, so an upgrade could not replace it.
if (Get-Process -Name 'LanWifiManager' -ErrorAction SilentlyContinue) {
  throw 'LAN Wi-Fi Manager is running. Quit it from its tray icon (so it gives the network priority back to Windows), then run the command again.'
}
