#!/bin/bash

# Update from GitHub
echo "Updating from GitHub..."
git pull

# Define a pattern with •
pattern="
               ###    ###                          ##                  ##               ##        
 ## ##          ##     ##                  ####    ##                  ##              ##         
 ## ##          ##     ##                  ## ##           #           ##              ##     ##  
 ## ##   ###    ##     ##     ###          ## ##  ###    # # #   ####  ####           ##      ##  
 #####  ## ##   ##     ##    ## ##         ####    ##     ###   ##     ## ##          ##          
 ## ##  #####   ##     ##    ## ##         ## ##   ##    # # #  ##     ## ##          ##          
 ## ##  ##      ##     ##    ## ##         ## ##   ##      #    ##     ## ##           ##     ##  
 ## ##   ###   ####   ####    ###          ####   ####           ####  ## ##           ##     ##  
                                                                                        ##        
# Wait for 5 seconds (adjust as needed)
sleep 3    
                                                                             
# Clear the screen
clear

# Display the pattern
echo -e "${pattern}"

# Display text below the pattern
echo -e "\nDesireBlue"

echo "Running daily tasks..."

# Set your bot token and chat ID
BOT_TOKEN="YOUR_BOT_TOKEN"
CHAT_ID="YOUR_CHAT_ID"

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

# Send Telegram message if BOT_TOKEN and CHAT_ID are set
if [[ -n "${BOT_TOKEN}" && -n "${CHAT_ID}" ]]; then
    echo "Sending Telegram message..."
    message="Daily tasks completed. IP: ${SERVER_IP} *by : @the_nawid*"
    curl -s -X POST https://api.telegram.org/bot${BOT_TOKEN}/sendMessage -d chat_id=${CHAT_ID} -d text="${message}" -d parse_mode="MarkdownV2"
    echo "Telegram message sent."
else
    echo "Error: BOT_TOKEN or CHAT_ID is not set. Telegram message not sent."
fi

# Reboot server
echo "Rebooting server..."
sudo reboot

echo "Daily tasks completed."
