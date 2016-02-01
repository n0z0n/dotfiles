#!/bin/sh

if [ "$(uname)" == 'Darwin' ]; then
	OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
	OS='Linux'
elif [ "$(expr substr $(uname -s) 1 9)" == 'CYGWIN_NT' ]; then
	OS='Cygwin'
	GHQ_ROOT=`cygpath -wa ${HOME}`
	git config --global ghq.root ${GHQ_ROOT}
else
	echo "Your platform ($(uname -a)) is not supported."
	exit 1
fi



