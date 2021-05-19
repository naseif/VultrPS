<#
    This script installs the VultrPS Module into your profile for easy usage
#>
$path = Join-Path $PSScriptRoot "VultrPS\VultrPS.psm1"
$content = "`nImport-Module '$path'`n"

if ( -not (Test-Path $profile) ) {
    New-Item $profile -Force
}

$content | Add-Content $profile -Force
