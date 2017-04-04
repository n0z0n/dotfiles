#!/bin/bash -x
# init fish

which fish
if [ $? = 0 ]; then
	chsh -s "$(which fish)"
else
	echo "please install fish"
	echo "sudo apt install fish"
	exit
fi

# install ghq
export GOPATH=${HOME}/.local/
git config --global ghq.root "${HOME}/.local/src"
go get github.com/motemen/ghq

GHQ=${GOPATH}bin/ghq

# clone dotfiles from github
${GHQ} get n0z0n/dotfiles
cd "$(${GHQ} list -p | grep n0z0n/dotfiles)"
git flow init -d
git submodule update --init

cd ~

# install pyenv
${GHQ} get yyuu/pyenv
ln -s -f "$($GHQ list -p | grep pyenv)" "${HOME}/.pyenv"
export PYENV_ROOT=${HOME}/.pyenv
export PATH=${PYENV_ROOT}/bin:${PATH}
eval "$(pyenv init -)"
pyenv install 3.6.0
pyenv global 3.6.0
pip install -r "$(${GHQ} list -p | grep n0z0n)/requirements.txt"

# install fisher
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher

# install fzf
${GHQ} get junegunn/fzf
cd "$(${GHQ} list -p | grep junegunn/fzf)"
./install --all

ln -s -f "$(${GHQ} list -p | grep n0z0n)/rcrc" ~/.rcrc
rcup -f

rcdn zplug
rcdn zplugrc
rcdn zshrc


