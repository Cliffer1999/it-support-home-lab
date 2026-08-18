# Get-SystemHealth.ps1
# Read-only first-line diagnostic script for a Windows support technician.

$os = Get-CimInstance Win32_OperatingSystem
$computer = Get-CimInstance Win32_ComputerSystem
$cpu = Get-CimInstance Win32_Processor | Select-Object -First 1
$systemDrive = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
$uptime = (Get-Date) - $os.LastBootUpTime

Write-Host "=== IT Support - System Health ==="
Write-Host "Computer:      $env:COMPUTERNAME"
Write-Host "User:          $env:USERNAME"
Write-Host "Windows:       $($os.Caption) $($os.Version)"
Write-Host "Uptime:        $([math]::Round($uptime.TotalHours,1)) hours"
Write-Host "CPU:           $($cpu.Name)"
Write-Host "Memory:        $([math]::Round($computer.TotalPhysicalMemory / 1GB,2)) GB"

if ($systemDrive) {
    Write-Host "C: Free Space: $([math]::Round($systemDrive.FreeSpace / 1GB,2)) GB / $([math]::Round($systemDrive.Size / 1GB,2)) GB"
}

Write-Host ""
Write-Host "Active network adapters:"
Get-NetAdapter |
    Where-Object Status -eq 'Up' |
    Select-Object Name, InterfaceDescription, LinkSpeed |
    Format-Table -AutoSize

Write-Host "Diagnostic collection complete. No system settings were changed."