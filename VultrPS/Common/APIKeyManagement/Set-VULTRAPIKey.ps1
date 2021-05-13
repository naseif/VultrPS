function Set-VULTRAPIKey {
    <#
        .SYNOPSIS
        Sets the VULTR API Key
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$APIKey
    )
    
    process {
        $filename = Join-Path $PSScriptRoot "vultr.apikey"
        Write-Verbose "  - $(Get-Date) Writing API key to $filename..."
        $APIKey | Set-Content $filename
    }
}