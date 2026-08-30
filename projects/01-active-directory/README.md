# Windows Server & Active Directory Home Lab

![Windows Server](https://img.shields.io/badge/Windows%20Server-AD%20DS-0078D4)
![Active Directory](https://img.shields.io/badge/Active%20Directory-Users%20%7C%20Groups-5C2D91)
![Group Policy](https://img.shields.io/badge/Group%20Policy-GPO-2F81F7)

## Overview

Built a Windows Server domain environment to practise the administration tasks commonly handled by IT Support teams: creating users, managing group membership, joining endpoints to a domain, resetting passwords, unlocking accounts, controlling shared-folder access and applying Group Policy.

## Environment

| Component | Configuration |
|---|---|
| Domain controller | `DC01` |
| Windows client | `CLIENT01` |
| Domain | `xitonglab.local` |
| Server roles | Active Directory Domain Services, DNS |
| Administration | ADUC, Group Policy Management, PowerShell |

## Active Directory Structure

```text
xitonglab.local
└── XitongLab
    ├── Users
    │   ├── Finance
    │   └── Operations
    ├── Workstations
    └── Servers
```

Test accounts included:

- Amy Chen — Finance
- Daniel Lee — Operations
- Emma Wang — Operations

Security groups included:

- `GG_Finance_Users`
- `GG_Operations_Users`
- `GG_Finance_Share_RW`

## Administration Tasks

### Domain setup

Installed Active Directory Domain Services, promoted `DC01` to a domain controller and created the `xitonglab.local` domain. DNS was configured with the domain controller so the Windows client could locate AD services correctly.

### User and group management

Created departmental OUs, test users and security groups. Practised password resets, forcing password change at next sign-in, enabling/disabling accounts, unlocking accounts and changing group membership.

### Windows domain join

Configured `CLIENT01` to use the domain controller for DNS, joined the machine to `xitonglab.local`, restarted it and verified sign-in with a domain user.

Useful checks:

```cmd
whoami
systeminfo | findstr /B /C:"Domain"
ipconfig /all
```

### Shared-folder permissions

Created a Finance share and assigned access through security groups rather than adding permissions directly to individual users.

```text
GG_Finance_Share_RW -> Finance Share -> Modify
IT Support          -> Finance Share -> Full Control
```

Tested access using users with and without the appropriate group membership.

### Group Policy

Created and applied Group Policy settings to the Windows client and checked policy processing with:

```cmd
gpupdate /force
gpresult /r
gpresult /h gp-report.html
```

## PowerShell Administration

Used the Active Directory module for common administration and verification tasks:

```powershell
Get-ADUser -Filter *
Get-ADGroup -Filter *
Get-ADComputer -Filter *
Unlock-ADAccount
Set-ADAccountPassword
Add-ADGroupMember
```

I also created two scripts to speed up repeatable lab setup:

- [`New-LabStructure.ps1`](scripts/New-LabStructure.ps1) — creates the OU and security-group structure
- [`New-LabUsers.ps1`](scripts/New-LabUsers.ps1) — creates departmental test users and requires a temporary password at runtime

## Troubleshooting Scenarios

- Incorrect DNS prevented the Windows client from locating domain services.
- A locked user account required an unlock/password support workflow.
- A Finance share access issue was traced through group membership and permissions.
- Group Policy application was checked through connectivity, scope and `gpresult` output.

## Key Takeaway

The useful part of this lab was seeing how connected the components are. A sign-in or file-access issue is not automatically an "Active Directory problem" — DNS, group membership, permissions and Group Policy scope can all produce similar symptoms, so I worked through them systematically instead of jumping straight to an account change.

**Skills:** Active Directory · Windows Server · Group Policy · DNS · User Administration · Permissions · PowerShell · Troubleshooting