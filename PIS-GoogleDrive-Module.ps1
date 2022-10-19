$global:ApiSettings = Get-Content $PSScriptRoot"\settings.json" | ConvertFrom-Json
$global:ApiSettingsPath = Get-Content $PSScriptRoot"\settings.json" | ConvertFrom-Json

. $PSScriptRoot"\Google-Helper.ps1"

function Global:Login-Google {
    [CmdletBinding()]
    [Alias("glogin")]
    param(
        [Parameter(Mandatory=$true, Position = 0)]
        [Alias("user")]
        [String]$Username,
        [Parameter(Mandatory=$true, Position = 1)]
        [Alias("pass")]
        [SecureString]$Password
    )

    Get-Google-Access-Token
}
