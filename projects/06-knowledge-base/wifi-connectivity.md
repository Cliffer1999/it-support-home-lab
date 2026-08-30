# Wi-Fi Connected but No Internet

## Problem
Windows shows the device connected to Wi-Fi, but websites or online applications do not work.

## Quick Checks
1. Check whether other devices on the same network have internet access.
2. Disconnect and reconnect Wi-Fi.
3. Run `ipconfig /all`.
4. Confirm the device has a valid IPv4 address, default gateway and DNS servers.

## Technician Checks

```cmd
ping 127.0.0.1
ping <default-gateway>
ping 1.1.1.1
nslookup example.com
```

## How to Interpret Results
- Cannot reach gateway: local Wi-Fi/LAN problem.
- Can reach gateway but not external IP: upstream connectivity issue.
- Can reach external IP but `nslookup` fails: DNS issue.
- `169.254.x.x` address: DHCP configuration was not received correctly.

## Escalate When
- multiple users are affected
- gateway/router appears unavailable
- repeated packet loss or wider network outage is suspected