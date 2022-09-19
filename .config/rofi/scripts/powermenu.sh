#!/bin/bash

choice=$(printf " Poweroff\n勒 Reboot\n Lock\n鈴 Suspend" | rofi -dmenu -i -theme-str '@import "power.rasi"');

case "$choice" in
  " Poweroff") poweroff ;;
  "勒 Reboot") reboot ;;
  " Lock") xdg-screensaver lock ;;
  "鈴 Suspend") systemctl suspend ;;
  *) exit 1 ;;
esac
