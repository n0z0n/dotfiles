# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/nozomi/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/nozomi/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */Users/nozomi/.fzf/man* && -d "/Users/nozomi/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/Users/nozomi/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/nozomi/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/nozomi/.fzf/shell/key-bindings.bash"

