function Clear-VULTRInstances {
    <#
        .SYNOPSIS
        Remove all Instances that are currently running under the account
    #>
    [CmdletBinding()]
    param (
    )
    
    process {
        Get-VULTRInstance | Foreach-Object {
            $instance = $_
            Write-Host " - $(Get-Date) removing instance $($instance.id) ..."
            Remove-VULTRInstance $instance.id
        }
    }
}