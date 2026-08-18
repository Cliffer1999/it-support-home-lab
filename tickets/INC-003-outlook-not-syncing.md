# INC-003 — Outlook Not Receiving New Email

**Priority:** P3 — Medium  
**Category:** Microsoft 365 / Outlook  
**Status:** Resolved at L1

## User Report

Outlook desktop has not received new messages for approximately one hour.

## Diagnostic Approach

1. Confirmed internet connectivity.
2. Checked Outlook connection/status indicators.
3. Tested the mailbox through Outlook on the web.
4. Because web mail worked, isolated the problem to the local Outlook client rather than the mailbox/service.
5. Checked for offline mode and stuck Outlook processes.
6. Restarted the desktop client using a low-risk recovery approach.

## Simulated Finding

Mailbox and Microsoft 365 access were healthy through the browser. The local Outlook client was not actively connected.

## Resolution

Restored the client to online operation and restarted Outlook.

## Verification

A test message appeared in both Outlook on the web and the desktop client.

## Closure Note

Desktop Outlook connectivity issue isolated by successful web-mail test. Restored client online state, restarted Outlook and confirmed new-mail synchronisation with test message.

## Learning Point

Testing the web version early helps separate a local Outlook problem from an Exchange Online/mailbox problem and avoids unnecessary account changes.