function ApiGoogleGetAccessToken{
    $requestUri = $ApiSettings.EndPoints.GetAccessToken

    $body = @{
      code='4/0ARtbsJqoGBfjTc3g5r6YH8Js5Vm9a8wkiZjBcd9ojx6uMUmLvEWbkCjODrg6CnvB3Llt-w';
      client_id='1060255430159-dihf5l91ccu5g435p6ou2dip2adl6kk7.apps.googleusercontent.com';
      client_secret='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';
      redirect_uri='http://localhost/oauth2callback';
      grant_type="authorization_code"; # Fixed value
    };
    

    $tokens = Invoke-RestMethod -Uri $requestUri -Method POST -Body $body;
    $ApiSettings.RefreshToken   = $tokens.refresh_token
    $ApiSettings.AccessToken = $tokens.access_token
    # Store refreshToken
    # Set-Content $PSScriptRoot"\refreshToken.txt" $tokens.refresh_token
    # Store accessToken
    #Set-Content $PSScriptRoot"\accessToken.txt" $tokens.access_token
}

function getRefreshToken{

}