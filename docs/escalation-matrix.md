# L1 Escalation Matrix

| Situation | L1 Action | Escalate To |
|---|---|---|
| Single PC application issue | Diagnose client/device and attempt approved fix | Application/L2 if unresolved |
| Password/account lockout | Verify identity and use approved account process | Identity/L2 if account state is abnormal |
| Multiple users cannot authenticate | Collect scope and timestamps; avoid mass account changes | Identity/Infrastructure |
| Single device cannot access internet | Test adapter, IP, gateway, DNS and alternate network | Network/L2 if infrastructure suspected |
| Many users lose connectivity | Confirm scope and collect evidence | Network/Infrastructure immediately |
| Shared resource access denied | Confirm user, resource, network and expected access | Resource owner / Identity admin for permission changes |
| Microsoft 365 client issue | Isolate desktop app vs web vs account/service | M365/L2 |
| Suspected tenant-wide M365 outage | Record affected services/users and service-health evidence | M365/Incident team |
| Hardware failure | Basic cable/device checks and diagnostics | Desktop/Hardware support |
| Security concern / suspicious sign-in | Preserve evidence; do not investigate beyond authority | Security team immediately |

## Escalation Note Template

**Impact:**  
**Affected user(s)/device(s):**  
**Started:**  
**Error:**  
**Checks completed:**  
**Results:**  
**Changes made:**  
**Suspected cause:**  
**Requested next action:**

The goal is to transfer context, not just transfer ownership.