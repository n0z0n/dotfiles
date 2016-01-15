set encoding=utf-8
set fileencodings=iso-2022-jp,iso-2022-jp-2,utf-8,euc-jp,sjis

set noerrorbells
set visualbell
set viminfo=

if filereadable(expand("~/.vim/.vimrc.neobundle"))
  source ~/.vim/.vimrc.neobundle
endif

syntax enable
set background=dark
colorscheme solarized
