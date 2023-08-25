#!/bin/bash

# Colors
CYAN="\e[36m"
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
BLUE="\e[34m"
NC="\e[0m"
WHITE="\e[0m"

# Function to continue after pressing Enter
press_enter() {
    echo -e "\n ${RED}Press Enter to continue... ${NC}"
    read
}

# Check if script is being run as root
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

# Calculate title width and padding
title_text="Create By OPIran\nTG-Group @OPIranCluB"
term_width=$(tput cols)
title_width=${#title_text}
padding=$(( (term_width - title_width) / 2 ))

# Display the floating title
echo -ne "${BLUE}"
for ((i = 0; i < padding; i++)); do echo -n " "; done
echo -e "${title_text}"
for ((i = 0; i < padding; i++)); do echo -n " "; done
echo -e "${NC}"

# Prompt for destination port
echo -ne "${CYAN}Enter the destination port (SSH / V2ray) (service on your foreign VPS):${NC} "
read port_config_kharej

# Prompt for destination IP address
echo -ne "${CYAN}Enter the destination IP address (2nd VPS or Foreign VPS):${NC} "
read ip_kharej

# Prompt for source port
echo -ne "${CYAN}Enter the source port for tunnel (Local VPS):${NC} "
read port_tunnel

# Prompt for destination username
echo -ne "${CYAN}Enter the destination username (e.g., root):${NC} "
read remote_user

# Prompt for script path
echo -ne "${CYAN}Give me the path of this script (ex. /etc/direct-tunnel.sh):${NC} "
read path

# Set up SSH tunnel command
ssh_tunnel_command="ssh -N -L *:${port_tunnel}:localhost:${port_config_kharej} ${remote_user}@${ip_kharej}"

# Check if SSH key authentication is already set up
if ! ssh-add -l &> /dev/null; then
    # Try to load the SSH key
    if ! ssh-add ~/.ssh/id_rsa &> /dev/null; then
        echo -e "${RED}Could not load the SSH key. Make sure it's in the default location (~/.ssh/id_rsa).${NC}"
        exit 1
    fi
fi

# Copy SSH key to remote server for passwordless authentication
ssh-copy-id ${remote_user}@${ip_kharej}

# Run the SSH tunnel command
echo -e "${GREEN}Setting up SSH tunnel...${NC}"
$ssh_tunnel_command

# Add the SSH tunnel command to the user's cron job
cron_command="@reboot $ssh_tunnel_command"
(crontab -l ; echo "$cron_command") | crontab -

echo -e "${GREEN}SSH tunnel set up and added to cron job.${NC}"
echo -e "${YELLOW}The SSH tunnel will be established on system startup.${NC}"

# Allow the user to press Enter to continue
press_enter

# Systemd service definition
echo "[Unit]
Description=OPIran Setup SSH Tunnel on Startup
After=network.target

[Service]
ExecStart=${path}
Restart=on-failure
User=your_username

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/ssh-tunnel.service

# Reload systemd and start the service
systemctl daemon-reload
systemctl start ssh-tunnel
systemctl enable ssh-tunnel

# Allow the user to press Enter to continue
press_enter
