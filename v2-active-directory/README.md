# V2 — Active Directory Home Lab

This is the next stage of the project. The goal is to move from written support scenarios into a small Windows domain that I can actually administer and troubleshoot.

## Target topology

```text
Internet
   |
Home Router
   |
Virtual Network
   |-----------------------|
   |                       |
DC01                    CLIENT01
Windows Server          Windows 11
AD DS + DNS             Domain joined
```

Planned domain: `xitonglab.local`

## Machines

### DC01

- Windows Server 2022 or later evaluation VM
- Hostname: `DC01`
- Static IPv4 address inside the lab network
- Roles: Active Directory Domain Services + DNS

### CLIENT01

- Windows 11 VM
- Hostname: `CLIENT01`
- DNS should point to DC01 once the domain is available
- Joined to `xitonglab.local`

## Build order

### 1. Create the two VMs

Record CPU, RAM and disk configuration here after creation.

**Status:** Not yet verified on hardware.

### 2. Configure DC01 networking

Before promoting the server, assign a stable IPv4 configuration. The exact subnet depends on the hypervisor/network selected.

Evidence to capture:

```powershell
Get-NetIPConfiguration
ipconfig /all
```

### 3. Install AD DS

GUI path:

`Server Manager -> Add Roles and Features -> Active Directory Domain Services`

Possible PowerShell equivalent:

```powershell
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
```

Do not mark this complete until the command/GUI action has actually been run in the VM.

### 4. Create the forest

Target lab domain:

```text
xitonglab.local
```

After promotion and reboot, verify:

```powershell
Get-ADDomain
Get-ADForest
Get-Service DNS,NTDS
```

### 5. Create a small company structure

Planned OUs:

```text
XitongLab
├── Users
│   ├── Finance
│   └── Operations
├── Workstations
└── Servers
```

Planned test users:

- Amy Chen — Finance
- Daniel Lee — Operations
- Emma Wang — Operations

Planned groups:

- `GG_Finance_Users`
- `GG_Operations_Users`
- `GG_Finance_Share_RW`

Names are fictional.

### 6. Join CLIENT01 to the domain

Key thing to verify first: CLIENT01 must use DC01 as its DNS server. If DNS is wrong, domain join is expected to fail or behave inconsistently.

After joining and rebooting, capture:

```cmd
whoami
systeminfo | findstr /B /C:"Domain"
ipconfig /all
```

### 7. Account support test

Use a test user to reproduce a locked-account / password-reset workflow.

Evidence to collect:

```powershell
Get-ADUser <username> -Properties LockedOut,Enabled,PasswordLastSet
```

Then document exactly what I did to unlock/reset the test account.

### 8. Shared drive permissions test

Create a Finance share and control access through an AD security group instead of granting permissions directly to individual users.

Test cases:

- Finance user: should access
- Operations user: should be denied
- Add Operations test user to approved group: retest after group membership refresh/sign-in

### 9. Group Policy test

Start with one obvious, harmless policy so the result is easy to prove, for example a desktop/control-panel setting applied only to the Workstations OU.

Useful commands:

```cmd
gpupdate /force
gpresult /r
gpresult /h gp-report.html
```

### 10. Break something on purpose

The final V2 exercise should be a fault that I create intentionally and then troubleshoot without immediately looking at the answer.

Current idea: configure CLIENT01 with incorrect DNS and record why domain resources stop working, then fix it and document the evidence.

## Evidence folder

Screenshots and real outputs will go under:

```text
v2-active-directory/evidence/
```

I will not add fake screenshots or fabricated command output. Until the VM steps are run, this document is the build plan rather than proof of completion.