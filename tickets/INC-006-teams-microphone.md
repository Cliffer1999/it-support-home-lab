# INC-006 — Microphone Not Working in Teams

**Priority:** P3 — Medium  
**Category:** Microsoft Teams / Endpoint  
**Status:** Resolved at L1

## User Report

User can hear a Teams meeting but other participants cannot hear the user.

## Diagnostic Approach

1. Confirmed the microphone was not muted physically or in Teams.
2. Checked Teams Settings > Devices and selected the expected microphone.
3. Tested the microphone through Windows Sound settings.
4. Checked Windows microphone privacy permissions for desktop applications.
5. Tested the device outside Teams to separate hardware from application configuration.

## Simulated Finding

The microphone worked in Windows but Teams was configured to use a different input device.

## Resolution

Selected the correct microphone in Teams and completed a test call.

## Verification

Input meter responded and test-call audio played back correctly.

## Closure Note

Teams was using an incorrect audio input device. Hardware tested successfully in Windows. Correct microphone selected in Teams and successful test call confirmed.

## Learning Point

Testing at both operating-system and application level quickly isolates whether an audio issue is hardware, Windows configuration or application configuration.