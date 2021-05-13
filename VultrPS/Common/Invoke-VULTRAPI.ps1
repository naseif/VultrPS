function Invoke-VULTRAPI {
    <#
        .SYNOPSIS
        It calls the vultr Restful API
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)] 
        [string]$ApiKey,
        [Parameter(Mandatory = $true)] 
        [string]$ApiEndPoint,
        [Parameter(Mandatory = $true)]
        [psobject]$Data
    )

    process {
        $headers = @{
            'Authorization' = "Bearer $ApiKey"
        }
        $params = $Data | ConvertTo-Json
        $result = Invoke-WebRequest -Uri "https://api.vultr.com/v2/$ApiEndPoint" -Method Post -Headers $headers -Body $params -ContentType "application/json"
        $result.content | ConvertFrom-Json
    }

}