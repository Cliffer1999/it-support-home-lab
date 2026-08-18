# INC-005 — Access denied to Finance share

**Priority:** P3  
**Status:** Escalated in practice scenario

### User report

The user could open other company resources but got **Access Denied** when opening the Finance shared folder.

### What I checked

- The device was on the expected network.
- Other shares were reachable.
- Another authorised user could open the Finance share.
- The affected user said they needed Finance access for a new responsibility.

At that point, the network itself looked healthy. The more likely issue was permission / group membership.

### What I did not do

I did not try to grant access just to make the ticket disappear. In a real environment, Finance permissions should be approved by the resource owner or an authorised identity/admin team.

### Escalation note

> One user unable to access Finance share. Other network resources working and authorised colleague can access the same share. Error is Access Denied. Likely missing group/share permission. Please confirm business approval and update access if appropriate.

### V2 follow-up

I want to reproduce this properly with an AD security group and NTFS/share permissions, then test both an allowed user and a denied user from the Windows client VM.