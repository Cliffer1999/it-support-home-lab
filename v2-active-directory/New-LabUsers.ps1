# New-LabUsers.ps1
# For the xitonglab.local test domain only.
# Run on the domain controller after AD DS is installed and the OU structure exists.

Import-Module ActiveDirectory

$domainDn = (Get-ADDomain).DistinguishedName
$baseOu = "OU=XitongLab,$domainDn"

$users = @(
    @{ Name='Amy Chen'; GivenName='Amy'; Surname='Chen'; Sam='amy.chen'; Department='Finance'; OU="OU=Finance,OU=Users,$baseOu" },
    @{ Name='Daniel Lee'; GivenName='Daniel'; Surname='Lee'; Sam='daniel.lee'; Department='Operations'; OU="OU=Operations,OU=Users,$baseOu" },
    @{ Name='Emma Wang'; GivenName='Emma'; Surname='Wang'; Sam='emma.wang'; Department='Operations'; OU="OU=Operations,OU=Users,$baseOu" }
)

# Temporary lab password only. Change it when running the lab.
$tempPassword = Read-Host 'Enter temporary password for lab users' -AsSecureString

foreach ($user in $users) {
    if (Get-ADUser -Filter "SamAccountName -eq '$($user.Sam)'" -ErrorAction SilentlyContinue) {
        Write-Host "Skipping existing user: $($user.Sam)"
        continue
    }

    New-ADUser `
        -Name $user.Name `
        -GivenName $user.GivenName `
        -Surname $user.Surname `
        -SamAccountName $user.Sam `
        -UserPrincipalName "$($user.Sam)@$((Get-ADDomain).DNSRoot)" `
        -Department $user.Department `
        -Path $user.OU `
        -AccountPassword $tempPassword `
        -Enabled $true `
        -ChangePasswordAtLogon $true

    Write-Host "Created: $($user.Sam)"
}

Write-Host 'Lab user creation finished.'