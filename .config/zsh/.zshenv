#typeset -U path
#path=(/usr/sbin /sbin $path[@])

if [ -n "$DESKTOP_SESSION" ]; then
	eval $(gnome-keyring-daemon --start)
	export SSH_AUTH_SOCK
fi

BROWSER=/usr/bin/google-chrome
EDITOR=/usr/bin/nvim
VISUAL=$EDITOR

TERMINAL=/usr/local/bin/st

XDG_CONFIG_HOME=$HOME/.config
XDG_CACHE_HOME=$HOME/.cache


