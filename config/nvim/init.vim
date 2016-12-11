if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
let s:toml_file_lazy = fnamemodify(expand('<sfile>'), ':h').'/dein_lazy.toml'
" if has("nvim")
" 	let s:toml_file_path = [$MYVIMRC, s:toml_file]
" else
" 	let s:toml_file_path = "~/.config/nvim/dein.toml"
" endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  if has("nvim")
    call dein#load_toml(s:toml_file,      {'lazy': 0})
    call dein#load_toml(s:toml_file_lazy, {'lazy': 1})
  else
    call dein#load_toml("~/.config/nvim/dein.toml",          {'lazy': 0})
    call dein#load_toml("~/.config/nvim/dein_lazy.toml",     {'lazy': 1})
  endif
  call dein#end()
  call dein#save_state()
endif

" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

" プラグイン以外のその他設定が続く
" :

filetype plugin indent on
syntax on
