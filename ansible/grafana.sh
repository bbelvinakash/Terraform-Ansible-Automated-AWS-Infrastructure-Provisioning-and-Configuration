#!/bin/bash

# Update packages
apt update -y

# Install dependencies
apt install -y curl wget gnupg software-properties-common

# Create keyrings directory
mkdir -p /etc/apt/keyrings

# Add Grafana GPG key
curl -fsSL https://apt.grafana.com/gpg.key | \
gpg --dearmor -o /etc/apt/keyrings/grafana.gpg

# Add Grafana repository
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | \
tee /etc/apt/sources.list.d/grafana.list > /dev/null

# Update repository cache
apt update -y

# Install Grafana
apt install -y grafana

# Enable and start Grafana
systemctl daemon-reload
systemctl enable --now grafana-server

# Open firewall port
ufw allow 3000/tcp

# Verify service
systemctl status grafana-server --no-pager

echo "Grafana Installation Completed"