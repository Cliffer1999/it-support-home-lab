# INC-001 — Account locked after failed sign-ins

**Priority:** P3  
**Status:** Resolved in practice scenario

### What the user said

Could not sign in to Windows after trying the password a few times. The message said the account was locked.

### What I checked

- Confirmed this was only affecting one user.
- Confirmed the username and exact error message.
- Treated it as an account lockout first instead of immediately assuming the password needed to be reset.
- In a real environment I would verify the user's identity before touching the account.

### Fix

Used the approved account-unlock process in the simulated scenario, then had the user try the correct credentials again.

### Result

User could sign in normally.

### Ticket note I would leave

> User unable to sign in due to account lockout after repeated failed attempts. Identity verification required before account action. Account restored through approved process and successful Windows sign-in confirmed.

### What I want to test in V2

Re-create this properly in Active Directory: lock a test account, inspect the account state, unlock it in AD Users and Computers / PowerShell, then capture the real steps and screenshots.