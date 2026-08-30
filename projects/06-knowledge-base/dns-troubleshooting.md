# DNS Troubleshooting

## Problem
The user has network connectivity but cannot open websites or services by name.

## Checks

```cmd
ipconfig /all
nslookup example.com
ping 1.1.1.1
```

If the external IP responds but hostname lookup fails, DNS is a strong suspect.

## Resolution Steps
1. Confirm the configured DNS servers.
2. Compare DNS settings with the expected DHCP/network configuration.
3. Flush the local resolver cache if appropriate:

```cmd
ipconfig /flushdns
```

4. Renew DHCP configuration if required:

```cmd
ipconfig /release
ipconfig /renew
```

5. Retest with `nslookup`.

## Escalate When
- several users have the same DNS failure
- the configured corporate DNS server is unreachable
- Active Directory clients cannot resolve domain services