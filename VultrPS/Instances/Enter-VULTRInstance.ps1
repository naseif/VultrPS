function New-VULTRSSHSession {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]    
        [string]$mainIp,
        [Parameter(Mandatory = $true)]
        [string]$default_password
    )
  
    process {
        $username = "root"
        $password = ConvertTo-SecureString $default_password -AsPlainText -Force
        $cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $password
        New-SSHSession -ComputerName $mainIp -Credential $cred -AcceptKey
    }
}