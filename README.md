# IT Support Home Lab

A hands-on portfolio project that simulates common Level 1 / Service Desk responsibilities in a small Windows-based business environment.

The lab focuses on practical troubleshooting, user support, Windows administration, networking, Microsoft 365 scenarios, PowerShell automation, ticket documentation, and escalation decisions.

## Project Goals

- Demonstrate a structured troubleshooting process instead of random trial-and-error.
- Practise common Level 1 support scenarios seen in Service Desk environments.
- Build confidence with Windows, TCP/IP networking, user accounts, Microsoft 365 and PowerShell.
- Document incidents in a way that another technician can reproduce and understand.
- Show when an issue should be resolved at L1 and when it should be escalated.

## Simulated Environment

| Component | Lab Setup |
|---|---|
| End-user OS | Windows 10 / Windows 11 |
| Identity | Local users + Microsoft 365 / Entra ID concepts |
| Productivity | Microsoft 365, Outlook, Teams, OneDrive |
| Networking | Home router used to simulate office LAN, DHCP and DNS |
| Support tools | Windows Settings, Event Viewer, Task Manager, Device Manager, Services, CMD, PowerShell |
| Ticket workflow | Incident logging, priority, diagnosis, resolution, escalation and closure notes |

> This repository is a simulated home lab. User names, company names, devices and tickets are fictional and contain no real customer data.

## Repository Structure

```text
it-support-home-lab/
├── README.md
├── docs/
│   ├── lab-environment.md
│   ├── troubleshooting-method.md
│   ├── microsoft-365-playbook.md
│   └── escalation-matrix.md
├── tickets/
│   ├── INC-001-password-lockout.md
│   ├── INC-002-no-internet.md
│   ├── INC-003-outlook-not-syncing.md
│   ├── INC-004-slow-windows-pc.md
│   ├── INC-005-shared-drive-access.md
│   └── INC-006-teams-microphone.md
└── scripts/
    ├── Get-SystemHealth.ps1
    ├── Test-NetworkConnectivity.ps1
    └── Get-UserSupportSnapshot.ps1
```

## Troubleshooting Workflow

I use the same basic process for each incident:

1. **Confirm impact** — who is affected, what is failing, and when it started.
2. **Collect evidence** — error messages, recent changes, device/network state and logs.
3. **Form a hypothesis** — identify the most likely cause before changing anything.
4. **Test safely** — start with low-risk checks and reversible changes.
5. **Verify the fix** — confirm the original task works from the user's perspective.
6. **Document** — record symptoms, actions, root cause and final outcome.
7. **Escalate when required** — provide the next team with useful evidence rather than simply forwarding the ticket.

More detail: [Troubleshooting Method](docs/troubleshooting-method.md)

## Incident Portfolio

| Ticket | Scenario | Skills Demonstrated | Outcome |
|---|---|---|---|
| [INC-001](tickets/INC-001-password-lockout.md) | User cannot sign in | Identity, account lockout, verification | Resolved at L1 |
| [INC-002](tickets/INC-002-no-internet.md) | Laptop has no internet | DHCP, DNS, TCP/IP, `ipconfig`, `ping` | Resolved at L1 |
| [INC-003](tickets/INC-003-outlook-not-syncing.md) | Outlook stops receiving mail | Outlook, connectivity, profile/cache checks | Resolved at L1 |
| [INC-004](tickets/INC-004-slow-windows-pc.md) | Windows PC is very slow | Task Manager, startup apps, disk/RAM checks | Resolved at L1 |
| [INC-005](tickets/INC-005-shared-drive-access.md) | Shared drive access denied | Permissions, scope analysis, escalation | Escalated with evidence |
| [INC-006](tickets/INC-006-teams-microphone.md) | Microphone fails in Teams | Windows privacy, device selection, Teams | Resolved at L1 |

## PowerShell Toolkit

### `Get-SystemHealth.ps1`
Collects common first-line information including Windows version, uptime, CPU, RAM, disk space and network adapter state.

### `Test-NetworkConnectivity.ps1`
Tests the local TCP/IP stack, default gateway, external IP connectivity and DNS resolution to help isolate network faults.

### `Get-UserSupportSnapshot.ps1`
Creates a compact support snapshot containing logged-on user, hostname, IP configuration, DNS servers and recent system errors.

Run scripts from PowerShell:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\scripts\Get-SystemHealth.ps1
.\scripts\Test-NetworkConnectivity.ps1
.\scripts\Get-UserSupportSnapshot.ps1
```

## Microsoft 365 Scenarios

The [Microsoft 365 Support Playbook](docs/microsoft-365-playbook.md) covers first-line checks for:

- Outlook sign-in and sync issues
- Teams audio/video issues
- OneDrive sync problems
- Licensing symptoms
- MFA and sign-in problems
- When to escalate to a Microsoft 365 / identity administrator

## What This Project Demonstrates

**Technical:** Windows 10/11, TCP/IP, DNS, DHCP, Microsoft 365 troubleshooting, account support, PowerShell and incident diagnosis.

**Service Desk:** ticket ownership, user communication, prioritisation, documentation, verification, knowledge-base thinking and evidence-based escalation.

**Professional approach:** I avoid making high-impact changes without evidence, protect user data, document what I changed and confirm service restoration before closing an incident.

## Next Improvements

- Add a Windows Server / Active Directory virtual lab.
- Add Group Policy and mapped-drive scenarios.
- Add Microsoft Intune device-management scenarios.
- Add a lightweight ticket analytics dashboard.
- Expand the PowerShell toolkit with safe remote-support diagnostics.

---

**Portfolio project by Xitong Wang**  
Built to demonstrate practical entry-level IT Support / Service Desk capability.