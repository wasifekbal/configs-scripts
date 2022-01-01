#!/usr/bin/env bash

export LC_ALL=en_US.UTF-8

current_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $current_dir/utils.sh

HOST="https://ipinfo.io/ip"

get_ip() {
  if ping -q -c 1 -W 1 ipinfo.io &>/dev/null; then
    echo "$(curl -sL 'https://ipinfo.io/ip')"
  else
    echo "xxx.xxx.xxx.xxx"
  fi
}

main() {
  echo $(get_ip)
  RATE=$(get_tmux_option "@dracula-ip-rate" 5)
  sleep $RATE
}

main
