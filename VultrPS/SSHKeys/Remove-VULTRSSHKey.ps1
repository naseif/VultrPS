function Remove-VULTRSSHKey {
    <#
        .SYNOPSIS
        Remove a vultr ssh key
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$SSHKeyId
    )
    
    process {
        $data = @{}
        
        Invoke-VULTRAPI -ApiEndPoint "ssh-keys/$SSHKeyId" -Data $data -method "DELETE"
    }
}
