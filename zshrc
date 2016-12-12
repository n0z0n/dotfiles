#!/usr/bin/env zsh
PATH=/sbin:${PATH}
PATH=/bin:${PATH}
PATH=/usr/sbin:${PATH}
PATH=/usr/bin:${PATH}
PATH=/usr/local/sbin:${PATH}
PATH=/usr/local/bin:${PATH}
PATH=/usr/local/opt/findutils/libexec/gnubin:${PATH}
PATH=/usr/local/opt/coreutils/libexec/gnubin:${PATH}
export PATH

MANPATH=/usr/local/opt/findutils/libexec/gnuman:${MANPATH}
MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}
MANPATH=/usr/local/share/man:${MANPATH}
export MANPATH

[[ -e ~/.zplugrc ]]       && . ~/.zplugrc
[[ -e ~/.environmentrc ]] && . ~/.environmentrc
[[ -e ~/.proxyrc ]]       && . ~/.proxyrc

export   HISTFILE=${HOME}/.zshhistory  # 履歴ファイルの保存先
export   HISTSIZE=10000                # メモリに保存される履歴の件数
export   SAVEHIST=1000000              # 履歴ファイルに保存される履歴の件数
setopt   EXTENDED_HISTORY              # 開始と終了を記録
setopt   inc_append_history            # 履歴をインクリメンタルに追加
setopt   hist_ignore_dups              # 重複を記録しない
setopt   share_history                 # 履歴を共有
setopt   hist_ignore_all_dups          # ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt   hist_verify                   # ヒストリを呼び出してから実行する間に一旦編集可能
setopt   hist_reduce_blanks            # 余分な空白は詰めて記録
setopt   hist_save_no_dups             # 古いコマンドと同じものは無視
setopt   hist_no_store                 # historyコマンドは履歴に登録しない
setopt   hist_expand                   # 補完時にヒストリを自動的に展開
setopt   bang_hist                     # !を使った履歴展開を行う(d)
setopt   extended_history              # 履歴に実行時間も保存する
setopt   hist_find_no_dups             # ラインエディタでヒストリ検索し、ヒットした場合でも重複したものとみなさない
setopt   hist_no_functions             # 関数定義のためのコマンドは履歴から削除する

# インクリメンタルからの検索
bindkey "^r" history-incremental-search-backward
bindkey "^s" history-incremental-search-forward
# history search
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward

# if [[ "$TERM" == *screen* ]]; then
#     function ssh_tmux() {
#         eval server=\${$#}
#         tmux new-window -n $@ "exec ssh $@"
#     }
#     function man_tmux() {
#         eval server=\${$#}
#         tmux split-window "exec man $@"
#     }
#
#     alias ssh=ssh_tmux
#     alias man=man_tmux
# fi
#
#

autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=2


# 補完関数の表示を強化する
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''

# セパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

# ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
alias ls="ls --color=auto"

# 補完に関するオプション
# http://voidy21.hatenablog.jp/entry/20090902/1251918174
setopt auto_param_slash     # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs            # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt list_types           # 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
setopt auto_menu            # 補完キー連打で順に補完候補を自動で補完
setopt auto_param_keys      # カッコの対応などを自動的に補完
setopt interactive_comments # コマンドラインでも # 以降をコメントと見なす
setopt magic_equal_subst    # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt complete_in_word     # 語の途中でもカーソル位置で補完
setopt always_last_prompt   # カーソル位置は保持したままファイル名一覧を順次その場で表示
setopt print_eight_bit      # 日本語ファイル名等8ビットを通す
setopt extended_glob        # 拡張グロブで補完(~とか^とか。例えばless *.txt~memo.txt ならmemo.txt 以外の *.txt にマッチ)
setopt globdots             # 明確なドットの指定なしで.から始まるファイルをマッチ
bindkey "^I" menu-complete  # 展開する前に補完候補を出させる(Ctrl-iで補完するようにする)

setopt brace_ccl                                                    # 範囲指定できるようにする
zstyle ':completion:*:manuals' separate-sections true               # manの補完をセクション番号別に表示させる
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters # 変数の添字を補完する
zstyle ':completion:*' use-cache true                               # apt-getとかdpkgコマンドをキャッシュを使って速くする
zstyle ':completion:*:cd:*' ignore-parents parent pwd               # cd は親ディレクトリからカレントディレクトリを選択しないので表示させないようにする
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'   # オブジェクトファイルとか中間ファイルとかはfileとして補完させない
