# INC-002 — Wi-Fi connected, but websites would not load

**Priority:** P3  
**Status:** Resolved in practice scenario

This one was useful because the Wi-Fi icon made it look like the network was fine, but that only proved the laptop was connected to the local wireless network.

### Checks

I first checked whether other devices had internet access. They did, so I treated it as a laptop-specific issue.

Then I checked:

```cmd
ipconfig /all
ping 127.0.0.1
ping <default-gateway>
ping 1.1.1.1
nslookup example.com
```

What I was trying to separate:

- local TCP/IP problem
- connection to the router
- internet connectivity
- DNS/name-resolution problem

### Finding

The practice scenario was designed so the laptop could reach the gateway and an external IP address, but DNS lookup failed.

That made DNS much more likely than a Wi-Fi problem.

### Fix / retest

Returned DNS configuration to the expected DHCP-provided settings and retested `nslookup` and normal web browsing.

### Ticket note

> User connected to Wi-Fi but unable to browse. Other devices unaffected. Gateway and external IP reachable; DNS lookup failed. Restored expected DNS configuration and confirmed name resolution plus normal web access.

### Note to myself

I originally used to think “connected to Wi-Fi” meant “internet should work.” This scenario is a good reminder that LAN connectivity, internet routing and DNS are separate checks.