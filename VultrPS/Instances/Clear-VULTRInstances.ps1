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
            try {
                Write-Host " - $(Get-Date) removing instance $($instance.id) ..."
                Remove-VULTRInstance $instance.id
            } catch {
                Write-Host " - $(Get-Date) error destroying instance $($instance.id)... skipping for now..." -ForegroundColor Yellow
            }
        }
    }
}
