if &compatible
  set nocompatible
endif

" Vim起動完了時にインストール
augroup PluginInstall
  autocmd!
  autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END

" 各プラグインをインストールするディレクトリ
let s:plugin_dir = expand('~/.vim/bundle/')
" dein.vimをインストールするディレクトリをランタイムパスへ追加
let s:dein_dir = s:plugin_dir . 'repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_dir

" dein.vimがまだ入ってなければ 最初に`git clone`
if !isdirectory(s:dein_dir)
  call mkdir(s:dein_dir, 'p')
  silent execute printf('!git clone %s %s', 'https://github.com/Shougo/dein.vim', s:dein_dir)
endif


if dein#load_state(s:plugin_dir)
  call dein#begin(s:plugin_dir)

  " ここからインストールするプラグインを書いていく
  call dein#add('Shougo/dein.vim')
  call dein#add('tomasr/molokai')
  call dein#end()
  call dein#save_state()
endif


filetype plugin indent on
syntax enable

