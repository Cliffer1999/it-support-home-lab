# INC-008 — Application Will Not Launch

**Priority:** P3  
**Category:** Software / Endpoint  
**Status:** Resolved

User reported that an installed application no longer opened after sign-in.

I checked Task Manager and found an existing hung process. After ending the process, I launched the application again and reviewed Event Viewer when the issue reappeared.

Troubleshooting included:

- confirming the issue affected one endpoint
- checking for an existing background process
- reviewing recent software/Windows changes
- testing after restart
- checking Event Viewer > Windows Logs > Application
- repairing the application installation

After the repair, the application launched normally and remained stable after another restart.

**Resolution:** Corrupted local application installation repaired. No wider user/account issue identified.