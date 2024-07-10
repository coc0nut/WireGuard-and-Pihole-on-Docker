#!/bin/bash

if [ -f .env ]; then
    rm .env
fi

read -p "Enter the public ip or hostname for your server: " pubhost
read -sp "Enter your password for the WG and Pihole logins: " passw
read -p "Enter your timezone: " tz

echo "WG_HOST=${pubhost}" > .env
echo "WG_PASS=${passw}" >> .env
echo "TZ=${tz}" >> .env

ip_address=$(hostname -I | awk '{print $1}')
echo "ip: $ip_address"

nic=$(ip -o addr show | awk -v ip="$ip_address" '$4 ~ ip {print $2}')
echo "nic: $nic"

index_position=$(echo "$ip_address" | awk -F'.' '{print length($NF)}')
fullsubnet=${ip_address:0:-$index_position}0/24
echo "Fullsubnet: $fullsubnet"

echo "NIC=${nic}" >> .env
echo "SUBNET=${fullsubnet}" >> .env
echo "GW=${ip_address:0:-$index_position}1" >> .env
echo "WG_IP=${ip_address:0:-$index_position}230" >> .env
echo "PH_IP=${ip_address:0:-$index_position}231" >> .env

subnet=${ip_address:0:-$index_position}224/27
echo "wg client subnet: $subnet"

docker compose up -d

sudo ip link add wg-lan link $nic type macvlan mode bridge
sudo ip addr add $subnet dev wg-lan
sudo ip link set wg-lan up
sudo ip route add $subnet dev wg-lan
