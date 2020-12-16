[Cmdletbinding()]
Param(
    [Parameter(Mandatory = $true)][string]$ClientID,
    [Parameter(Mandatory = $true)][string]$ClientSecret,
    [Parameter(Mandatory = $true)][string]$TenantId,
    [Parameter(Mandatory = $true)][string]$PathToFiles
)

$policyIds = @(
    'TrustFrameworkBase',
    'TrustFrameworkExtensions',
    'PasswordReset',
    'ProfileEdit',
    'SignUpOrSignIn',
    'SignUpSignInMultiTenantAAD')

try {
    $body = @{grant_type = "client_credentials"; scope = "https://graph.microsoft.com/.default"; client_id = $ClientID; client_secret = $ClientSecret }

    $response = Invoke-RestMethod -Uri https://login.microsoftonline.com/$TenantId/oauth2/v2.0/token -Method Post -Body $body
    $token = $response.access_token

    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Content-Type", 'application/xml')
    $headers.Add("Authorization", 'Bearer ' + $token)

    foreach ($policyId in $policyIds)
    {
        $graphuri = 'https://graph.microsoft.com/beta/trustframework/policies/' + "B2C_1A_$policyId" + '/$value'
        $pathToFile = Join-Path $PathToFiles "$policyId.xml"
        $policyContent = Get-Content $PathToFile
        $response = Invoke-RestMethod -Uri $graphuri -Method Put -Body $policyContent -Headers $headers

        Write-Host "Policy" $PolicyId "uploaded successfully."
    }
}
catch {
    Write-Host "StatusCode:" $_.Exception.Response.StatusCode.value__

    $_

    $streamReader = [System.IO.StreamReader]::new($_.Exception.Response.GetResponseStream())
    $streamReader.BaseStream.Position = 0
    $streamReader.DiscardBufferedData()
    $errResp = $streamReader.ReadToEnd()
    $streamReader.Close()

    $ErrResp

    exit 1
}

exit 0
