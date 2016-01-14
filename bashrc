## This file is free software; you can redistribute it and/or
## modify it under the terms of the GNU General Public License as
## published by the Free Software Foundation; either version 2 of
## the License, or (at your option) any later version.

## This file is distributed in the hope that it will be
## useful, but WITHOUT ANY WARRANTY; without even the implied
## warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
## PURPOSE.  See the GNU General Public License for more details.

## You should have received a copy of the GNU General Public
## License along with this file; if not, write to the Free
## Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
## MA 02111-1307, USA.

## ####################################################################
## @ 環境設定

   # エディタ
     export EDITOR
     EDITOR='vim'

   # ページャー
     export PAGER
     PAGER='less'

   # 新規ファイルの権限を設定
     umask 022

   # スクリプト中の CRを無視
     set -o igncr


## ####################################################################
## @ コマンド補完

   # 無入力時の補完を無視
     shopt -s no_empty_cmd_completion

   # ディレクトリの補完
     complete -d cd

   # コマンドの補完
     complete -c man command type which

   # シェルオプションの補完
     complete -A setopt set
     complete -A shopt shopt

   # エイリアスの補完
     complete -a unalias

   # ビルドインコマンドの補完
     complete -b builtin

   # キーバインドの補完
     complete -A binding bind

   # bash completionの読み込み
   # if [ -f /etc/bash_completion ]; then
   #     . /etc/bash_completion
   # fi


## ####################################################################
## @ コマンド履歴

   # 履歴ファイルの最大履歴数
     export HISTFILESIZE
     HISTFILESIZE='10240'

   # 実行中プロセスの最大履歴数
     export HISTSIZE
     HISTSIZE='10240'

   # 連続した重複履歴を排除
     export HISTCONTROL
     HISTCONTROL='ignoredups'

   # 1～3文字のコマンドと exitを履歴記録対象から除外
     export HISTIGNORE
     HISTIGNORE='?:??:???:exit'

   # 複数行コマンドのコマンド履歴を追加
     shopt -s cmdhist

   # 編集バッファにコマンド履歴を読み込み
     shopt -s histverify
     shopt -s histreedit

   # コマンド履歴の追記モードを無効化
     shopt -u histappend

   # 複数端末間でコマンド履歴を共有
     export PROMPT_COMMAND
     PROMPT_COMMAND="history -a; history -c; history -r"


## ####################################################################
## @ ターミナル

   # 画面サイズ（LINES/COLUMNS）を自動更新
     shopt -s checkwinsize
     export LINES COLUMNS

   # XON/XOFF によるフローコントロールを有効化
     stty -ixon

   # 入力バッファ状態に応じた start/stopキャラクタの送信機能を有効化
     stty -ixoff

   # C-Vによるクリップボード貼り付けのため、quoted-insertを無効化
   # stty lnext ^q stop undef start undef

   # コマンドプロンプト
     export PS1 PS2
     case $TERM in
         xterm*|emacs)
             PS1="\$(
                 retv=\$?    
                 fg=\$(test \$retv -eq 0 && echo \"\[\e[0m\e[0;32m\]\" || echo \"\[\e[0m\e[0;33m\]\")
                 bg=\$(test \$retv -eq 0 && echo \"\[\e[0;32;42m\]\"   || echo \"\[\e[0;33;43m\]\")
                 echo
                 echo -e \" \$bg#\$fg Host: \H | Time: \D{%Y-%m-%d %H:%M:%S} | User: \u | Retv: \$retv\[\e[0m\]\"
                 echo -e \" \$bg#\$fg Path: \w\[\e[0m\]\"
                 echo -e \" \$bg#\$fg # \[\e[0m\]\"
             )"
             PS1="\$(
                 echo -ne \"\e]0;\$TERM_TITLE\a\"
                 bar=\" \[\e[0;31;41m\]#\[\e[0m\e[0;37m\] \"
                 echo -ne \"\n\"
                 echo -ne \"\${bar}Host: \H | Time: \D{%Y-%m-%d %H:%M:%S} | User: \u\n\"
                 echo -ne \"\${bar}Path: \w\n\"
                 echo -ne \"\${bar}# \[\e[0m\]\"
             )"
             PS2="   > "
             function check_return_code {
                 retv=$?
                 if [[ ! $check_return_code ]] ; then
                     check_return_code=1
                     return
                 fi
                 if [[ $retv -eq 0 ]] ; then
                     echo -ne "\n\e[0;32m ✔ \e[0;37mSuccess (retv = $retv)\n\e[2;32m "
                 else
                     echo -ne "\n\e[0;33m ✗ \e[0;37mFailure (retv = $retv)\n\e[2;33m "
                 fi
                 for (( x=1; x<$COLUMNS; x++ )) ; do echo -ne "\e(0q\e(B" ; done
                 echo -ne "\e[0m\n"
             }
             export PROMPT_COMMAND
             PROMPT_COMMAND="check_return_code; $PROMPT_COMMAND"

             ;;
         dumb|*)
             PS1="\n[Host: \H | Time: \D{%Y-%m-%d %H:%M:%S} | User: \u | Retv: \$? ]\n[Path: \w]\n# "
             PS2="> "
             ;;
     esac

   # タイトル
     export TERM_TITLE
     TERM_TITLE="bash @$HOSTNAME"


## ####################################################################
## @ less

   # オプション
     export LESS
     LESS=
     LESS="$LESS --line-numbers"                # 行番号を非表示
     LESS="$LESS --no-init"                     # termcap初期化文字列の送信を抑止
     LESS="$LESS --quit-if-one-screen"          # 単一ページ表示時に lessを自動終了
     LESS="$LESS --RAW-CONTROL-CHAR"            # 制御文字を処理して表示
     LESS="$LESS --hilite-search"               # 検索マッチ文字列をハイライト
     LESS="$LESS --jump-target=10"              # ターゲット行を10行目に指定
     LESS="$LESS --chop-long-lines --shift 5"   # 折り返し表示無効
     LESS="$LESS -P?f--Less-- %f\: %pb\%"

   # 配色（太字）
     export LESS_TERMCAP_mb LESS_TERMCAP_md LESS_TERMCAP_me
     LESS_TERMCAP_mb=$'\e[1;36m'    # begin blinking
     LESS_TERMCAP_md=$'\e[1;36m'    # begin bold
     LESS_TERMCAP_me=$'\e[0m'       # end mode

   # 配色（モードライン）
     export LESS_TERMCAP_se LESS_TERMCAP_so
     LESS_TERMCAP_so=$'\e[1;44m'    # begin standout-mode - info box
     LESS_TERMCAP_se=$'\e[0m'       # end standout-mode
 
   # 配色（アンダーライン）
     export LESS_TERMCAP_ue LESS_TERMCAP_us
     LESS_TERMCAP_us=$'\e[4;33m'    # begin underline
     LESS_TERMCAP_ue=$'\e[0m'       # end underline

   # ソースコードのハイライト
     export LESSOPEN
     LESSOPEN="| src-hilite-lesspipe.sh %s"


## ####################################################################
## @ コマンド

   # エイリアス定義をリセット
     unalias -a

   # builtin
     alias ..='cd ..'
     alias ...='cd ../..'
     alias ....='cd ../../..'

   # coreutils
     case $TERM in
         xterm*)
               export LS_COLORS='no=00:fi=00:di=01;35:ln=01;36:pi=40;33:so=01;32:do=01;32:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.svgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.xz=01;31:';
               alias ls='env LC_COLLATE=en_US.utf8 ls -A -F --show-control-char -x --color=always'
               ;;
         emacs)
               export LS_COLORS='no=00:fi=00:di=35:ln=36:ex=32'
               alias ls='env LC_COLLATE=en_US.utf8 ls -A -F --show-control-char -x --color'
               ;;
         dumb|*)
               export LS_COLORS=
               alias ls='env LC_COLLATE=en_US.utf8 ls -A -F --show-control-char -x'
               ;;
     esac
     alias ll='ls -l --time-style=long-iso'
     alias la='ls -l -g -G --time-style=long-iso'
     alias l='ls -1'

     alias cp='cp -i -p'
     alias mv='mv -i'
     alias rm='rm -i'

     alias date='env LANG=C date'
     alias sort='env LC_ALL=C sort'
     alias df='df -H -m'
     alias du='du -H -m'

   # grep
     alias grep='env -u LC_CTYPE grep --color=always'
     alias zgrep='env -u LC_CTYPE zgrep --color=always'
     export GREP_COLOR='01;41'

   # diffutils
     alias sdiff='sdiff -l'
     alias pdiff='diff -aurN'

   # tree
     alias tree='tree -NF'
     alias ftree='tree -afipugsDf'

   # global
     alias gtags='gtags -v'
     alias htags='htags -vsF'

   # wget
     alias wget='wget --trust-server-names --timeout=60'

   # mintty
     alias cls='echo -ne "\ec\e[3J"'

   # windows native appliation
     alias ipconfig='cocot ipconfig'
     alias nslookup='cocot nslookup'
     alias netsh='cocot netsh'
     alias net='cocot net'
     alias shutdown='cocot shutdown'
     alias systeminfo='cocot systeminfo'
     alias tasklist='cocot tasklist'
     alias taskkill='cocot taskkill'
     alias xcopy='cocot xcopy'
     alias attrib='cocot attrib'


## ####################################################################
## @ ユーザ関数

   # クリップボード上のパスにディレクトリ移動
     function ccd {
         local dir="$(cat /dev/clipboard)"
         if [[ -d "$dir" ]] ; then
             builtin cd "$dir"
         else
             builtin cd /desktop
         fi
     }

   # ANISカラーコード表示
     function ansi_color {
         for a in 3 4 ; do
             for b in 0 1 2 4 7 ; do
                 for n in ${a}0 ${a}1 ${a}2 ${a}3 ${a}4 ${a}5 ${a}6 ${a}7 ; do
                     echo -en "\e[${b};${n}m"
                     echo -n  "\e[${b};${n}m"
                     echo -ne "\e[0m"
                     echo -n  "  "
                 done
                 echo
             done
             echo
         done
     }

   # コマンド未検出時の制御
     function command_not_found_handle {
         echo "$SHELL: $1: command not found"
         return 127
     }


## ####################################################################
## @ 配色設定

     case $TERM in
         xterm*)
           # . $HOME/.minttyrc.solarized.light
           # . $HOME/.minttyrc.solarized.dark
             . $HOME/.minttyrc.gnupack.dark
         ;;
     esac


## ####################################################################

## Local Variables:
## coding: utf-8
## mode: shell-script
## End:
