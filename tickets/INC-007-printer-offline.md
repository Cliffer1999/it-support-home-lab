# INC-007 — Printer Shows Offline

**Priority:** P3  
**Category:** Printer / Endpoint  
**Status:** Resolved

User could not print to the office printer while another user could print successfully.

I first confirmed this was a single-user issue, then checked the Windows print queue and printer connection. A failed job was stuck in the queue and the local Print Spooler was not processing jobs normally.

Actions taken:

```powershell
Get-Service Spooler
Get-Printer
Get-PrintJob
Restart-Service Spooler
```

After clearing the failed job and restarting the Print Spooler, I printed a Windows test page successfully.

**Resolution:** Local print queue/spooler issue resolved. Printer hardware and network availability were not the cause.