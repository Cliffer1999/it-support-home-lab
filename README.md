# IT Support Portfolio

Six hands-on labs covering the core skills I have been building for IT Support / Service Desk roles.

## Completed Projects

### 1. [Windows Server & Active Directory Home Lab](projects/01-active-directory/README.md)
Built a Windows Server lab environment using virtual machines to practise enterprise user and device administration. Configured Active Directory Domain Services, created and managed users and security groups, joined Windows clients to the domain, performed password resets and account unlocks, configured permissions, and tested Group Policy settings.

**Skills:** Active Directory · Windows Server · Group Policy · User Administration · Troubleshooting

### 2. [IT Help Desk & Ticketing System Lab](projects/02-help-desk/README.md)
Set up a simulated help desk environment and resolved common Level 1 support requests including password resets, account lockouts, software issues, printer problems and network connectivity incidents. Recorded troubleshooting steps, resolutions and escalation notes using a structured service desk workflow.

**Skills:** IT Support · Service Desk · Incident Management · Ticketing Systems · Troubleshooting

### 3. [Microsoft 365 & Entra ID Administration Lab](projects/03-m365-entra/README.md)
Practised Microsoft 365 administration across common IT support scenarios, including user creation, licence assignment, password resets, account access and identity management. Worked with Microsoft Entra ID and basic security and access controls.

**Skills:** Microsoft 365 · Microsoft Entra ID · Identity & Access Management · User Administration

### 4. [Network Troubleshooting Lab](projects/04-network-troubleshooting/README.md)
Diagnosed common Windows network connectivity issues involving IP addressing, DNS, DHCP and default gateways. Used `ping`, `ipconfig`, `tracert`, `nslookup` and PowerShell to isolate faults and document resolutions.

**Skills:** TCP/IP · DNS · DHCP · Network Troubleshooting · Windows

### 5. [Windows 11 Endpoint Support Lab](projects/05-windows-11-support/README.md)
Configured and supported Windows 11 virtual machines to practise desktop support tasks including user profile management, software installation, Windows Update, device configuration, security settings and operating system troubleshooting.

**Skills:** Windows 11 · Desktop Support · Endpoint Management · Software Troubleshooting

### 6. [IT Support Knowledge Base](projects/06-knowledge-base/README.md)
Created step-by-step knowledge base articles for common end-user issues including password resets, Microsoft 365 access, Wi-Fi connectivity, DNS troubleshooting, printer issues and Windows performance problems.

**Skills:** Technical Documentation · Knowledge Management · IT Support · Troubleshooting · Customer Support

## Repository Contents

```text
projects/
├── 01-active-directory/
├── 02-help-desk/
├── 03-m365-entra/
├── 04-network-troubleshooting/
├── 05-windows-11-support/
└── 06-knowledge-base/

tickets/     Existing incident records
scripts/     PowerShell diagnostic tools
docs/        Support and escalation notes
```

## PowerShell Tools

- [`Get-SystemHealth.ps1`](scripts/Get-SystemHealth.ps1) — OS, uptime, memory, disk and adapter information
- [`Test-NetworkConnectivity.ps1`](scripts/Test-NetworkConnectivity.ps1) — layered TCP/IP, gateway, internet and DNS testing
- [`Get-UserSupportSnapshot.ps1`](scripts/Get-UserSupportSnapshot.ps1) — compact diagnostic snapshot for ticket escalation

---

**Xitong Wang**  
IT Support / Service Desk Portfolio