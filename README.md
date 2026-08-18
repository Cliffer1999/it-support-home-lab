# IT Support Home Lab

I started this repo to practise the kind of problems I would expect to see on a Level 1 Service Desk: Windows issues, basic networking, account access, Microsoft 365 problems and simple PowerShell diagnostics.

The first version was mostly structured notes. I'm now turning it into a more hands-on lab with Windows virtual machines and Active Directory so I can document what I actually configure, break and fix.

> This is a learning lab, not production work experience. Any users, devices and tickets in this repo are fictional.

## What I'm working on now

### V2 — Windows Server + Active Directory lab

Current build plan:

- [ ] Create a Windows Server VM
- [ ] Create a Windows 11 client VM
- [ ] Install Active Directory Domain Services
- [ ] Promote the server to a domain controller
- [ ] Create a small fictional company domain
- [ ] Create users, groups and organisational units
- [ ] Join the Windows 11 VM to the domain
- [ ] Test password reset / account lockout workflows
- [ ] Create a shared folder and test group-based permissions
- [ ] Add one simple Group Policy
- [ ] Capture screenshots and command output from the real lab

The setup notes are here: [Active Directory Lab Build](v2-active-directory/README.md)

## Things I've already documented

### Support tickets

These are practice incidents. I deliberately keep some of them short because real ticket notes are usually not essays.

- [INC-001 — account locked](tickets/INC-001-password-lockout.md)
- [INC-002 — Wi-Fi connected but no internet](tickets/INC-002-no-internet.md)
- [INC-003 — Outlook not syncing](tickets/INC-003-outlook-not-syncing.md)
- [INC-004 — slow Windows PC](tickets/INC-004-slow-windows-pc.md)
- [INC-005 — shared drive access denied](tickets/INC-005-shared-drive-access.md)
- [INC-006 — Teams microphone issue](tickets/INC-006-teams-microphone.md)

### PowerShell

I wrote three read-only scripts for common first-line checks:

- [`Get-SystemHealth.ps1`](scripts/Get-SystemHealth.ps1) — OS, uptime, RAM, disk and adapter state
- [`Test-NetworkConnectivity.ps1`](scripts/Test-NetworkConnectivity.ps1) — local TCP/IP, gateway, internet and DNS checks
- [`Get-UserSupportSnapshot.ps1`](scripts/Get-UserSupportSnapshot.ps1) — basic info that could be attached to an escalation

I still need to run these in the Windows VM and save actual sample output. I don't want to pretend a script has been tested when I haven't tested it yet.

## How I troubleshoot

The main thing I'm trying to practise is not jumping straight to a fix.

For most tickets I try to answer these questions first:

1. Is it one user or multiple users?
2. Is the problem the account, device, application or network?
3. What changed recently?
4. What evidence can I collect before changing anything?
5. Can I test a low-risk theory first?
6. After the fix, can the user complete the original task?

My longer notes are in [troubleshooting-method.md](docs/troubleshooting-method.md).

## Lab notes

I am also keeping less polished notes here: [lab-notes.md](lab-notes.md).

This is where I record things that did not work, commands I had to look up, assumptions that turned out to be wrong, and what I want to retry later.

## Tools / topics covered

Windows 10/11 · Windows Server · Active Directory · DNS · DHCP · TCP/IP · Microsoft 365 · Outlook · Teams · permissions · PowerShell · ticket documentation · escalation

## Next target

Once the Active Directory lab is working, I want the repo to contain real evidence rather than just written scenarios:

- screenshots from Server Manager / AD Users and Computers
- domain-joined client screenshot
- users and security groups I created
- mapped/shared drive permission test
- a Group Policy test
- PowerShell output from the lab machines
- one intentionally broken scenario and the troubleshooting notes from fixing it

---

**Xitong Wang**  
IT Support / Service Desk learning portfolio