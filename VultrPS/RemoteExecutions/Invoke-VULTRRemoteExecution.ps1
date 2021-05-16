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
        Get-Content $FilePath | &ssh -i ~/.ssh/id_rsa $Instance.main_ip -l root -o "StrictHostKeyChecking no" 'bash -s'
    }
}
