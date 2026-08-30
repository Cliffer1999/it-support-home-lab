# New-LabStructure.ps1
# Creates the OU and security-group structure for xitonglab.local.
# Run on the domain controller after AD DS has been installed.

Import-Module ActiveDirectory

$domainDn = (Get-ADDomain).DistinguishedName
$baseName = 'XitongLab'
$baseDn = "OU=$baseName,$domainDn"

function Ensure-OU {
    param(
        [Parameter(Mandatory)] [string]$Name,
        [Parameter(Mandatory)] [string]$Path
    )

    $existing = Get-ADOrganizationalUnit -LDAPFilter "(ou=$Name)" -SearchBase $Path -SearchScope OneLevel -ErrorAction SilentlyContinue
    if (-not $existing) {
        New-ADOrganizationalUnit -Name $Name -Path $Path -ProtectedFromAccidentalDeletion $true
        Write-Host "Created OU: $Name"
    }
    else {
        Write-Host "OU already exists: $Name"
    }
}

$baseExisting = Get-ADOrganizationalUnit -LDAPFilter "(ou=$baseName)" -SearchBase $domainDn -SearchScope OneLevel -ErrorAction SilentlyContinue
if (-not $baseExisting) {
    New-ADOrganizationalUnit -Name $baseName -Path $domainDn -ProtectedFromAccidentalDeletion $true
    Write-Host "Created OU: $baseName"
}

Ensure-OU -Name 'Users' -Path $baseDn
Ensure-OU -Name 'Workstations' -Path $baseDn
Ensure-OU -Name 'Servers' -Path $baseDn
Ensure-OU -Name 'Finance' -Path "OU=Users,$baseDn"
Ensure-OU -Name 'Operations' -Path "OU=Users,$baseDn"

$groups = @(
    @{ Name='GG_Finance_Users'; Path="OU=Finance,OU=Users,$baseDn" },
    @{ Name='GG_Operations_Users'; Path="OU=Operations,OU=Users,$baseDn" },
    @{ Name='GG_Finance_Share_RW'; Path="OU=Finance,OU=Users,$baseDn" }
)

foreach ($group in $groups) {
    if (-not (Get-ADGroup -Filter "SamAccountName -eq '$($group.Name)'" -ErrorAction SilentlyContinue)) {
        New-ADGroup -Name $group.Name -SamAccountName $group.Name -GroupScope Global -GroupCategory Security -Path $group.Path
        Write-Host "Created group: $($group.Name)"
    }
    else {
        Write-Host "Group already exists: $($group.Name)"
    }
}

Write-Host 'AD structure setup finished.'