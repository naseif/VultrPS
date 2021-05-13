function Get-VULTROperatingSystem {
    <#
        .SYNOPSIS
        Get a list of supported operating systems
    #>
    [CmdletBinding()]
    param (
    )
    
    process {
        (Get-VULTRAPI "os").os
    }
}