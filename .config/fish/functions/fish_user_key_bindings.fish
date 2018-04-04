function fish_user_key_bindings
    ### fzf ###
    if test "$FZF_LEGACY_KEYBINDINGS" -eq 1
        bind \ct '__fzf_find_file'
        bind \cr '__fzf_reverse_isearch'
        bind \ec '__fzf_cd'
        bind \eC '__fzf_cd_with_hidden'
        if bind -M insert >/dev/null ^/dev/null
            bind -M insert \ct '__fzf_find_file'
            bind -M insert \cr '__fzf_reverse_isearch'
            bind -M insert \ec '__fzf_cd'
            bind -M insert \eC '__fzf_cd_with_hidden'
        end
    else
        bind \cf '__fzf_find_file'
        bind \cr '__fzf_reverse_isearch'
        bind \eo '__fzf_cd'
        bind \eO '__fzf_cd --hidden'
        if bind -M insert >/dev/null ^/dev/null
            bind -M insert \cf '__fzf_find_file'
            bind -M insert \cr '__fzf_reverse_isearch'
            bind -M insert \eo '__fzf_cd'
            bind -M insert \eO '__fzf_cd --hidden'
        end
    end
    set -q FZF_COMPLETE
    and bind \t '__fzf_complete'
    ### fzf ###
    ### ghq ###
    bind \cg '__ghq_crtl_g'
    if bind -M insert >/dev/null ^/dev/null
        bind -M insert \cg '__ghq_crtl_g'
    end
    ### ghq ###
    ### budspencer ###
    set fish_key_bindings fish_vi_key_bindings
    bind '
bind -M visual '
    bind ' ' __budspencer_toggle_pwd
    bind -M visual ' ' __budspencer_toggle_pwd
    bind L __budspencer_cd_next
    bind H __budspencer_cd_prev
    bind m mark
    bind M unmark
    bind . __budspencer_edit_commandline
    bind -M insert \r __budspencer_preexec
    bind \r __budspencer_preexec
    ### budspencer ###
end