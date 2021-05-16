function Enter-VULTRInstance {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]    
        [PSObject]$Instance
    )
  
    process {
        &ssh -i (Get-VULTRSSHKeyLocalPath) $Instance.main_ip -l root -o "StrictHostKeyChecking no" 
    }
}