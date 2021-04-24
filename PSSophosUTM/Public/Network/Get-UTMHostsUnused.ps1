Function Get-UTMHostsUnused()
{
    process
    {
        try
        {
            $Hosts = Get-UTMHosts
        }
        catch
        {
            Write-Warning $_.Exception.Message
            return $False
        }

        $UnusedHosts = @()
        $Count = 0

        foreach($h in $Hosts)
        {
            $HostDetail = Get-UTMHostUsedBy -HostRef $h._ref

            if ($HostDetail.objects.count -eq 0 -and $HostDetail.nodes.count -eq 0)
            {
                Write-Host "Host $($h.name) with IP $($h.address) is unused"
                $Count++
                $UnusedHosts += $h
            }
        }
    }
    end
    {
        Write-Warning "$Count hosts unused"
        return $UnusedHosts
    }
}


<#
Get-UTMHostsUnused
#>
