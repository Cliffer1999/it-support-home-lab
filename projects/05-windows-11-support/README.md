# Windows 11 Endpoint Support Lab

## Overview

Configured and supported Windows 11 virtual machines to practise desktop support tasks including user profile management, software installation, Windows Update, device configuration, security settings and operating system troubleshooting.

## Tasks Completed

### Local user and profile support
- Created and removed local test users.
- Changed account type where required.
- Tested sign-in with separate user profiles.
- Reviewed profile-specific vs device-wide issues.

Useful commands:

```cmd
whoami
net user
hostname
```

### Software support
Practised:
- installing and uninstalling approved applications
- identifying application version
- closing hung applications with Task Manager
- checking startup behaviour
- repairing/reinstalling software after simpler checks

### Windows Update
- Checked update status.
- Installed available updates.
- Restarted the endpoint when required.
- Reviewed update history when troubleshooting a recent issue.

### Device configuration
Used Windows Settings and Device Manager to inspect:

- network adapters
- audio devices
- display devices
- drivers
- disabled/problem devices

### Performance troubleshooting
Used Task Manager and PowerShell to check:

- CPU usage
- memory pressure
- disk utilisation
- startup applications
- system uptime
- free disk space

The repository includes [`Get-SystemHealth.ps1`](../../scripts/Get-SystemHealth.ps1) for a quick read-only health check.

### Security settings
Reviewed common endpoint controls including:

- Windows Security status
- firewall status
- account permissions
- application permissions
- microphone/camera privacy settings

## Scenarios Completed

### Slow workstation
Identified high startup load and resource usage, disabled approved unnecessary startup items, restarted the endpoint and verified improved performance.

### Teams microphone issue
Confirmed the microphone worked in Windows, then found Teams was using the wrong input device. Selected the correct device and verified it with a test call.

### Application not responding
Used Task Manager and Event Viewer to isolate an application-level fault before repairing/reinstalling the application.

### User-specific issue
Tested the same application under another local profile to determine whether the problem followed the user profile or the whole endpoint.

## Support Principle

I treated the endpoint as layers: **hardware → Windows → user profile → application → account/service**. This made it easier to narrow down the source of a problem instead of making broad changes immediately.

**Skills:** Windows 11 · Desktop Support · Endpoint Management · Device Manager · Windows Update · Software Troubleshooting · PowerShell