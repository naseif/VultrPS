# VultrPS
Powershell Module for vultr

- automate the creation of environments using the vultr cloud provider
- automatically provision the virtual machines
- destroy the virtual machines when not needed anymore

## Setup

### Powershell-Gallery

### Directly from git

## Example Usage

```powershell
Import-Module VultrPS
Set-Location $PSScriptRoot
$ErrorActionPreference = "Stop"

Write-Host "Setting up Development Environment...." -ForegroundColor Yellow
$apikey = Read-Host "Please enter your API Key"

$instance = New-VULTRInstance -ApiKey $apikey
#$instance = New-VULTRInstance -ApiKey $apikey -ProvisionUsing bla.sh

#$instanceIP = Get-VULTRInstanceIP -ApiKey $apikey -Instance $instance.Id

$instance | Format-List 
```


