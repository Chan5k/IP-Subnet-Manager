#!/bin/bash

# This validates the ip addresses in the file
function valid_ip() {
    local ip=$1
    local stat=1

    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        OIFS=$IFS
        IFS='.'
        ip=($ip)
        IFS=$OIFS
        [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
        stat=$?
    fi
    return $stat
}

# Ask the user for the IP list file
read -p "Please enter the path to the IP list file: " ip_list

if [ ! -f "$ip_list" ]; then
    echo "File not found. Exiting."
    exit 1
fi

# Loop through the IP list and add the /24 IP addresses to the system
while read -r ip_address; do
    if valid_ip "$ip_address"; then
        ip_address_base=$(echo "$ip_address" | cut -d '.' -f 1-3)
        for i in {1..254}; do
            sudo ip addr add "$ip_address_base.$i/24" dev eth0
        done
        echo "Added $ip_address_base.0/24 subnet to the system."
    else
        echo "Invalid IP address: $ip_address. Skipping."
    fi
done < "$ip_list"

echo "Process complete."
