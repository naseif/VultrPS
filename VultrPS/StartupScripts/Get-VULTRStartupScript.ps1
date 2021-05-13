function Get-VULTRStartupScript {
    <#
        .SYNOPSIS
        Get a specific startup script
    #>
    [CmdletBinding()]
    param (
        [string]$StartupScriptId
    )
    
    process {
        if ([bool]$StartupScriptId) {
            (Get-VULTRAPI "startup-scripts/$StartupScriptId").startup_script
        }
        else {
            (Get-VULTRAPI "startup-scripts").startup_scripts
        }
    }
}