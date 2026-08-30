# Network Troubleshooting Lab

## Overview

Diagnosed common Windows network connectivity issues involving IP addressing, DNS, DHCP and default gateways. Used `ping`, `ipconfig`, `tracert`, `nslookup` and PowerShell to isolate faults and document troubleshooting steps and resolutions.

## Tools Used

```cmd
ipconfig /all
ping
tracert
nslookup
```

PowerShell tools included:

```powershell
Get-NetIPConfiguration
Get-NetAdapter
Test-NetConnection
Resolve-DnsName
```

## Troubleshooting Method

I tested connectivity from the local system outward rather than immediately changing network settings.

```text
1. Adapter status
2. Local IP configuration
3. Default gateway
4. External IP connectivity
5. DNS resolution
6. Application access
```

## Scenarios Completed

### 1. Invalid IP configuration
Checked IPv4 addressing, subnet mask, gateway and DHCP state. Used the results to determine whether the client had received valid configuration.

### 2. DNS failure
Verified that an external IP address was reachable while hostname resolution failed. Used `nslookup` / `Resolve-DnsName` to isolate the issue to DNS rather than general internet connectivity.

### 3. Default gateway issue
Compared local subnet connectivity with gateway reachability to determine whether the fault was between the endpoint and router.

### 4. DHCP issue
Reviewed whether the endpoint received configuration automatically and checked for symptoms such as an APIPA `169.254.x.x` address.

### 5. Slow or intermittent connection
Used repeated connectivity tests and `tracert` to distinguish local endpoint problems from upstream routing/connectivity issues.

## Example Diagnostic Sequence

```cmd
ipconfig /all
ping 127.0.0.1
ping <default-gateway>
ping 1.1.1.1
nslookup example.com
tracert example.com
```

Interpretation:

- loopback failure: local TCP/IP stack problem
- gateway failure: local adapter/LAN problem
- external IP works but DNS fails: DNS issue
- both external IP and DNS fail: broader connectivity problem

## PowerShell Script

The repository includes [`Test-NetworkConnectivity.ps1`](../../scripts/Test-NetworkConnectivity.ps1), which automates a layered first-line network check.

## What I Learned

The main lesson from this lab was to avoid treating “no internet” as a single type of fault. IP configuration, gateway access, DNS and application connectivity are separate layers and can be tested independently.

**Skills:** TCP/IP · DNS · DHCP · Network Troubleshooting · Windows · PowerShell