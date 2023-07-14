[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string] $SwaggerFileLocation,
    
    [Parameter(Mandatory = $true)]
    [string] $ApiFQDN,

    [Parameter(Mandatory = $false)]
    [switch] $IsOpenApiV2Spec
)

$packageJsonString = Get-Content $SwaggerFileLocation -Encoding UTF8
$packageJson = $packageJsonString | ConvertFrom-Json

Write-Host "Setting server url to '$ApiFQDN'"

if ($IsOpenApiV2Spec.IsPresent) {
    if ( [bool]($packageJson.PSobject.Properties.name -match "host")) {
        $packageJson.host = $ApiFQDN
    } else {
        $packageJson | add-member -NotePropertyName "host" -NotePropertyValue $ApiFQDN
    }
} else {
    $hostName = New-Object System.Object
    $hostName  | Add-Member -Type NoteProperty -Name url -Value $ApiFQDN

    $serversArray = @()
    $serversArray += $hostName

    if ( [bool]($packageJson.PSobject.Properties.name -match "servers")) {
        $packageJson.servers = $serversArray
    } else {
        $packageJson | add-member -Name "servers" -value $serversArray -MemberType NoteProperty
    }
}

$text = $packageJson | ConvertTo-Json -depth 100 -Compress
[System.IO.File]::WriteAllLines($SwaggerFileLocation, $text)