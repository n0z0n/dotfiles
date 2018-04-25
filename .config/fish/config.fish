set -x PATH      /home/linuxbrew/.linuxbrew/bin  $PATH
set -x MANPATH   (brew --prefix)/share/man:      $MANPATH
set -x INFOPATH  (brew --prefix)/share/info:     $INFOPATH

eval (direnv hook fish)
set -x fish_path .ghq/github.com/n0z0n/dotfiles/.config/fish
set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"
