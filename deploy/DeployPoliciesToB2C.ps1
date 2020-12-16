[Cmdletbinding()]
Param(
    [Parameter(Mandatory = $true)][string]$ClientID,
    [Parameter(Mandatory = $true)][string]$ClientSecret,
    [Parameter(Mandatory = $true)][string]$TenantId,
    [Parameter(Mandatory = $true)][string]$PathToFiles
)

. DeployToB2C.ps1

$policyIds = @(
    'TrustFrameworkBase',
    'TrustFrameworkExtensions',
    'PasswordReset',
    'ProfileEdit',
    'SignUpOrSignIn',
    'SignUpSignInMultiTenantAAD')

foreach ($policyId in $policyIds)
{
    Write-Host $policyId
    $pathToFile = Join-Path $PathToFiles "$policyId.xml"
    DeployToB2C -ClientId $ClientId -ClientSecret $ClientSecret -TenantId $TenantId -PolicyId $policyId -PathToFile $pathToFile
}
