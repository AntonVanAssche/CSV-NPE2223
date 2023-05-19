#!/bin/bash

# Variabels
connection="Wired connection 1"
new_ip="192.169.45.55/24"
gateway_ip="192.168.45.1"

# Install and Update
sudo apt update -y
sudo apt install network-manager -y

# configure IP
nmcli con mod "$connection" ipv4.method manual ipv4.addresses "$new_ip"
nmcli con mod "$connection" ipv4.gateway $gateway_ip
nmcli con mod "$connection" ipv4.method manual
nmcli connection reload 
