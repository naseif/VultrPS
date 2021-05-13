function New-VULTRInstance {
    <#
        .SYNOPSIS
        It creates a new vultr instance
    #>
    [CmdletBinding()]
    param (
        [string]$Region = "ams",
        [string]$Plan = "vc2-4c-8gb",
        [string]$OsId = "387",
        [Switch]$WaitForResponsiveness
    )

    
    process {
        $data = @{
            region = $Region
            plan   = $Plan
            os_id  = $OsId
        }
        
        $instance = Invoke-VULTRAPI -ApiEndPoint "instances" -Data $data

        Write-Host " - $(Get-Date) instance $($instance.instance.id) created..."
        if ( $WaitForResponsiveness ) {
            Wait-VULTRInstanceReady $instance.instance.id
        }

        $instance.instance
    }
}