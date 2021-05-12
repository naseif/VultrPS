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

function New-VULTRInstance {
    <#
        .SYNOPSIS
        It creates a new vultr instance
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ApiKey,
        [Parameter()]
        [string]$Region = "ams",
        [Parameter()]
        [string]$Plan = "vc2-4c-8gb",
        [Parameter()]
        [string]$OsId = "387"
    )

    
    process {
        $data = @{
            region = $Region
            plan   = $Plan
            os_id  = $OsId
        }
        
        $instance = Invoke-VULTRAPI -ApiKey $apikey -ApiEndPoint "instances" -Data $data
        $instance.instance
    }
}
