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
            if ( [bool]$line ) {
                Write-Host "  - $(Get-Date) currently executing: " -ForegroundColor Cyan -NoNewline 
                Write-Host "$line" -ForegroundColor Yellow
                $line | &ssh -i ~/.ssh/id_rsa $Instance.main_ip -l root -o "StrictHostKeyChecking no" 'bash -s'
            }
        }
    }
}
