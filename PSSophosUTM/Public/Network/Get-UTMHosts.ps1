Function Get-UTMHosts()
{
    param(
    )

    begin
    {
        $Uri = "$Server/api/objects/network/host/"
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
Get-UTMHosts
#>
