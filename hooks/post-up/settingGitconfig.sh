#!/bin/bash

if [ "$(uname)" == 'Darwin' ]; then
	OS='Mac'
	GHQ_ROOT=${HOME}/src
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
	OS='Linux'
	GHQ_ROOT=${HOME}/src
elif [ "$(expr substr $(uname -s) 1 9)" == 'CYGWIN_NT' ]; then
	OS='Cygwin'
	GHQ_ROOT=`cygpath -wa ${HOME}`/src
else
	echo "Your platform ($(uname -a)) is not supported."
	exit 1
fi

git config --global ghq.root ${GHQ_ROOT}


