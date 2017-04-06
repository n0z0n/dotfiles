#!/bin/bash

export GOPATH=~/.local/
git config --global ghq.root "~/.local/src"
go get github.com/motemen/ghq
~/.local/bin/ghq get n0z0n/dotfiles

cd `$GOPATH/bin/ghq list -p | grep n0z0n`
git flow init -d
git flow feature track scratch
git submodule update --init
cd ~

${GOPATH}/bin/ghq get yyuu/pyenv
ln -s `$GOPATH/bin/ghq list -p | grep pyenv` ~/.pyenv
ln -s `$GOPATH/bin/ghq list -p | grep n0z0n`/rcrc ~/.rcrc

rcup
zsh -c vim