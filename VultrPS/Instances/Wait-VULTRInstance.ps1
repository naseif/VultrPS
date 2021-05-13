function Wait-VULTRInstanceReady {
    <#
        .SYNOPSIS
        Waits for the VULTR Instance to be ready for further action, have an IP Address and stuff...
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$InstanceId
    )
    
    process {
        while ($true) {
            $instance = Get-VULTRInstance $InstanceId

            $everythingReady = $instance.status -eq "active"
            $everythingReady = $everythingReady -and [bool]$instance.main_ip
            $everythingReady = $everythingReady -and ($instance.server_status -eq "installingbooting")

            if ($everythingReady) {
                return;
            }
            Write-Host " - $(Get-Date) waiting for instance $InstanceId to become responsive..."
            Start-Sleep -Seconds 2
        }
    }
}