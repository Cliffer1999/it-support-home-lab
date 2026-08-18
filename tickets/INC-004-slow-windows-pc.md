# INC-004 — Windows PC Is Very Slow

**Priority:** P3 — Medium  
**Category:** Windows / Performance  
**Status:** Resolved at L1

## User Report

PC takes a long time to start and applications are slow after sign-in.

## Diagnostic Approach

1. Asked when the issue started and whether it was constant.
2. Opened Task Manager and inspected CPU, memory and disk utilisation.
3. Reviewed high-impact startup applications.
4. Checked available system-drive space.
5. Checked uptime to identify an unusually long period without restart.
6. Reviewed recent system errors for supporting evidence rather than assuming malware or hardware failure.

## Simulated Finding

Several non-essential startup applications launched at sign-in and memory pressure was high. No hardware failure was indicated.

## Resolution

Disabled approved non-essential startup applications and restarted the workstation.

## Verification

Startup completed faster and resource utilisation returned to a normal range during the user's standard workload.

## Closure Note

Performance issue associated with excessive non-essential startup load. Reviewed system resources, disabled approved startup items, restarted device and verified improved login/application performance.

## Learning Point

A slow PC is a symptom, not a diagnosis. CPU, memory, disk, startup load and recent changes should be measured before making changes.