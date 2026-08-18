# Lab Environment

## Scenario

This home lab represents a fictional small business with approximately 50 employees. The Service Desk is the first point of contact for Windows, Microsoft 365, identity, endpoint and basic network incidents.

## Devices and Services

- Windows 10/11 end-user workstations
- Local Windows accounts for hands-on account administration practice
- Microsoft 365 / Entra ID scenarios documented conceptually where a production tenant is not available
- Outlook, Teams and OneDrive
- DHCP-provided IPv4 configuration
- DNS resolution through the local router/ISP
- Wi-Fi and Ethernet connectivity

## Technician Toolset

### Windows
- Settings and Control Panel
- Task Manager
- Event Viewer
- Device Manager
- Services
- Credential Manager

### Command Line
- `ipconfig /all`
- `ping`
- `tracert`
- `nslookup`
- `whoami`
- `net user`
- PowerShell diagnostic commands

## Lab Principles

1. Use fictional data only.
2. Reproduce faults safely where practical.
3. Record expected results and actual results.
4. Prefer reversible troubleshooting steps.
5. Separate observations from assumptions.
6. Verify service restoration before marking an incident resolved.
7. Escalate privileged or infrastructure-level changes instead of bypassing controls.

## Future Expansion

The next lab stage will use virtual machines to simulate Windows Server, Active Directory Domain Services, Group Policy, security groups, mapped drives and domain-joined Windows clients.