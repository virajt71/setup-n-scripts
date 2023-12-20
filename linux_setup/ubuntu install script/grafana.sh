#!/bin/bash

echo ".............."
echo "Install grafana"
echo ".............."
sudo apt-get update
sudo apt-get install -y apt-transport-https software-properties-common
echo -n "$x"
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
echo -n "$x"
sudo apt-get update
sudo apt-get -y install grafana
echo -n "$x"
sudo systemctl enable grafana-server
sudo systemctl start grafana-server
echo -n "$x"
