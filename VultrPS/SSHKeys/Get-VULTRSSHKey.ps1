function Get-VULTRSSHKey {
    <#
        .SYNOPSIS
        Retrieve the list of available ssh keys 
    #>
    [CmdletBinding()]
    param (
        [string]$SshKeyId
    )
    
    process {
        if ([bool]$SshKeyId) {
            (Get-VULTRAPI "ssh-keys/$SshKeyId").ssh_key
        }
        else 
        {
            (Get-VULTRAPI "ssh-keys").ssh_keys
        }
    }
}
