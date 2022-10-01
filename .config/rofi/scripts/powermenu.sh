#!/bin/bash

# Options
poweroff=' Poweroff';
reboot=' Reboot';
lock=' Lock';
suspend=' Suspend';
logout=' Logout';


ROFI_THEME="~/.config/rofi/power.rasi"

uptime=$(uptime -p | cut -b 4- -)
options="$poweroff\n$reboot\n$lock\n$suspend\n$logout" 

choice=$(echo -e $options | rofi -dmenu -p "  " -mesg "Uptime: $uptime" -i -theme $ROFI_THEME);

case "$choice" in
  $poweroff) poweroff ;;
  $reboot) reboot ;;
  $lock) xdg-screensaver lock ;;
  $suspend) systemctl suspend ;;
  $logout) pkill -KILL -u $(whoami);;
  *) exit 1 ;;
esac
