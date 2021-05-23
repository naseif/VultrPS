function New-VULTRInstance {
    <#
        .SYNOPSIS
        It creates a new vultr instance
    #>
    [CmdletBinding()]
    param (
        [string]$Region = "ams",
        [string]$Plan = "vc2-4c-8gb",
        [ArgumentCompleter({
                param( $CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters )
                $temp = $WordToComplete.Replace('"', '')
                (Get-VULTROperatingSystem) | 
                    Where-Object Name -like "*$temp*" | 
                    Foreach-Object {
                        $os = $_.Name
                        '"' + $os + '"'
                    }
            })]
        [ValidateScript( { ((Get-VULTROperatingSystem) | Where-Object Name -eq $_) })]
        [string]$OperatingSystem = "Ubuntu 20.04 x64",
        [string]$ProvisionUsingScript,
        [string]$label,
        [string]$hostname,
        [Switch]$WaitForResponsiveness
    )

    process {
        # translate the name of the OS into the id
        $OsId = (Get-VULTROperatingSystem | Where-Object Name -eq $OperatingSystem).id
        $SshKey = (Get-VULTRSSHKey).id

        $data = @{
            region = $Region
            plan   = $Plan
            os_id  = $OsId
        }

        if ([bool] $ProvisionUsingScript) {
            $WaitForResponsiveness = $true
            $script = New-VULTRStartupScript -name "VultrPS-temp" -type boot -ScriptCode $ProvisionUsingScript
            $data.script_id = $script.id
        }

        if ([bool]$label) {
            $data.label = $label
        }
        
        if ([bool]$hostname) {
            $data.hostname = $hostname
        }

        if ([bool]$SshKey) {
            $data.sshkey_id = @($SshKey)
        }
        
        $instance = Invoke-VULTRAPI -ApiEndPoint "instances" -Data $data

        Write-Host " - $(Get-Date) instance $($instance.instance.id) created..."
        if ( $WaitForResponsiveness ) {
            Wait-VULTRInstanceReady $instance.instance.id
            $instance.instance.main_ip = Get-VULTRInstanceIp $instance.instance.id

            if ([bool]$ProvisionUsingScript) {
                Remove-VULTRStartupScript -StartupScriptId $script.id
            }
        }

        $instance.instance
    }
}
