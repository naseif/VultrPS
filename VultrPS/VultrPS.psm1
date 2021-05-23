<#
    VULTR API
    
    Automate the creation and provisioning of environments using vultr
#>
$ErrorActionPreference = "Stop"

Push-Location $PSScriptRoot

Get-ChildItem -Filter "*.ps1" -Recurse | 
	ForEach-Object {
        # Write-Host "  - loading $($_.Fullname)..."
		. ($_.Fullname)
    }

Pop-Location
