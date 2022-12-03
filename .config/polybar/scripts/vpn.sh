#!/bin/bash

check_tun0=$(ip a s tun0 2>&1)

if [ "$check_tun0" = "Device \"tun0\" does not exist." ]; then
    echo "";
    exit 0;
else
    output=$(ip a s tun0 | grep inet | awk 'NR==1 {print $2}')
    echo $output;
fi
