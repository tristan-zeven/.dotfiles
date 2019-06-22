# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars pushd_ignore_dups
DIRSTACKSIZE=5

# enable extended globbing
setopt extendedglob

# allor [ or ] wherever you want
unsetopt nomatch

# if unset, the cursor is set to the end of the word if completion is started. Otherwise ot stays there and completion is done from both ends
setopt complete_in_word

# remove any right prompt from display when accepting a command line. This may be useful with terminals with other cut/paste methods
setopt transient_rprompt

