set -x PATH      /home/linuxbrew/.linuxbrew/bin  $PATH
set -x MANPATH   (brew --prefix)/share/man:      $MANPATH
set -x INFOPATH  (brew --prefix)/share/info:     $INFOPATH

eval (direnv hook fish)
