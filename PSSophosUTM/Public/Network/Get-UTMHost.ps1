Function Get-UTMHost()
{
    param(
        [ValidateNotNullOrEmpty()]
        [Parameter(
            Position = 0,
            Mandatory = $True
        )]
        [System.String]
        $HostRef
    )

    begin
    {
        $Uri = "$Server/api/objects/network/host/$HostRef"
        $Headers = @{ Authorization = "Basic $Token" }
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
        return $RestCall
    }
}

<#
Get-UTMHost
#>
