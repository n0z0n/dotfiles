# Path to Oh My Fish install.
set -gx OMF_PATH "/home/nozomi/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/home/nozomi/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

# PATH
set -gx PATH  $PATH $HOME/bin

# ghq
set -gx GOPATH $HOME

set LANGUAGE ja_JP
set LANG ja_JP.UTF-8
