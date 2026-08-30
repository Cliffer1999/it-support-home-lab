# Slow Windows PC

## Problem
Windows takes a long time to start, applications respond slowly, or the device feels generally sluggish.

## Quick Checks
1. Restart the device if uptime is unusually long.
2. Open Task Manager and check CPU, memory and disk usage.
3. Check free space on the system drive.
4. Review startup applications.
5. Ask when the problem started and what changed recently.

## Technician Checks

```powershell
Get-CimInstance Win32_OperatingSystem
Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10
```

## Resolution Steps
- Disable approved unnecessary startup applications.
- Close or repair applications consuming abnormal resources.
- Install required Windows updates.
- Free disk space where appropriate.
- Reboot and retest the user's normal workload.

## Escalate When
- storage or memory hardware errors are suspected
- performance remains poor after software causes are isolated
- Event Viewer shows recurring system/hardware faults