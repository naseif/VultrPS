function New-VULTRStartupScript {
    <#
        .SYNOPSIS
        Creates a new startup script for usage during virtual machine creation
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$name,
        [ValidateSet("boot", "pxe")]
        [Parameter(Mandatory=$true)]
        [string]$type,
        [Parameter(Mandatory=$true)]
        [string]$ScriptCode
    )
    
    process {
        $script = [System.Text.Encoding]::UTF8.GetBytes($ScriptCode)
        $scriptbase64 = [Convert]::ToBase64String($script)

        $data = @{
            name = $name
            type = $type
            script = $scriptbase64
        }
        
        $script = Invoke-VULTRAPI -ApiEndPoint "startup-scripts" -Data $data -method "Post"
        $script.startup_script
    }
}
