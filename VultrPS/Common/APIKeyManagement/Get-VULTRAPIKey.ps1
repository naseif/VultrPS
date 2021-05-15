function Get-VULTRAPIKey {
    <#
        .SYNOPSIS
        Retrieves the VULTR API Key
    #>
    [CmdletBinding()]
    param (
    )
    
    process {
        $filename = Join-Path $PSScriptRoot "vultr.apikey"
        Write-Verbose "  - $(Get-Date) Reading API key from $filename..."
        if ( -not (Test-Path $filename) ) {
            throw "You don't have an API key stored yet. Use Set-VULTRAPIKey to change that."
        }

        Get-Content $filename
    }
}