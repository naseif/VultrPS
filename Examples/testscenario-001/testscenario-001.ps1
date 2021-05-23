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

$installMailserver = "
#!/bin/bash

apt-get install golang-go
go get github.com/mailhog/MailHog
"
$mailserver  = New-VULTRInstance -hostname "Mail" -WaitForResponsiveness -ProvisionUsingScript $installMailserver

$installMySQL = "apt-get install mysql -y"
$mysqlserver = New-VULTRInstance -ProvisionUsingScript $installMySQL -hostname "Database" -label "Database" -WaitForResponsiveness

$password = New-VULTRRandomPassword

$developmentScript = "
#!/bin/bash

apt update
apt-get upgrade -y
export DEBIAN_FRONTEND=noninteractive
apt-get install xubuntu-core -y
apt-get install x2goserver x2goserver-xsession -y

snap install --classic code
snap install --classic dotnet-sdk
snap install --classic rider

useradd developer -d /home/developer -m 
echo -e `"$password\n$password`" | passwd developer
usermod --shell /bin/bash developer
usermod -aG sudo developer

echo 'export DOTNET_ROOT=`"/snap/dotnet-sdk/current`"' >> /home/developer/.bashrc
"

$development = New-VULTRInstance -hostname "Dev" -label "Dev" -ProvisionUsingScript $developmentScript -WaitForResponsiveness 

$documentation = New-Object -TypeName PSObject -Property @{
    Servers = $mailserver, $mysqlserver, $development
    DevPassword = $password
}
$documentation | ConvertTo-Json | Set-Content "environment-documentation.json" -Force

Write-Host "-----------------------------------------------------" -ForegroundColor Yellow
Write-Host "Developer Password is : $password" -ForegroundColor Yellow
Write-Host "-----------------------------------------------------" -ForegroundColor Yellow
Write-Host ""


