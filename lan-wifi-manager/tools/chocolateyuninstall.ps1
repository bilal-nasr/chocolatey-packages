$ErrorActionPreference = 'Stop'

# The "is the app running" check lives in chocolateyBeforeModify.ps1, which Chocolatey runs
# before this script (and before upgrades).
# Chocolatey deletes the package folder (and the exe in it) by itself.

# The app makes its own per-user Start menu shortcut. Remove it so it doesn't point at a
# deleted exe. This finds it for the user running the uninstall; other users who started
# the app keep theirs (see the message below).
$shortcut = Join-Path ([Environment]::GetFolderPath('Programs')) 'LAN Wi-Fi Manager.lnk'
if (Test-Path $shortcut) { Remove-Item $shortcut -Force }

# Left in place on purpose: %AppData%\LanWifiManager (the user's settings and logs) and the
# app's own "Start with Windows" task, which belongs to the app, not to this package.
Write-Host 'Settings and logs in %AppData%\LanWifiManager were kept. If the app was set to start with Windows, delete the "LanWifiManager" task in Task Scheduler. If another Windows user also ran the app, delete "LAN Wi-Fi Manager.lnk" from their Start menu Programs folder.'
