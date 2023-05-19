#!/bin/bash

interface="Wired connection 2"
new_ip="192.168.45.55/24"
gateway_ip="192.168.45.1"
connection="eth1"

nmcli con mod "$interface" ipv4.addresses $new_ip
nmcli con mod "$interface" ipv4.gateway $gateway_ip
nmcli con up "$interface"

sudo ip link set $connection down && sudo ip link set "$connection" up