# INC-001 — User Cannot Sign In

**Priority:** P3 — Medium  
**Category:** Identity / Access  
**Status:** Resolved at L1

## User Report

> I entered my password several times and now Windows says my account is locked.

## Scope

One user. No reports of wider authentication failure.

## Diagnostic Approach

1. Confirmed the user's identity using the simulated support verification process.
2. Confirmed the username and exact error rather than assuming a forgotten password.
3. Checked whether the issue affected only the workstation sign-in or other services.
4. Determined the account was locked following repeated failed attempts.

## Resolution

In the simulated environment, followed the approved account-unlock process and had the user sign in again with the correct credentials.

## Verification

User successfully signed in and accessed the desktop.

## Closure Note

Single-user account lockout caused by repeated incorrect password attempts. Identity verified, account restored using approved process, successful sign-in confirmed. No wider impact observed.

## Learning Point

Password resets and account unlocks are security-sensitive. A technician should verify identity and follow company policy rather than bypassing authentication controls.