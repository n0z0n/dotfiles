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

[[ -e ~/.zplugrc ]] && . ~/.zplugrc

