function Update-VULTRStartupScript {
    <#
        .SYNOPSIS

    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$Name,
        [Parameter(Mandatory=$true)]
        [string]$ScriptCode
    )
    
    process {
        $data = @{
            name = $Name
            script = [System.Text.Encoding]::UTF8.GetBytes($ScriptCode)
        }
        
        Invoke-VULTRAPI -ApiEndPoint "startup-scripts/$StartupScriptId" -Data $data -method "PATCH"        
    }
}