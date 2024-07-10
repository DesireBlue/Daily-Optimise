#!/bin/bash

# Change directory to your repository
cd /root/Daily-Optimise/daily_tasks.sh

# Update from GitHub
echo "Updating from GitHub..."
git fetch origin
git reset --hard origin/main

# Clear the screen
clear

# Display the pattern
echo -e "${pattern}"

# Display text below the pattern
echo -e "\code by : nDesireBlue"

echo "Running daily tasks..."

# Get server IP address
SERVER_IP=$(hostname -I | cut -d' ' -f1)

# Optimize server daily (replace with your optimization commands)
echo "Optimizing server..."
# Example: Run optimization commands here
# Example: sudo systemctl restart nginx

# Clear cache daily (replace with your cache clearing commands)
echo "Clearing cache..."
# Example: Clearing Redis cache
# Example: redis-cli FLUSHALL

## Speed up server daily (replace with your speed up commands)
echo "Speeding up server..."
# Example: Tune kernel parameters
# Example: sysctl -w vm.swappiness=10

# Cleaning RAM
echo "Cleaning RAM..."
sync
echo 3 > /proc/sys/vm/drop_caches
echo "Memory status after cleaning caches:"
free -h

# Cleaning old log files
echo "Cleaning old log files..."
sudo journalctl --vacuum-time=2weeks

# Cleaning package cache
echo "Cleaning package cache..."
sudo apt-get clean
sudo apt-get autoclean
sudo apt-get autoremove -y

# Cleaning temporary files
echo "Cleaning temporary files..."
sudo rm -rf /tmp/*

# Display disk space
echo "Disk space after cleaning:"
df -h

echo "Daily tasks completed."

