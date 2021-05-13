function New-VULTRInstance {
    <#
        .SYNOPSIS
        It creates a new vultr instance
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ApiKey,
        [Parameter()]
        [string]$Region = "ams",
        [Parameter()]
        [string]$Plan = "vc2-4c-8gb",
        [Parameter()]
        [string]$OsId = "387"
    )

    
    process {
        $data = @{
            region = $Region
            plan   = $Plan
            os_id  = $OsId
        }
        
        $instance = Invoke-VULTRAPI -ApiKey $apikey -ApiEndPoint "instances" -Data $data
        $instance.instance
    }
}