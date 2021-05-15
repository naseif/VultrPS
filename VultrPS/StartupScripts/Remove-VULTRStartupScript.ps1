function Remove-VULTRStartupScript {
    <#
        .SYNOPSIS
        Remove a startup script
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$StartupScriptId
    )
    
    process {
        $data = @{}
        
        Invoke-VULTRAPI -ApiEndPoint "startup-scripts/$StartupScriptId" -Data $data -method "DELETE"
    }
}