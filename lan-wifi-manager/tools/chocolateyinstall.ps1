$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$exePath  = Join-Path $toolsDir 'LanWifiManager.exe'

# Versioned release URL (not /releases/latest/), so the checksum below always matches.
# 64-bit only: there is no 32-bit url, so `choco install --x86` is not supported.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath   = $exePath
  url64bit       = 'https://github.com/bilal-nasr/lan-wifi-manager/releases/download/v2.5.0/LanWifiManager.exe'
  checksum64     = '26f33588bc537967490605a9f128d17eb2ed66a4d5c36684bf76a361d70603c8'
  checksumType64 = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

# The exe is a GUI app: an empty .gui file makes Chocolatey's shim start it without waiting on the console.
New-Item -ItemType File -Path "$exePath.gui" -Force | Out-Null

# No Start menu shortcut here on purpose: the app creates its own per-user
# "LAN Wi-Fi Manager" shortcut the first time it runs (Settings: "Show in the Start menu
# and Windows search", on by default). A second one from this package would show up twice.
Write-Host 'LAN Wi-Fi Manager is installed. Start it once with the LanWifiManager command; it asks for administrator rights (UAC) and then adds its own Start menu shortcut.'
