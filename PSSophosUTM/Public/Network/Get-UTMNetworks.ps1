Function Get-UTMNetworks()
{
    begin
    {
        $Uri = "$Server/api/objects/network/network/"
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
Get-UTMNetworks
#>
