# big history for use with many open shells and no dups
# different history files for root and standard users

if (( ! EUID )); then	
	HISTFILE=/root/.config/zsh/.zsh_history
else
	HISTFILE=$HOME/.config/zsh/.zsh_history
fi

HISTSIZE=120000
SAVEHIST=100000

setopt share_history append_history extended_history hist_no_store hist_ignore_all_dups hist_ignore_space
export ERL_AFLAGS="-kernel shell_history enabled"
