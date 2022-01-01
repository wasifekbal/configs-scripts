#!/usr/bin/env bash
# setting the locale, some users have issues with different locales, this forces the correct one
export LC_ALL=en_US.UTF-8

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $current_dir/utils.sh

get_percent()
{
  total_mem=$(free -gh | awk '/^Mem/ {print $2}' | tr 'i' 'B')
  used_mem=$(free -gh | awk '/^Mem/ {print $3}' | tr 'i' 'B')
  echo $used_mem/$total_mem
}

main()
{
  # storing the refresh rate in the variable RATE, default is 5
  RATE=$(get_tmux_option "@dracula-refresh-rate" 3)
  ram_label=$(get_tmux_option "@dracula-ram-usage-label" "RAM")
  ram_percent=$(get_percent)
  echo "$ram_label $ram_percent"
  sleep $RATE
}

#run main driver
main
