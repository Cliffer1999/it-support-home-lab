# Password Reset and Account Lockout

## Problem
User cannot sign in because the password is forgotten or the account is locked.

## Quick Checks
1. Confirm the username/account being used.
2. Capture the exact error message.
3. Verify the user's identity according to support procedure.
4. Determine whether the issue is a forgotten password, expired password or locked account.

## Resolution
- Reset the password using the approved administrative tool.
- Unlock the account if it is locked.
- Require a password change at next sign-in where appropriate.
- Ask the user to sign in again and confirm access.

## Active Directory Commands

```powershell
Unlock-ADAccount -Identity username
Set-ADAccountPassword -Identity username -Reset
```

## Escalate When
- the account repeatedly locks without user action
- the account is disabled unexpectedly
- suspicious sign-in activity is suspected
- identity verification cannot be completed