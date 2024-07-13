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
echo "Countdown from 3 to 1:"
for ((i=3; i>=1; i--)); do
    echo -n "$i "
    sleep 1
done
echo ""  # Move to next line after countdown

# Clear the screen
clear
# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
RESET='\033[0m' # Reset color

# Function to print colored text
print_colored_text() {
    local color="$1"
    local text="$2"
    echo -e "${color}${text}${RESET}"
}

# Print colored text
print_colored_text $CYAN  "███████████████████████████████████
███████████████████████████████████
███████████████████████████████████
█████████████▒▒▒▒▒▒▒▒▒█████████████
█████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█████████
███████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒███████
██████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██████
█████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█████
█████▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒▒█████
████▒▒▒▒███▒▒▒▒▒▒▒▒▒▒▒▒▒███▒▒▒▒████
███▒▒▒▒██████▒▒▒▒▒▒▒▒▒██████▒▒▒▒███
███▒▒▒███▐▀███▒▒▒▒▒▒▒███▀▌███▒▒▒███
███▒▒▒██▄▐▌▄███▒▒▒▒▒███▄▐▌▄██▒▒▒███
███▒▒▒▒██▌███▒▒▒█▒█▒▒▒███▐██▒▒▒▒███
██▒▒▒▒▒▒███▒▒▒▒██▒██▒▒▒▒███▒▒▒▒▒▒██
█▒▒▒▒▒▒▒▒█▒▒▒▒██▒▒▒██▒▒▒▒█▒▒▒▒▒▒▒▒█
█▒▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒▒▒█
█▒▒▒▒█▒▒█▒▒▒▒██▒▒▒▒▒██▒▒▒▒█▒▒█▒▒▒▒█
██▒▒▒█▒▒█▒▒▒▒█▒██▒██▒█▒▒▒▒█▒▒█▒▒▒██
███▒█▒▒█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▒▒█▒███
█████▒▒█▒▒▒▐███████████▌▒▒▒█▒▒█████
███████▒▒▒▐█▀██▀███▀██▀█▌▒▒▒███████
███████▒▒▒▒█▐██▐███▌██▌█▒▒▒▒███████
███████▒▒▒▒▒▐▒▒▐▒▒▒▌▒▒▌▒▒▒▒▒███████
████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒████████
████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒████████
█████████▒▒█▒█▒▒▒█▒▒▒█▒█▒▒█████████
█████████▒██▒█▒▒▒█▒▒▒█▒██▒█████████
██████████████▒▒███▒▒██████████████
██████████████▒█████▒██████████████
███████████████████████████████████
███████████████████████████████████
YOUR VPS IS HACKED  !!  HA HA HA HA
"
# Wait for 5 seconds
sleep 2
# Clear the screen
clear
# Function to print colored text
print_colored_text() {
    local color="$1"
    local text="$2"
    echo -e "${color}${text}${RESET}"
}
# Print colored text
print_colored_text $CYAN  "
░░░░░░░░███████████████░░░░░░░░
░░░░░█████████████████████░░░░░
░░░░████████████████████████░░░
░░░██████████████████████████░░
░░█████████████████████████████
░░███████████▀░░░░░░░░░████████
░░███████████░░░░░░░░░░░░░░░███
░████████████░░░░░░░░░░░░░░░░██
░█░░███████░░░░░░░░░░░▄▄░░░░░██
█░░░░█████░░░░░░▄███████░░██░░█
█░░█░░░███░░░░░██▀▀░░░░░░░░██░█
█░░░█░░░░░░░░░░░░▄██▄░░░░░░░███
█░░▄█░░░░░░░░░░░░░░░░░░█▀▀█▄░██
█░░░░░░░░░░░░░░░░░░░░░░█░░░░██░
░███░░░░░░░░░░░░░░░░░░░█░░░░█░░
░░█░█░░░░░░░█░░░░░██▀▄░▄██░░░█░
░░█░█░░░░░░█░░░░░░░░░░░░░░░░░█░
░░░██░░░░░░█░░░░▄▄▄▄▄▄░░░░░░█░░
░░░██░░░░░░░█░░█▄▄▄▄░▀▀██░░█░░░
░░░██░░░░░░░█░░▀████████░░█░░░░
░░█░░█░░░░░░░█░░▀▄▄▄▄██░░█░░░░░
░░█░░░█░░░░░░░█░░░░░░░░░█░░░░░░
░█░░░░░█░░░░░░░░░░░░░░░░█░░░░░░
░░░░░░░░█░░░░░░█░░░░░░░░█░░░░░░
░░░░░░░░░░░░░░░░████████░░░░░░░
IT WAS A JOKE ! ! ! JA JA JA JA 
"
# Wait for 2 seconds
sleep 2
# Function to get uptime in seconds
get_uptime_seconds() {
    # Use cut to extract the uptime portion and then process it
    uptime_seconds=$(uptime | cut -d " " -f 5- | tr -d "," | awk -F'[: ]+' '{ print ($1 * 3600) + ($2 * 60) + $3 }')
    echo $uptime_seconds
}


# Get server uptime in seconds
uptime_output=$(uptime)
# Extract server uptime in seconds
uptime_seconds=$(echo "$uptime_output" | awk '{print $3}' | sed 's/,//')

# Define 1 day in seconds (82800 seconds)
one_day_in_seconds=82800

# Check server uptime and reboot if it's 1 day or more
if [[ $uptime_seconds -ge $one_day_in_seconds ]]; then
    echo "Server uptime is 1 day or more (${uptime_seconds} seconds). Rebooting..."
    sudo reboot
else
    echo "Server uptime is less than 1 day (${uptime_seconds} seconds). Not rebooting."
    echo "Daily tasks completed. Enjoy your server!"
fi
