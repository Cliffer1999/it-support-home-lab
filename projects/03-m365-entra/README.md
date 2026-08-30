# Microsoft 365 & Entra ID Administration Lab

## Overview

Practised Microsoft 365 administration across common IT support scenarios, including user creation, licence assignment, password resets, account access and identity management. Worked with Microsoft Entra ID and basic security and access controls.

## Administration Tasks Completed

### User lifecycle
- Created test user accounts.
- Updated display names and user properties.
- Reset user passwords.
- Required password change at next sign-in where appropriate.
- Disabled and restored accounts.
- Reviewed sign-in/account status during access troubleshooting.

### Microsoft 365 licensing
Practised assigning and reviewing Microsoft 365 licences and understanding how missing service entitlements can appear as support incidents.

Common checks included:

- correct user account
- assigned licence
- service availability within the licence
- application sign-in state
- whether the issue affected desktop app, web app or both

### Microsoft Entra ID
Worked with identity concepts including:

- users
- groups
- account state
- authentication methods
- MFA
- role-based administration
- sign-in troubleshooting

### Group-based administration
Created groups for fictional departments and used them to organise access and membership.

Example:

```text
Finance Users
HR Users
IT Support
M365-Test-Users
```

## Support Scenarios

### Password reset
Verified the affected user account, reset the password using the administrative workflow, and confirmed the user could sign in again.

### User cannot access Microsoft 365
Checked account state, credentials, licence assignment and whether the problem occurred in both browser and desktop applications.

### MFA problem
Reviewed the user's authentication-method state and separated an MFA registration issue from an incorrect-password or application issue.

### Outlook access problem
Compared Outlook desktop behaviour with Outlook on the web to determine whether the problem was local to the endpoint or related to the account/service.

### Licence-related issue
Reviewed the user's assigned licence and service entitlement when an application or Microsoft 365 feature was unavailable.

## Troubleshooting Approach

For Microsoft 365 incidents I tried to isolate the problem into one of five areas:

```text
User -> Device -> Application -> Identity -> Microsoft 365 Service
```

That stopped me from jumping straight to reinstalling Office or resetting passwords when the problem was somewhere else.

## Security Notes

Identity administration can directly affect access to company systems. In the lab I focused on least privilege, account verification and using groups/roles instead of giving unnecessary direct access.

**Skills:** Microsoft 365 · Microsoft Entra ID · Identity & Access Management · User Administration · MFA · Licensing · Troubleshooting