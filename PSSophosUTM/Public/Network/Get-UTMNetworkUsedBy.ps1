Function Get-UTMNetworkUsedBy()
{
    param(
        [ValidateNotNullOrEmpty()]
        [Parameter(
            Position = 0,
            Mandatory = $True
        )]
        [System.String]
        $NetworkRef
    )

    begin
    {
        $Uri = "$Server/api/objects/network/network/$NetworkRef/usedby"
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
Get-UTMNetworkUsedBy -NetworkRef "Ref_Mynetwork"
#>
