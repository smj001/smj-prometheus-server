#!/bin/bash

echo "What's Your Host IP Address:"
echo " "
read HOST_IP
echo " "
echo "What's Your Host Prometheus Port:"
echo " "
read HOST_PORT
echo " "
echo "What's Your Target Hosts You Want to Monitor?"
echo "Please Enter Your Target Machin With This Example:"
echo "'IP:PORT'"
echo " "
echo "!! If you want to Monitor multiple exporters, you should compelete this section with this example: "
echo "'IP_1:PORT', 'IP_2:PORT'"
echo " "
read MONITOR_IP

sed -i "s/MONITOR_IP/$MONITOR_IP/g" prometheus.yml
sed -i "s/HOST_IP/$HOST_IP/g" prometheus.yml
sed -i "s/HOST_PORT/$HOST_PORT/g" prometheus.yml
sed -i "s/HOST_PORT/$HOST_PORT/g" docker-compose.yml

docker-compose up -d
sleep 10
docker-compose ps
