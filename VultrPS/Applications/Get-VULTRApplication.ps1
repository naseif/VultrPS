function Get-VULTRApplication {
    <#
        .SYNOPSIS
        Get a list of supported applications
    #>
    [CmdletBinding()]
    param (
    )
    
    process {
        (Get-VULTRAPI "applications").applications
    }
}