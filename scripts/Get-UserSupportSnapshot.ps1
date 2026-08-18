# Get-UserSupportSnapshot.ps1
# Collects a read-only support snapshot for troubleshooting and escalation.

Write-Host "=== User Support Snapshot ==="
Write-Host "Timestamp: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
Write-Host "Computer:  $env:COMPUTERNAME"
Write-Host "User:      $(whoami)"
Write-Host ""

Write-Host "--- Operating System ---"
Get-CimInstance Win32_OperatingSystem |
    Select-Object Caption, Version, LastBootUpTime |
    Format-List

Write-Host "--- IP Configuration ---"
Get-NetIPConfiguration |
    Where-Object { $_.NetAdapter.Status -eq 'Up' } |
    Select-Object InterfaceAlias,
        @{N='IPv4';E={$_.IPv4Address.IPAddress}},
        @{N='Gateway';E={$_.IPv4DefaultGateway.NextHop}},
        @{N='DNS';E={$_.DNSServer.ServerAddresses -join ', '}} |
    Format-List

Write-Host "--- Disk Space ---"
Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" |
    Select-Object DeviceID,
        @{N='SizeGB';E={[math]::Round($_.Size/1GB,1)}},
        @{N='FreeGB';E={[math]::Round($_.FreeSpace/1GB,1)}} |
    Format-Table -AutoSize

Write-Host "--- Recent System Errors (last 24 hours, max 10) ---"
$start = (Get-Date).AddHours(-24)
Get-WinEvent -FilterHashtable @{LogName='System'; Level=2; StartTime=$start} -ErrorAction SilentlyContinue |
    Select-Object -First 10 TimeCreated, ProviderName, Id, Message |
    Format-List

Write-Host "Snapshot complete. Review output before attaching it to a ticket to avoid exposing unnecessary information."