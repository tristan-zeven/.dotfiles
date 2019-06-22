#!/usr/bin/env sh

get_xrdb_value () {
  [[ ! -z "$1" ]] && echo $(xrdb -query | grep "^$1" | cut -f 2)
}

export COLOR_XRDB_FG=$(get_xrdb_value "*foreground")
export COLOR_XRDB_BG=$(get_xrdb_value "*background")
export POWER_MENU__POWER_OFF="%{B$COLOR_XRDB_BG}%{F$COLOR_XRDB_FG}%{R}  Power off   %{B- F-}"
export POWER_MENU__REBOOT="%{B$COLOR_XRDB_BG}%{F$COLOR_XRDB_FG}%{R}   Restart   %{B- F-}"
export POWER_MENU__SUSPEND="%{B$COLOR_XRDB_BG}%{F$COLOR_XRDB_FG}%{R}  Suspend   %{B- F-}"
export POWER_MENU__HIBERNATE="%{B$COLOR_XRDB_BG}%{F$COLOR_XRDB_FG}%{R}  Hibernate   %{B- F-}"
export POWER_MENU__LOGOUT="%{B$COLOR_XRDB_BG}%{F$COLOR_XRDB_FG}%{R}  Log-out   %{B- F-}"
export POWER_MENU__CONFIRM_YES="%{B$COLOR_XRDB_BG}%{F$COLOR_XRDB_FG}%{R}    Yes  %{B- F-}"
export POWER_MENU__CONFIRM_NO="%{B$COLOR_XRDB_BG}%{F$COLOR_XRDB_FG}%{R}  No  %{B- F-}"
export POWER_MENU__EMPTY="%{R}%{B$COLOR_XRDB_BG}%{F$COLOR_XRDB_FG}         %{B- F-}"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
	i=$(xrandr --query | grep " connected" | wc -l) || 1
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload "dp$i" &
		i=$(( i - 1 ))
	done
else
	echo "xrandr not found ..."
	polybar --reload dp1 &
fi
