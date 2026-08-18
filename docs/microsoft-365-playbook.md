# Microsoft 365 L1 Support Playbook

This document describes first-line troubleshooting logic for common Microsoft 365 incidents. Administrative actions should only be performed with authorised access in a real environment.

## Outlook Not Receiving New Email

1. Confirm internet connectivity.
2. Check whether Outlook reports Working Offline, Disconnected or Trying to connect.
3. Test Outlook on the web to separate mailbox/service problems from desktop-client problems.
4. Confirm the issue affects sending, receiving or both.
5. Restart Outlook and inspect for stuck dialogs/processes.
6. Check Microsoft 365 service health if multiple users are affected and access is available.
7. Escalate suspected mailbox, Exchange Online or tenant-wide issues with collected evidence.

## Teams Microphone / Camera

1. Confirm the correct input/output device is selected in Teams.
2. Test the device in Windows Sound settings.
3. Check Windows microphone/camera privacy permissions.
4. Close other applications that may exclusively use the device.
5. Reconnect the device and restart Teams.
6. Test using another application to isolate hardware vs Teams.

## OneDrive Not Syncing

1. Confirm network access.
2. Check OneDrive status icon and error message.
3. Confirm the user is signed into the expected work account.
4. Check storage capacity and problematic file names/paths.
5. Pause/resume sync or restart the client when appropriate.
6. Avoid deleting local data as an early troubleshooting step.

## MFA / Sign-In Issue

1. Verify user identity according to company procedure.
2. Capture the exact sign-in error and timestamp.
3. Confirm username/account being used.
4. Determine whether the issue affects one app or all Microsoft 365 services.
5. Check basic device time/network state.
6. Escalate MFA method resets, Conditional Access blocks or risky-sign-in investigation when outside L1 permissions.

## Licensing Symptoms

Possible symptoms include Office activation warnings or inability to use a licensed service. Confirm the signed-in identity and capture the error. Licensing changes should be made only by authorised administrators.

## Key Principle

L1 support should isolate **user vs device vs application vs account vs service** before escalation. A well-documented escalation is more valuable than repeatedly reinstalling applications without evidence.