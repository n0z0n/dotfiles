#!/usr/bin/env zsh
PATH=/sbin:${PATH}
PATH=/bin:${PATH}
PATH=/usr/sbin:${PATH}
PATH=/usr/bin:${PATH}
PATH=/usr/local/sbin:${PATH}
PATH=/usr/local/bin:${PATH}
PATH=/usr/local/opt/findutils/libexec/gnubin:${PATH}
PATH=/usr/local/opt/coreutils/libexec/gnubin:${PATH}
export PATH

MANPATH=/usr/local/opt/findutils/libexec/gnuman:${MANPATH}
MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}
MANPATH=/usr/local/share/man:${MANPATH}
export MANPATH

export ZPLUG_HOME=~/.zplug
. ${ZPLUG_HOME}/init.zsh
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh

# Also prezto
zplug "modules/prompt", from:prezto

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

autoload -Uz promptinit
promptinit
prompt adam2
