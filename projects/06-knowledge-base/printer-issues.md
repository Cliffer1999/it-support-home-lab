# Printer Troubleshooting

## Problem
Printer appears offline, print jobs remain queued, or the user cannot print.

## Quick Checks
1. Confirm the correct printer is selected.
2. Check whether the problem affects one user or multiple users.
3. Verify the printer is powered on and reachable.
4. Check the Windows print queue for stuck jobs.

## Technician Checks

```powershell
Get-Printer
Get-PrintJob
Get-Service Spooler
```

If the spooler is stuck and restart is appropriate:

```powershell
Restart-Service Spooler
```

## Resolution Steps
- Clear failed/stuck jobs where appropriate.
- Restart the Print Spooler service.
- Remove and re-add the approved printer connection if required.
- Print a Windows test page.

## Escalate When
- the printer is unreachable for multiple users
- the device reports a hardware fault
- print-server or driver deployment issues are suspected