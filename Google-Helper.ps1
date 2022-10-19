# Should Install-Module Selenium for control on chrome and open request and listen for change url
function Get-Auhentication-Code {
  $requestUri = $ApiSettings.EndPoints.GetAuthenticationCode;

}


function Get-Google-Access-Token {
    $requestUri = $ApiSettings.EndPoints.GetAccessToken;

    $body = @{
      code= $ApiSettings.AuthorizationCode;
      client_id=$ApiSettings.ClientId;
      client_secret=$ApiSettings.ClientSecret;
      redirect_uri=$ApiSettings.RedirectUrl;
      grant_type=$ApiSettings.GrantType; # Fixed value
    };
    Write-Output $ApiSettings.EndPoints.GetAccessToken
    Write-Output $body


    $tokens = Invoke-RestMethod -Uri $requestUri -Method POST -Body $body;
    $ApiSettings.RefreshToken   = $tokens.refresh_token
    $ApiSettings.AccessToken = $tokens.access_token

    $ApiSettings | ConvertTo-Json -depth 100 | Out-File ApiSettingsPath

    # Store refreshToken
    # Set-Content $PSScriptRoot"\refreshToken.txt" $tokens.refresh_token
    # Store accessToken
    #Set-Content $PSScriptRoot"\accessToken.txt" $tokens.access_token
}

function getRefreshToken{

}