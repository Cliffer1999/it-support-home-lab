# Windows Server & Active Directory Home Lab

## Overview

Built a Windows Server lab environment using virtual machines to practise enterprise user and device administration. Configured Active Directory Domain Services, created and managed users and security groups, joined Windows clients to the domain, performed password resets and account unlocks, configured permissions, and tested Group Policy settings.

## Lab Environment

- Windows Server domain controller: `DC01`
- Windows client: `CLIENT01`
- Domain: `xitonglab.local`
- Active Directory Domain Services
- DNS
- Group Policy Management
- Shared folders and NTFS permissions

## Tasks Completed

### Active Directory setup
- Installed the Active Directory Domain Services role.
- Promoted `DC01` to a domain controller.
- Created the `xitonglab.local` forest/domain.
- Verified DNS integration with Active Directory.

### Users and organisational structure
Created departmental OUs and test accounts representing a small company environment.

Example structure:

```text
xitonglab.local
├── Users
│   ├── Finance
│   ├── HR
│   └── IT
├── Groups
└── Computers
```

Created users including:
- Amy Chen
- Daniel Lee
- Emma Wilson

Created security groups including:
- Finance Users
- HR Users
- IT Support

### Domain join
Joined `CLIENT01` to `xitonglab.local` and verified domain user sign-in.

### Account administration
Practised:
- password resets
- password change at next logon
- account disable/enable
- account unlock
- group membership changes

### Permissions
Created a shared folder and assigned access using security groups rather than individual user permissions.

Example:

```text
Finance Users -> Finance Share -> Modify
IT Support    -> Finance Share -> Full Control
```

### Group Policy
Created and tested Group Policy settings in the lab, including user/computer configuration changes applied to the Windows client.

Used:

```cmd
gpupdate /force
gpresult /r
```

## PowerShell Practice

Used Active Directory PowerShell commands to query and manage objects.

```powershell
Get-ADUser -Filter *
Get-ADGroup -Filter *
Get-ADComputer -Filter *
Unlock-ADAccount
Set-ADAccountPassword
Add-ADGroupMember
```

## Troubleshooting Scenarios

Worked through common support scenarios:

1. User forgot password.
2. User account became locked after failed sign-in attempts.
3. User could sign in but could not access a department share.
4. Client could not locate the domain because DNS was incorrect.
5. Group Policy did not apply until connectivity/DNS and policy refresh were checked.

## What I Learned

The most important takeaway was how tightly Active Directory, DNS, security groups and Group Policy work together. A problem that looks like an account or permissions issue can actually be caused by DNS, group membership, cached credentials or policy scope.

**Skills:** Active Directory · Windows Server · Group Policy · User Administration · DNS · Permissions · Troubleshooting