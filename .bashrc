# Enable the subsequent settings only in interactive sessions
case $- in
*i*) ;;
*) return ;;
esac

# Path to your oh-my-bash installation.
export OSH="/home/ethan/.oh-my-bash"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="90210"

# To disable the uses of "sudo" by oh-my-bash, please set "false" to
# this variable.  The default behavior for the empty value is "true".
OMB_USE_SUDO=true

# To enable/disable display of Python virtualenv and condaenv
# OMB_PROMPT_SHOW_PYTHON_VENV=true  # enable
# OMB_PROMPT_SHOW_PYTHON_VENV=false # disable

source "$OSH"/oh-my-bash.sh

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

export PATH=$HOME/.local/bin:$PATH

alias ll="ls -lA"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.e"

alias search="grep -rnw . -e"

alias cls="clear"

alias pycharm="/home/ethan/apps/pycharm-2023.3.3/bin/pycharm.sh"
alias rustrover="/home/ethan/apps/RustRover-2024.2/bin/rustrover"
alias intellij="/home/ethan/apps/ideaIU-2023.3.3/bin/idea.sh"
alias goland="/home/ethan/apps/GoLand-2023.3.4/bin/goland.sh"
alias dataspell="/home/ethan/apps/dataspell-2024.2.1/bin/dataspell"

set -o vi
EDITOR=nvim

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("/usr/bin/conda" "shell.bash" "hook" 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

. "$HOME/.cargo/env"
