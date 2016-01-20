set encoding=utf-8
set fileencodings=iso-2022-jp,iso-2022-jp-2,utf-8,euc-jp,sjis

set noerrorbells
set visualbell
set viminfo=

" neobundle settings {{{
if has('vim_starting')
  " neobundle $B$r%$%s%9%H!<%k$7$F$$$J$$>l9g$O<+F0%$%s%9%H!<%k(B
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    " vim $B$+$i%3%^%s%I8F$S=P$7$F$$$k$@$1(B neobundle.vim $B$N%/%m!<%s(B
    :call system("git clone http://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
endif

if filereadable(expand("~/.vim/vimrc.neobundle"))
  source ~/.vim/vimrc.neobundle
endif

syntax enable
set background=dark
colorscheme solarized



" set clang options for vim-clang
let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++1z -stdlib=libc++ --pedantic-errors'
let g:clang_auto = 1
