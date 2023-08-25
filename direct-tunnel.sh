#!/bin/bash

# Colors
CYAN="\e[36m"
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
NC="\e[0m" # No Color

clear
# Prompt for port_config_kharej
read -p "${CYAN}Enter the port for config_kharej:${NC} " port_config_kharej

# Prompt for ip_kharej
read -p "${CYAN}Enter the IP address for ip_kharej:${NC} " ip_kharej

# Prompt for port_tunnel
read -p "${CYAN}Enter the port for tunnel:${NC} " port_tunnel

# Set up SSH tunnel command
ssh_tunnel_command="ssh -N -L *:${port_tunnel}:localhost:${port_config_kharej} root@${ip_kharej}"

# Check if SSH key authentication is already set up
if ! ssh-add -l &> /dev/null; then
    # Try to load the SSH key
    if ! ssh-add ~/.ssh/id_rsa &> /dev/null; then
        echo -e "${RED}Could not load the SSH key. Make sure it's in the default location (~/.ssh/id_rsa).${NC}"
        exit 1
    fi
fi

# Run the SSH tunnel command
echo -e "${GREEN}Setting up SSH tunnel...${NC}"
$ssh_tunnel_command

# Add the SSH tunnel command to the user's cron job
cron_command="@reboot $ssh_tunnel_command"
(crontab -l ; echo "$cron_command") | crontab -

echo -e "${GREEN}SSH tunnel set up and added to cron job.${NC}"
echo -e "${YELLOW}The SSH tunnel will be established on system startup.${NC}"

# Systemd service definition
echo "[Unit]
Description=Setup SSH Tunnel on Startup
After=network.target

[Service]
ExecStart=/path/to/setup_tunnel.sh
Restart=on-failure
User=your_username

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/ssh-tunnel.service

# Reload systemd and start the service
systemctl daemon-reload
systemctl start ssh-tunnel
systemctl enable ssh-tunnel
