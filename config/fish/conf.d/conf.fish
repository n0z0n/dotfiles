set -x PATH /sbin                                   {$PATH}
set -x PATH /bin                                    {$PATH}
set -x PATH /usr/sbin                               {$PATH}
set -x PATH /usr/bin                                {$PATH}
set -x PATH /usr/local/sbin                         {$PATH}
set -x PATH /usr/local/bin                          {$PATH}
set -x PATH /usr/local/opt/findutils/libexec/gnubin {$PATH}
set -x PATH /usr/local/opt/coreutils/libexec/gnubin {$PATH}
set -x PATH ~/.local/bin                            {$PATH}


set -x MANPATH /usr/local/opt/findutils/libexec/gnuman {$MANPATH}
set -x MANPATH /usr/local/opt/coreutils/libexec/gnuman {$MANPATH}
set -x MANPATH /usr/local/share/man {$MANPATH}

set -x PYENV_ROOT {$HOME}/.pyenv
set -x PATH {$PYENV_ROOT}/bin {$PATH}
# eval (pyenv init   -)
. (pyenv init - | psub)

set -x FZF_TMUX 1

## vi mode
fish_vi_key_bindings

# vi modeではなんか[I]みたいなの出るからオーバーライド
function fish_mode_prompt
end

## prompt
function fish_prompt
    if test "$fish_key_bindings" = "fish_vi_key_bindings"
        switch $fish_bind_mode
            case default
                set_color --bold red white
            case insert
                set_color --bold green white
            case replace-one
                set_color --bold green white
            case visual
                set_color --bold magenta white
            end
        echo (prompt_pwd) ">><(( *>  "
    end
end
