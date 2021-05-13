function Get-VULTRAPI {
    <#
        .SYNOPSIS
        It calls the vultr Restful API
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)] 
        [string]$ApiKey,
        [Parameter(Mandatory = $true)] 
        [string]$ApiEndPoint
    )

    process {
        $headers = @{
            'Authorization' = "Bearer $ApiKey"
        }
        Invoke-RestMethod "https://api.vultr.com/v2/$ApiEndPoint" -Headers $headers
        
    }

}