function Get-VULTRInstance {
    <#
        .SYNOPSIS
        Retrieve all available instances
    #>
    [CmdletBinding()]
    param (
        [string]$InstanceId
    )
    
    process {
        if ([bool]$InstanceId) {
            (Get-VULTRAPI "instances/$InstanceId").instance
        }
        else 
        {
            (Get-VULTRAPI "instances").instances
        }
    }
}