function Get-VULTRInstanceIp {
    <#
        .SYNOPSIS
        Retrieve the IP-Address of that instance

        .DESCRIPTION
        It takes some time for an instance to receive an external ip address.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$InstanceId
    )
    
    process {
        (Get-VULTRAPI "instances/$InstanceId").instance.main_ip
    }
}