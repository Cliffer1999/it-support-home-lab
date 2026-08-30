# Lab Environment

## Scenario

This home lab represents a small business environment supported by a Level 1 / Service Desk function. The environment covers Windows endpoints, Windows Server, Active Directory, Microsoft 365, identity, networking and common desktop-support scenarios.

## Core Environment

- Windows Server domain controller: `DC01`
- Windows client: `CLIENT01`
- Active Directory domain: `xitonglab.local`
- Active Directory Domain Services and DNS
- Organisational Units for users, computers and departments
- Security groups for role-based access
- Shared folders with NTFS/share permissions
- Group Policy applied to domain-joined clients
- Windows 11 endpoint administration
- Microsoft 365 and Entra ID administration scenarios
- DHCP-based client networking and DNS troubleshooting

## Technician Toolset

### Windows Administration
- Server Manager
- Active Directory Users and Computers
- Group Policy Management
- Windows Settings / Control Panel
- Task Manager
- Event Viewer
- Device Manager
- Services
- Credential Manager

### Command Line / PowerShell
- `ipconfig /all`
- `ping`
- `tracert`
- `nslookup`
- `whoami`
- `gpupdate /force`
- `gpresult /r`
- `Get-ADUser`
- `Get-ADGroup`
- `Get-NetIPConfiguration`
- custom support diagnostic scripts in `/scripts`

## Administration Tasks Completed

- Installed and configured Active Directory Domain Services.
- Created users, OUs and security groups.
- Joined a Windows 11 workstation to the domain.
- Managed passwords, locked accounts and group membership.
- Configured department-based shared-folder access.
- Tested Group Policy processing on the client.
- Diagnosed DNS and general Windows network connectivity issues.
- Completed Windows 11 endpoint-support scenarios.
- Documented incidents using Level 1 troubleshooting and escalation notes.

## Lab Approach

The environment is deliberately small so individual problems can be isolated quickly. I used it to practise the relationship between identity, DNS, permissions, endpoint configuration and user-facing symptoms rather than treating each support issue as a separate topic.