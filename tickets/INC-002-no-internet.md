# INC-002 — Laptop Has No Internet

**Priority:** P3 — Medium  
**Category:** Network / Endpoint  
**Status:** Resolved at L1

## User Report

Laptop shows Wi-Fi connected but websites do not load.

## Diagnostic Approach

### 1. Establish scope

Confirmed other devices on the same network had internet access, suggesting a device-specific problem rather than an office-wide outage.

### 2. Inspect IP configuration

```cmd
ipconfig /all
```

Checked for a valid IPv4 address, subnet mask, default gateway, DHCP state and DNS servers.

### 3. Test the network in layers

```cmd
ping 127.0.0.1
ping <default-gateway>
ping 1.1.1.1
nslookup example.com
```

Interpretation:

- loopback failure → local TCP/IP issue
- gateway failure → local adapter/LAN issue
- external IP works but DNS lookup fails → likely DNS problem
- external IP fails for multiple devices → possible upstream issue

## Simulated Finding

The device had valid LAN connectivity but name resolution failed.

## Resolution

Refreshed the client network state and configured the device to obtain the approved DNS settings automatically from DHCP. Retested name resolution.

## Verification

Gateway reachable, external IP reachable, DNS lookup successful and websites loaded normally.

## Closure Note

Device-specific DNS resolution issue. LAN and internet IP connectivity were available. Restored approved DNS configuration and confirmed successful name resolution and web access.