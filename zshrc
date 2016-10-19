#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [ -f .environmentrc ];then
    . ~/.environmentrc
fi
if [ -f .proxyrc ];then
    . ~/.proxyrc
fi

setopt   inc_append_history     # 履歴をインクリメンタルに追加
setopt   hist_ignore_dups       # 重複を記録しない
setopt   extended_history       # 開始と終了を記録
setopt   share_history          # 履歴を共有
setopt   hist_ignore_all_dups   # ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt   hist_verify            # ヒストリを呼び出してから実行する間に一旦編集可能
setopt   hist_reduce_blanks     # 余分な空白は詰めて記録
setopt   hist_save_no_dups      # 古いコマンドと同じものは無視
setopt   hist_no_store          # historyコマンドは履歴に登録しない
setopt   hist_expand            # 補完時にヒストリを自動的に展開
setopt   bang_hist              # !を使った履歴展開を行う(d)
setopt   extended_history       # 履歴に実行時間も保存する
setopt   hist_find_no_dups      # ラインエディタでヒストリ検索し、ヒットした場合でも重複したものとみなさない
setopt   hist_no_functions      # 関数定義のためのコマンドは履歴から削除する
setopt   hist_no_store          # 履歴参照のコマンドは履歴に登録しない

# インクリメンタルからの検索
bindkey "^r" history-incremental-search-backward
bindkey "^s" history-incremental-search-forward
# history search
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward

function register-function-if-exist-peco() {
    bind=$1
    func=$2

    if which peco > /dev/null; then
        bindkey ${bind} ${func}
    fi
}

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | eval $tac | awk '!a[$0]++' | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
register-function-if-exist-peco '^r' peco-select-history

function peco-src () {
    local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
register-function-if-exist-peco '^]' peco-src

# alias a='fasd -a'        # any
# alias s='fasd -si'       # show / search / select
# alias d='fasd -d'        # directory
# alias f='fasd -f'        # file
# alias sd='fasd -sid'     # interactive directory selection
# alias sf='fasd -sif'     # interactive file selection
# alias z='fasd_cd -d'     # cd, same functionality as j in autojump
# alias zz='fasd_cd -d -i' # cd with interactive selection

function peco-fasd-search
{
    which peco fasd > /dev/null
    if [ $? -ne 0 ]; then
        echo "Please install peco and fasd"
        return 1
    fi
    local res=$(fasd | sort -rn | cut -c 12- | peco)
    if [ -n "$res" ]; then
        BUFFER+=" $res"
        zle accept-line
    else
        return 1
    fi
}
zle -N peco-fasd-search
register-function-if-exist-peco '^f' peco-fasd-search

