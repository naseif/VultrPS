function Invoke-VULTRAPI {
    <#
        .SYNOPSIS
        It calls the vultr Restful API
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)] 
        [string]$ApiEndPoint,
        [Parameter(Mandatory = $true)]
        [psobject]$Data,
        [string]$method = "Post"
    )

    process {
        $ApiKey = Get-VULTRAPIKEY
        $headers = @{
            'Authorization' = "Bearer $ApiKey"
        }
        $params = $Data | ConvertTo-Json
        $result = Invoke-WebRequest -Uri "https://api.vultr.com/v2/$ApiEndPoint" -Method $method -Headers $headers -Body $params -ContentType "application/json"
        $result.content | ConvertFrom-Json
    }

}