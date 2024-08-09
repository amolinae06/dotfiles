#!/bin/sh

# tofi powermenu
case $(printf "%s\n" "Shut down" "Reboot" "Suspend" "Hibernate" | tofi -c ~/.config/tofi/configfs) in
	"Shut down")
		loginctl poweroff
		;;
	"Reboot")
		loginctl reboot
		;;
	"Suspend")
		loginctl suspend
		;;
	"Hibernate")
		loginctl hibernate
		;;
esac
