# Chocolatey packages

Source of the [Chocolatey](https://chocolatey.org) package for [LAN Wi-Fi Manager](https://github.com/bilal-nasr/lan-wifi-manager).

| Package | Folder |
| --- | --- |
| `lan-wifi-manager` | [`lan-wifi-manager/`](lan-wifi-manager/) |

The package downloads `LanWifiManager.exe` from the versioned GitHub release and checks its SHA-256 checksum; the exe is not embedded in the package.

```powershell
choco install lan-wifi-manager
```

Questions and bugs: please use the app's [issues page](https://github.com/bilal-nasr/lan-wifi-manager/issues).
