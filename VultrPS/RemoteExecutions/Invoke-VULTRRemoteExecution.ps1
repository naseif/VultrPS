function Invoke-VULTRRemoteExecution {
    <#
        .SYNOPSIS
        Execute a script remotely within an vultr instance
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$FilePath,
        [Parameter(Mandatory = $true)]
        [PSObject]$Instance
    )

    process {
        Get-Content $FilePath | Foreach-Object {
            $line = $_
            if ( $line -like '*$dynamicPassword*' ) {
                Add-Type -AssemblyName System.Web
                $password = [System.Web.Security.Membership]::GeneratePassword(14,2)
                Write-Host "*********************************************************" -ForegroundColor Yellow
                Write-Host "USING PASSWORD: $password" -ForegroundColor Yellow 
                Write-HOst "*********************************************************" -ForegroundColor Yellow 
                $line = $line.Replace('$dynamicPassword', $password)
            }
            if ( [bool]$line ) {
                Write-Host "  - $(Get-Date) currently executing: " -ForegroundColor Cyan -NoNewline 
                Write-Host "$line" -ForegroundColor Yellow
                $line | &ssh -i (Get-VULTRSSHKeyLocalPath) $Instance.main_ip -l root -o "StrictHostKeyChecking no" 'bash -s'
            }
        }
    }
}
