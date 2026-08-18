# INC-005 — Shared Drive Access Denied

**Priority:** P3 — Medium  
**Category:** Access / File Services  
**Status:** Escalated

## User Report

User can access other company resources but receives Access Denied when opening the Finance shared drive.

## Diagnostic Approach

1. Confirmed the user was connected to the expected network.
2. Confirmed other shared resources were reachable.
3. Confirmed the exact Finance share/path and captured the error.
4. Determined whether colleagues with approved access could reach the same resource.
5. Confirmed the user stated that Finance access was required for a new work responsibility.

## Assessment

Connectivity was healthy and the resource itself was available. The symptoms indicated a likely access/permission requirement rather than a network outage.

## L1 Decision

Did **not** attempt to bypass permissions or grant access without authorisation.

## Escalation Note

**Impact:** One user unable to access Finance shared drive required for work.  
**Network:** Healthy; other shares accessible.  
**Resource:** Available to authorised colleague.  
**Error:** Access Denied.  
**Suspected cause:** User does not have required security-group/share permission.  
**Requested action:** Resource owner / identity administrator to validate business approval and assign authorised access if appropriate.

## Learning Point

Good IT support is not always about fixing the issue personally. Permission changes can have security implications; recognising the boundary of L1 authority is part of correct incident handling.