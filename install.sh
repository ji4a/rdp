#!/bin/bash

export USER='joe'
export PASS='Nederland2022!!!'

ufw allow 3390/tcp

# Create user with password

useradd -m -s /bin/bash -p $(openssl passwd -1 $PASS) $USER

# Update the OS and install ubuntu-gnome-desktop

apt update -y
apt install ubuntu-gnome-desktop gnome-remote-desktop -y

# Install XRDP 

apt install xrdp -y
sed -i 's/3389/3390/g' /etc/xrdp/xrdp.ini
systemctl enable xrdp
systemctl restart xrdp


apt install openjdk-19-jre-headless -y
sudo snap install android-studio --classic


# Finishing up
apt-get clean
rm -rf /var/lib/apt/lists/*
shutdown -r now
