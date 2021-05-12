<#
    Configures and start a development environment for Axolotl using vultr instances!
#>
Set-Location $PSScriptRoot
$ErrorActionPreference = "Stop"
. .\vultrAPI.ps1


Write-Host "Setting up Development Environment...." -ForegroundColor Yellow
$apikey = Read-Host "Please enter your API Key"

$instance = New-VULTRInstance -ApiKey $apikey
#$instance = New-VULTRInstance -ApiKey $apikey -ProvisionUsing bla.sh

#$instanceIP = Get-VULTRInstanceIP -ApiKey $apikey -Instance $instance.Id

$instance | Format-List 

