umask 0022
set -x PATH      ~/.linuxbrew/bin  $PATH
set -x MANPATH   (brew --prefix)/share/man:      $MANPATH
set -x INFOPATH  (brew --prefix)/share/info:     $INFOPATH

eval (direnv hook fish)
set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"
