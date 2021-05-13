function Get-VULTRPlan {
    <#
        .SYNOPSIS
        Get a list of available plans
    #>
    [CmdletBinding()]
    param (
    )
    
    process {
        (Get-VULTRAPI "plans").plans
    }
}