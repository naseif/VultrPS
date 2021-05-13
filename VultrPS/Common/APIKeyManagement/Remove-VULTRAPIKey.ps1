function Remove-VULTRAPIKey {
    <#
        .SYNOPSIS
        Get rid of your stored api key
    #>
    [CmdletBinding()]
    param (
    )
    
    process {
        $filename = Join-Path $PSScriptRoot "vultr.apikey"
        Write-Verbose "  - $(Get-Date) Removing $filename..."
        if ( Test-Path $filename ) {
            Remove-Item $filename -Force
        }
    }
}