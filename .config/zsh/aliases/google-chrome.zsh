alias chkill="ps ux | grep '[Cc]hrome --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

