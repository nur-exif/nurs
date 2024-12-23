
$domain = "DC=nurss,DC=local"
$computersOU = "OU=Computers,$domain"

if (-not (Get-ADOrganizationalUnit -Filter {Name -eq "Computers"})) {
    New-ADOrganizationalUnit -Name "Computers" -Path $domain `
    -ProtectedFromAccidentalDeletion $true
    Write-Host "OU 'Computers' created successfully."
} else {
    Write-Host "OU 'Computers' already exists."
}
