" neobundle settings
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

" ファイル関連
set encoding=utf-8                                              " エンコード
set fileencoding=utf-8                                         " ファイルエンコード
set fileencodings=utf-8,iso-2022-jp,iso-2022-jp-2,euc-jp,sjis
set termencoding=utf-8
set nobackup                                                   " バックアップをしない
set noswapfile                                                 " .swapファイルを作らない
set nowritebackup                                              " バックアップファイルを作らない
set viminfo=                                                   " viminfo を吐かない

" 検索
set hlsearch                                                   " 検索結果をハイライト表示
set ignorecase                                                 " 小文字の検索でも大文字も見つかるようにする
set incsearch                                                  " インクリメンタルサーチを行う
set smartcase                                                  " ただし大文字も含めた検索の場合はその通りに検索する

" UI
colorscheme molokai                                            " カラースキーマ
set background=dark                                            " 背景
set laststatus=2                                               " statusを常に表示
set matchpairs& matchpairs+=<:>                                " 対応括弧に<と>のペアを追加
set matchtime=3                                                " 対応括弧の表示秒数を3秒にする
set number                                                     " 行番号を表示
set ruler                                                      " 右下に表示される行・列の番号を表示する
set scrolloff=5                                                " スクロールする時に下が見えるようにする
set showcmd                                                    " コマンドを画面最下部に表示する
set showmatch                                                  " 対応括弧をハイライト表示する
set wrap                                                       " ウィンドウの幅より長い行は折り返され、次の行に続けて表示される
syntax on                                                      " シンタックスハイライト


set list                                                       " 不可視文字を表示
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲ " 不可視文字を表示
hi SpecialKey ctermfg=232 ctermbg=NONE guifg=LightGrey guibg=DarkGrey
hi NonText ctermfg=232 ctermbg=NONE guifg=LightGrey guibg=DarkGrey

" その他
" set infercase                                                  " 補完の際の大文字小文字の区別しない
set backspace=indent,eol,start                                 " バックスペースで各種消せるようにする
set hidden                                                     " 変更中のファイルでも、保存しないで他のファイルを表示
set history=10000                                              " コマンド、検索パターンを10000個まで履歴に残す
set mouse=a                                                    " マウスモード有効
set nocompatible                                               " compatibleオプションをオフにする
set noerrorbells                                               " error bellを消す
set nostartofline                                              " 移動コマンドを使ったとき、行頭に移動しない
set novisualbell                                               " visual bellを消す
set shiftwidth=2                                               " 自動インデントの各段階に使われる空白
set shiftround                                                 " インデントをshiftwidthの倍数に丸める
set switchbuf=useopen                                          " 新しく開く代わりにすでに開いてあるバッファを開く
set textwidth=0                                                " 入力されているテキストの最大幅を無効にする
set ttymouse=xterm2                                            " xtermとscreen対応
set vb t_vb=                                                   " visual bellを消す
set virtualedit=all                                            " 文字がない場所にもカーソルを移動できるようにする
set visualbell                                                 " visual bellを消す

" /{pattern}の入力中は「/」をタイプすると自動で「\/」が、
" ?{pattern}の入力中は「?」をタイプすると自動で「\?」が 入力されるようになる
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

"表示行単位で行移動する
nnoremap <silent> j gj
nnoremap <silent> k gk
"画面切り替え
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

"インサートモードでも移動
inoremap <c-d> <delete>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>
"<space>j, <space>kで画面送り
noremap [Prefix]j <c-f><cr><cr>
noremap [Prefix]k <c-b><cr><cr>

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %
" 入力モード中に素早くJJと入力した場合はESCとみなす
inoremap jj <Esc>
" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>
" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk
" vを二回で行末まで選択
vnoremap v $h
" TABにて対応ペアにジャンプ
nnoremap &lt;Tab&gt; %
vnoremap &lt;Tab&gt; %
" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>
" T + ? で各種設定をトグル
nnoremap [toggle] <Nop>
nmap T [toggle]
nnoremap <silent> [toggle]s :setl spell!<CR>:setl spell?<CR>
nnoremap <silent> [toggle]l :setl list!<CR>:setl list?<CR>
nnoremap <silent> [toggle]t :setl expandtab!<CR>:setl expandtab?<CR>
nnoremap <silent> [toggle]w :setl wrap!<CR>:setl wrap?<CR>

" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

" vim 起動時のみカレントディレクトリを開いたファイルの親ディレクトリに指定
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction

if has('unnamedplus')
    set clipboard& clipboard+=unnamedplus
else
    set clipboard& clipboard+=unnamed,autoselect
endif

" ~/.vimrc.localが存在する場合のみ設定を読み込む
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif

let g:clang_format#style_options = {
            \ "BasedOnStyle"                        : "Google",
            \ "AlignConsecutiveAssignments"         : "true",
            \ "AlignEscapedNewlinesLeft"            : "true",
            \ "AccessModifierOffset"                : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations"     : "true",
            \ "BinPackParameters"                   : "false",
            \ "BinPackArguments"                    : "false",
            \ "Standard"                            : "C++11"
            \ }

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
autocmd FileType c,cpp,objc ClangFormatAutoEnable


" FZF
set rtp+=~/.fzf
