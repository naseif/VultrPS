<#
    VULTR API
    
    Automate the creation and provisioning of environments using vultr
#>
$ErrorActionPreference = "Stop"

Push-Location $PSScriptRoot

Get-ChildItem -Filter "*.ps1" -Recurse | 
	ForEach-Object {
		. ($_.Fullname)
}

Pop-Location