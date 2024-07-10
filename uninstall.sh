#!/bin/bash

source .env

docker compose down

sudo ip link set wg-lan down
sudo ip route del $subnet dev wg-lan
sudo ip addr del $subnet dev wg-lan
sudo ip link del wg-lan

docker system prune -a

docker volume prune