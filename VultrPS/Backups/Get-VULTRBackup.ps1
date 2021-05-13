function Get-VULTRBackup {
    <#
        .SYNOPSIS
        Retrieve the list of available backups
    #>
    [CmdletBinding()]
    param (
        [string]$BackupId
    )
    
    process {
        if ([bool]$BackupId) {
            (Get-VULTRAPI "backups/$BackupId")
        }
        else 
        {
            (Get-VULTRAPI "backups").backups
        }
    }
}