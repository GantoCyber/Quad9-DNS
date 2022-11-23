#!/usr/bin/env bash

# Ensure the "Universe" repository is enabled and ensure the repositories are up to date
sudo add-apt-repository universe -y && sudo apt update -y && sudo apt upgrade -y

# Install Stubby
sudo apt install stubby

# Start and enable Stubby
sudo systemctl start stubby && sudo systemctl enable stubby

# Back up and replace the default stubby.yml file with the stubby.yml file attached to this support article
sudo mv /etc/stubby/stubby.yml /etc/stubby/stubby.backup.yml && sudo wget -O /etc/stubby/stubby.yml https://support.quad9.net/hc/en-us/article_attachments/4411087149453/stubby.yml

# Restart Stubby to recognize the new configuration
sudo service stubby restart

# Install requierement to test if stubby is active
sudo apt install net-tools

# Be sure stubby is active and running on the allocated IP and port
sudo netstat -lnptu | grep stubby
echo "Be sure that stubby is running on 127.0.0.1:53 for IPv4 or ::1:53 for IPv6"

# Test if your DNS have leaks (if you followed all the steps, it will work).
firefox dnsleaktest.com
