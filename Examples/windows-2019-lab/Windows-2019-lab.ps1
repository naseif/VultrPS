<#
    .SYNOPSIS
    Create a lab of n Windows 2019 servers for a bunch of people
#>

Set-Location $PSScriptRoot
$ErrorActionPreference = "Stop"

$ServerCount = 3

$setupScript = "
powershell -command `"Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))`"

C:\ProgramData\chocolatey\bin\choco install Firefox -y
C:\ProgramData\chocolatey\bin\choco install vscode -y
C:\ProgramData\chocolatey\bin\choco install nodejs -y
"

$instances = for ($i = 0; $i -lt $ServerCount; $i++) {
    New-VULTRInstance -OperatingSystem "Windows 2019 x64" -Plan "vc2-6c-16gb" -ProvisionUsingScript $setupScript
}

$instances | ConvertTo-Json | Out-File "environment-documentation.json" -Force
