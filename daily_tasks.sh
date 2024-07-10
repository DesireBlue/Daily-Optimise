#!/bin/bash

# Function to get uptime in seconds
get_uptime_seconds() {
    # Get uptime in seconds using 'uptime' command and 'awk'
    local uptime_seconds=$(uptime | awk '{split($3,a,":"); print a[1]*86400 + a[2]*3600 + a[3]*60}')

    echo $uptime_seconds
}

# Change directory to your Git repository
cd /root/Daily-Optimise

# Update from GitHub
echo "Updating from GitHub..."
git fetch origin
git reset --hard origin/main

# Clear the screen
clear
#LOGO
print_logo() {
    echo -e "               ###    ###                          ##                  ##               ##        
 ## ##          ##     ##                  ####    ##                  ##              ##         
 ## ##          ##     ##                  ## ##           #           ##              ##     ##  
 ## ##   ###    ##     ##     ###          ## ##  ###    # # #   ####  ####           ##      ##  
 #####  ## ##   ##     ##    ## ##         ####    ##     ###   ##     ## ##          ##          
 ## ##  #####   ##     ##    ## ##         ## ##   ##    # # #  ##     ## ##          ##          
 ## ##  ##      ##     ##    ## ##         ## ##   ##      #    ##     ## ##           ##     ##  
 ## ##   ###   ####   ####    ###          ####   ####           ####  ## ##           ##     ##  
                                                                                        ##        "


}
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
for ((i=10; i>=7; i--)); do
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

# Reboot if uptime is more than or equal to 1 day (86400 seconds)
if [[ $uptime_seconds -ge 86400 ]]; then
    echo "Server uptime is 1 day or more (${uptime_seconds} seconds). Rebooting..."
    sudo reboot
else
    echo "Server uptime is less than 1 day (${uptime_seconds} seconds). Not rebooting."
fi

echo "Daily tasks completed. Enjoy your VPS!"
