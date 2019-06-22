# set KEYTIMEOUT to enable 'chording'
KEYTIMEOUT=18 # default was set to 40

# give us access to ^Q
stty -ixon

# vi mode
bindkey -v
bindkey jj vi-cmd-mode

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# handy keybindings
bindkey -M vicmd "^[[H" beginning-of-line
bindkey -M vicmd "^[[4~" end-of-line
bindkey -M vicmd "^A" beginning-of-line
bindkey -M vicmd "^E" end-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey "^Q" push-line-or-edit
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy" ;)

