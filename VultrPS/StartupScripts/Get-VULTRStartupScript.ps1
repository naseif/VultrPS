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
            $temp = (Get-VULTRAPI "startup-scripts/$StartupScriptId").startup_script
            $temp.script = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($temp.script))
            $temp 
        }
        else {
            (Get-VULTRAPI "startup-scripts").startup_scripts
        }
    }
}
