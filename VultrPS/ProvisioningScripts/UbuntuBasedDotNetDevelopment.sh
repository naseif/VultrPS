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
echo -e "$dynamicPassword\n$dynamicPassword" | passwd developer
usermod --shell /bin/bash developer
usermod -aG sudo developer

echo 'export DOTNET_ROOT="/snap/dotnet-sdk/current"' >> /home/developer/.bashrc

