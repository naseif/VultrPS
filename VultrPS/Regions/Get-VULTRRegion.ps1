function Get-VULTRRegion {
    <#
        .SYNOPSIS
        list all available regions
    #>
    [CmdletBinding()]
    param (
    )

    process {
        (Get-VULTRAPI "regions").regions
    }
}