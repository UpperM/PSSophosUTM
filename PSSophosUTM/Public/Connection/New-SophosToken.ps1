Function New-SophosToken()
{
    param(
        [ValidateNotNullOrEmpty()]
        [Parameter(
            Position = 0,
            Mandatory = $False
        )]
        [System.String]
        $Token,

        [ValidateNotNullOrEmpty()]
        [Parameter(
            Position = 1,
            Mandatory = $False
        )]
        [System.String]
        $Username,

        [ValidateNotNullOrEmpty()]
        [Parameter(
            Position = 2,
            Mandatory = $False
        )]
        [System.String]
        $Password,

        [ValidateNotNullOrEmpty()]
        [Parameter(
            Position = 3,
            Mandatory = $true
        )]
        [System.String]
        $Server
    )

    begin
    {
        # Step 1. Create a username:password pair
        $credPair = "$($username):$($password)"

        # Step 2. Encode the pair to Base64 string
        $encodedCredentials = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($credPair))

        # Step 3. Form the header and add the Authorization attribute to it
        $headers = @{ Authorization = "Basic $encodedCredentials" }
        $Uri = "$Server/api/nodes/"
    }
    process
    {
        try
        {
            $RestCall = Invoke-RestMethod -Method GET -Uri $Uri -Headers $Headers
        }
        catch
        {
            Write-Warning $_.Exception.Message
            return $False
        }
    }
    end
    {
        $Script:Token = $encodedCredentials
        $Script:Server = $Server
        return $RestCall
    }
}

<#
New-SophosToken -Username "admin"  -Password "Password" -Server "https://192.168.1.254:4444"
#>
