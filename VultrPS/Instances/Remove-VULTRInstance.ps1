function Remove-VULTRInstance {
    <#
        .SYNOPSIS
        Remove a vultr instance or all instances
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$InstanceId
    )
    
    process {
        $data = @{}
        
        Invoke-VULTRAPI -ApiEndPoint "instances/$instanceId" -Data $data -method "DELETE"
    }
}