Function Get-UTMNetworksUnused()
{
    process
    {
        try
        {
            $Networks = Get-UTMNetworks
        }
        catch
        {
            Write-Warning $_.Exception.Message
            return $False
        }

        $UnusedNetworks = @()
        $Count = 0

        foreach($n in $Networks)
        {
            $HostDetail = Get-UTMNetworkUsedBy -NetworkRef $n._ref

            if ($HostDetail.objects.count -eq 0 -and $HostDetail.nodes.count -eq 0)
            {
                Write-Host "Network $($n.name) with IP $($n.address)/$($n.netmask) is unused"
                $Count++
                $UnusedNetworks += $n
            }
        }
    }
    end
    {
        Write-Warning "$Count Networks unused"
        return $UnusedNetworks
    }
}

<#
Get-UTMNetworksUnused
#>
