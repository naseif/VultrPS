function Get-VULTRSSHKeyLocalPath {
    [CmdletBinding()]
    param (
        
    )
    
    process {
        if ([bool]$IsLinux) {
            return "~/.ssh/id_rsa"
        }
        else {
            return(Join-Path $env:USERPROFILE ".ssh\id_rsa") 
        }
    }
}