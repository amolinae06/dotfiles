#!/bin/sh

# tofi powermenu
case $(printf "%s\n" "Log out" "Shut down" "Reboot" "Suspend" | tofi -c ~/.config/tofi/configfs) in
  "Log out")
    hyprctl dispatch exit
    ;;
  "Suspend")
    loginctl suspend
    ;;
  "Reboot")
    loginctl reboot
    ;;
  "Shut down")
    loginctl poweroff
esac

