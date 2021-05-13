function Get-VULTRFirewallGroup {
    <#
        .SYNOPSIS
        list registered firewall groups
    #>
    [CmdletBinding()]
    param (
    )
    
    process {
        (Get-VULTRAPI "firewalls")
    }
}