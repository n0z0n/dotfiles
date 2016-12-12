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

setopt   inc_append_history   # 履歴をインクリメンタルに追加
setopt   hist_ignore_dups     # 重複を記録しない
setopt   extended_history     # 開始と終了を記録
setopt   share_history        # 履歴を共有
setopt   hist_ignore_all_dups # ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt   hist_verify          # ヒストリを呼び出してから実行する間に一旦編集可能
setopt   hist_reduce_blanks   # 余分な空白は詰めて記録
setopt   hist_save_no_dups    # 古いコマンドと同じものは無視
setopt   hist_no_store        # historyコマンドは履歴に登録しない
setopt   hist_expand          # 補完時にヒストリを自動的に展開
setopt   bang_hist            # !を使った履歴展開を行う(d)
setopt   extended_history     # 履歴に実行時間も保存する
setopt   hist_find_no_dups    # ラインエディタでヒストリ検索し、ヒットした場合でも重複したものとみなさない
setopt   hist_no_functions    # 関数定義のためのコマンドは履歴から削除する
setopt   hist_no_store        # 履歴参照のコマンドは履歴に登録しない

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
