#!/bin/bash

# Options
poweroff=' Poweroff';
reboot=' Reboot';
lock=' Lock';
suspend=' Suspend';
logout=' Logout';

uptime=$(uptime -p | cut -b 4- -)

choice=$(printf "$poweroff\n$reboot\n$lock\n$suspend\n$logout" | rofi -dmenu -p "  " -mesg "Uptime: $uptime" -i -theme ~/.config/rofi/power.rasi);

case "$choice" in
  $poweroff) poweroff ;;
  $reboot) reboot ;;
  $lock) xdg-screensaver lock ;;
  $suspend) systemctl suspend ;;
  $logout) pkill -KILL -u $(whoami);;
  *) exit 1 ;;
esac
