# Test-NetworkConnectivity.ps1
# Read-only layered network diagnostic checks.

Write-Host "=== IT Support - Network Connectivity Test ==="

$config = Get-NetIPConfiguration |
    Where-Object { $_.IPv4Address -and $_.NetAdapter.Status -eq 'Up' } |
    Select-Object -First 1

if (-not $config) {
    Write-Warning "No active adapter with an IPv4 address was found."
    exit 1
}

$gateway = $config.IPv4DefaultGateway.NextHop

Write-Host "Adapter: $($config.InterfaceAlias)"
Write-Host "IPv4:    $($config.IPv4Address.IPAddress)"
Write-Host "Gateway: $gateway"
Write-Host "DNS:     $($config.DNSServer.ServerAddresses -join ', ')"
Write-Host ""

$tests = @(
    @{ Name = 'Local TCP/IP'; Target = '127.0.0.1' },
    @{ Name = 'Default gateway'; Target = $gateway },
    @{ Name = 'External IP'; Target = '1.1.1.1' }
)

foreach ($test in $tests) {
    if ([string]::IsNullOrWhiteSpace($test.Target)) {
        Write-Host "$($test.Name): NOT TESTED"
        continue
    }

    $ok = Test-Connection -ComputerName $test.Target -Count 1 -Quiet -ErrorAction SilentlyContinue
    Write-Host "$($test.Name): $(if ($ok) {'PASS'} else {'FAIL'})"
}

try {
    Resolve-DnsName example.com -ErrorAction Stop | Out-Null
    Write-Host "DNS resolution: PASS"
}
catch {
    Write-Host "DNS resolution: FAIL"
}

Write-Host ""
Write-Host "Interpret failures from local to remote: adapter/IP -> gateway/LAN -> internet -> DNS."