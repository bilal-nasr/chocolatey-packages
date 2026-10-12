$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$exePath  = Join-Path $toolsDir 'LanWifiManager.exe'

# Versioned release URL (not /releases/latest/), so the checksum below always matches.
# 64-bit only: there is no 32-bit url, so `choco install --x86` is not supported.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath   = $exePath
  url64bit       = 'https://github.com/bilal-nasr/lan-wifi-manager/releases/download/v2.3.0/LanWifiManager.exe'
  checksum64     = 'fa9191ae6f56d038ee2368049e338accef0374c1df7a6d3da1d84f94e40a7ded'
  checksumType64 = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

# The exe is a GUI app: an empty .gui file makes Chocolatey's shim start it without waiting on the console.
New-Item -ItemType File -Path "$exePath.gui" -Force | Out-Null

# No Start menu shortcut here on purpose: the app creates its own per-user
# "LAN Wi-Fi Manager" shortcut the first time it runs (Settings: "Show in the Start menu
# and Windows search", on by default). A second one from this package would show up twice.
Write-Host 'LAN Wi-Fi Manager is installed. Start it once with the LanWifiManager command; it asks for administrator rights (UAC) and then adds its own Start menu shortcut.'
