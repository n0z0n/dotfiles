set encoding=utf-8
set fileencodings=iso-2022-jp,iso-2022-jp-2,utf-8,euc-jp,sjis

set noerrorbells
set visualbell
set viminfo=

" neobundle settings {{{
if has('vim_starting')
  " neobundle をインストールしていない場合は自動インストール
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    " vim からコマンド呼び出しているだけ neobundle.vim のクローン
    :call system("git clone http://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
endif

if filereadable(expand("~/.vim/vimrc.neobundle"))
  source ~/.vim/vimrc.neobundle
endif

syntax enable
set background=dark
colorscheme solarized
