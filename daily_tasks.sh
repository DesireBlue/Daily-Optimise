#!/bin/bash

# Function to get uptime in seconds
get_uptime_seconds() {
    # Try to get uptime using 'uptime' command
    local uptime=$(uptime | awk '{print $3}' | cut -d',' -f1)
    
    # Check if uptime is a number
    if [[ $uptime =~ ^[0-9]+$ ]]; then
        echo $uptime
    else
        # Fallback: Calculate uptime from 'proc' filesystem
        local uptime_seconds=$(cut -d' ' -f1 /proc/uptime)
        echo ${uptime_seconds%%.*}
    fi
}

# Change directory to your Git repository
cd /root/Daily-Optimise

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

# Countdown from 10 to 0
echo "Countdown from 10 to 0:"
for ((i=1; i>=3; i--)); do
    echo -n "$i "
    sleep 1
done
echo ""  # Move to next line after countdown

# Clear the screen
clear

# Wait for 3 seconds
sleep 3

# Get uptime in seconds
uptime_seconds=$(get_uptime_seconds)

# Reboot if uptime is more than 12 hours (43200 seconds)
if [[ $uptime_seconds -gt 43200 ]]; then
    echo "Server uptime is more than 12 hours. Rebooting..."
    sudo reboot
else
    echo "Server uptime is less than 12 hours. Not need to rebooting."
fi

echo "Daily tasks completed. enjoy your vps"
