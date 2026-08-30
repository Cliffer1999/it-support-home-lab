# IT Help Desk & Ticketing System Lab

## Overview

Set up a simulated Level 1 help desk environment and worked through common end-user incidents. The focus was not only fixing the issue, but recording enough detail that another technician could understand what happened and what had already been tested.

## Ticket Workflow

For each incident I recorded:

- user-reported symptom
- impact and scope
- priority/category
- troubleshooting performed
- result of each check
- resolution or escalation
- closure notes

## Incidents Completed

| Incident | Issue | Result |
|---|---|---|
| INC-001 | Account lockout | Resolved |
| INC-002 | Wi-Fi connected but no internet | Resolved |
| INC-003 | Outlook not receiving new mail | Resolved |
| INC-004 | Slow Windows workstation | Resolved |
| INC-005 | Shared drive access denied | Escalated with evidence |
| INC-006 | Teams microphone not working | Resolved |
| INC-007 | Printer shows offline | Resolved |
| INC-008 | Software fails to launch | Resolved |

Existing detailed records are stored in the repository [`tickets`](../../tickets/) folder.

## Example: Printer Offline

User reported that a network printer appeared offline while another employee could print successfully.

Checks performed:

1. Confirmed the affected printer and queue.
2. Checked network connectivity from the workstation.
3. Cleared a stuck print job.
4. Restarted the Print Spooler service.
5. Removed and re-added the approved printer connection.
6. Printed a Windows test page.

Useful commands/tools:

```powershell
Get-Service Spooler
Restart-Service Spooler
Get-Printer
Get-PrintJob
```

## Example: Application Will Not Launch

Troubleshooting included:

- confirming whether the problem affected one user or all users
- checking Task Manager for an existing hung process
- reviewing recent software changes
- testing as the same user after restart
- checking Event Viewer/Application logs
- repairing or reinstalling the application when appropriate

## Escalation Practice

I also practised recognising when an L1 technician should stop changing things and escalate.

For example, a user requesting access to a Finance share was not simply granted permission. I confirmed that connectivity and the resource were working, then documented the likely permissions issue for the resource owner/identity administrator.

## Service Desk Notes

A useful ticket should answer three questions quickly:

1. What is actually broken?
2. What has already been checked?
3. What fixed it, or what does the next technician need to do?

**Skills:** IT Support · Service Desk · Incident Management · Ticketing Systems · Troubleshooting · Escalation · User Communication