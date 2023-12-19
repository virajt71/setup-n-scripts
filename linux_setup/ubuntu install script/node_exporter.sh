echo ".............."
echo "Install node exporter"
echo ".............."
sudo useradd \
    --system \
    --no-create-home \
    --shell /bin/false node_exporter
wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz
tar -xvf node_exporter-1.7.0.linux-amd64.tar.gz
sudo mv \
  node_exporter-1.7.0.linux-amd64/node_exporter \
  /usr/local/bin/
rm -rf node_exporter*
node_exporter --version

cat <<EOF > /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

StartLimitIntervalSec=500
StartLimitBurst=5

[Service]
User=node_exporter
Group=node_exporter
Type=simple
Restart=on-failure
RestartSec=5s
ExecStart=/usr/local/bin/node_exporter \
    --collector.logind

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter
echo "prometheus installed"
