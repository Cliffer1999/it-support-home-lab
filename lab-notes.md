# Lab Notes

These are deliberately rougher than the formal docs. I want this file to show what I actually need to test rather than making the project look finished before it is.

## 2026-08-18

### Things I realised while rewriting V1

- My first ticket write-ups were too polished and all had the same structure. They read more like a template than real support notes.
- I want future tickets to include actual commands/output where possible.
- I should not say a PowerShell script is tested until I have run it on the Windows VM.
- Active Directory is the biggest gap in the current repo, so V2 will focus on that before adding more random topics.

### Questions I want the AD lab to answer

- What actually happens to a client when DNS is pointed somewhere other than the domain controller?
- What is the practical difference between an OU and a security group?
- How do group membership changes affect shared-folder access?
- What does a locked account look like in ADUC and PowerShell?
- How quickly does a simple GPO apply to the client, and when do I need `gpupdate /force`?

### Evidence I still need

- Windows Server VM screenshot
- Domain controller promotion screenshot
- AD Users and Computers screenshot
- Domain-joined Windows 11 client screenshot
- `whoami` / `ipconfig` output from the client
- real account-lockout test
- real shared-folder permission test
- real GPO test
- output from the PowerShell scripts in this repo

I will add those only after they actually exist.