<#
    Testscenario 001 

    - 1 ubuntu machine which works as a test mail server (using mailhog)
    - 1 ubuntu machine which works as a mysql server
    - 1 ubuntu machine which works as development environment for a nodejs based web site

#>

$operatingSystem = ((Get-VULTROperatingSystem) | 
    Where-Object Name -like 'Ubuntu*' | 
    Sort-Object id -Descending |
    Select-Object -First 1).name

$low_performance_plan  = "vc2-4c-8gb"
$high_performance_plan = "vc2-4c-8gb"

$region = "fra"

$mailserver  = New-VULTRInstance -OperatingSystem $operatingSystem -Plan $low_performance_plan -Region $region
$mysqlserver = New-VULTRInstance -OperatingSystem $operatingSystem -Plan $low_performance_plan -Region $region
$development = New-VULTRInstance -OperatingSystem $operatingSystem -Plan $high_performance_plan -Region $region

Wait-VULTRInstanceReady $mailserver.id
Wait-VULTRInstanceReady $mysqlserver.id
Wait-VULTRInstanceReady $development.id

$mailserver.main_ip  = Get-VULTRInstanceIp $mailserver.id
$mysqlserver.main_ip = Get-VULTRInstanceIp $mysqlserver.id
$development.main_ip = Get-VULTRInstanceIp $development.id

$mailserver.label  = "Mailserver"
$mysqlserver.label = "MySQLServer"
$development.label = "Development Machine"

$servers = $mailserver, $mysqlserver, $development
$servers | ConvertTo-Json | Set-Content "environment-documentation.json" -Force

Write-Host "Provisioning the systems..." -ForegroundColor Yellow

Invoke-VULTRRemoteExecution -FilePath ./update-packages.sh -Instance $mailserver

