#!/bin/bash

# Get current date in DD_MM_YY format
DATE=$(date +%d_%m_%Y)

# Output file name
OUTPUT_FILE="hardware_report_$DATE.txt"

# Collect system information
UPTIME=$(uptime -p)
TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3}')
OS_FAMILY=$(uname -o)
OS_VERSION=$(lsb_release -r | awk '{print $2}')
OS_NAME=$(lsb_release -d | awk -F'\t' '{print $2}')
KERNEL_VERSION=$(uname -r)
CPU_CORES=$(nproc)
CPU_ARCHITECTURE=$(uname -m)
PRIVATE_IP=$(hostname -I | awk '{print $1}')
PUBLIC_IP=$(curl -s ifconfig.me)
RAM_UTILIZATION=$(free -h | grep Mem | awk '{print $3 "/" $2}')

# Create a report file and write the information
{
    echo "Uptime: $UPTIME"
    echo "Current Server Local Timezone: $TIMEZONE"
    echo "OS Family: $OS_FAMILY"
    echo "OS Version: $OS_VERSION"
    echo "OS Name: $OS_NAME"
    echo "Kernel Version: $KERNEL_VERSION"
    echo "CPU - Cores: $CPU_CORES"
    echo "CPU - Architecture: $CPU_ARCHITECTURE"
    echo "Private IP: $PRIVATE_IP"
    echo "Public IP: $PUBLIC_IP"
    echo "RAM Utilization: $RAM_UTILIZATION"
} > "$OUTPUT_FILE"

# Display message indicating completion
echo "Hardware report saved to $OUTPUT_FILE"
