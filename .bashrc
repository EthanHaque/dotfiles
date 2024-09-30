# Enable the subsequent settings only in interactive sessions
case $- in
*i*) ;;
*) return ;;
esac

# Path to oh-my-bash installation
export OSH="$HOME/.oh-my-bash"

# Set the theme for oh-my-bash
OSH_THEME="90210"

# Disable/enable sudo in oh-my-bash
OMB_USE_SUDO=true

# Optionally enable/disable Python virtualenv display in the prompt
# OMB_PROMPT_SHOW_PYTHON_VENV=true # enable
# OMB_PROMPT_SHOW_PYTHON_VENV=false # disable

# Source oh-my-bash if available
if [ -f "$OSH/oh-my-bash.sh" ]; then
    source "$OSH/oh-my-bash.sh"
fi

# Source global definitions if available
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User-specific environment settings
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Load user-specific aliases and functions from .bashrc.d if available
if [ -d "$HOME/.bashrc.d" ]; then
    for rc in "$HOME/.bashrc.d/"*; do
        [ -f "$rc" ] && . "$rc"
    done
fi

# General useful aliases
alias ll="ls -lA"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias search="grep -rnw . -e"
alias cls="clear"

# Application-specific aliases
APP_DIR="$HOME/apps"
alias pycharm="$APP_DIR/pycharm-2023.3.3/bin/pycharm.sh"
alias rustrover="$APP_DIR/RustRover-2024.2/bin/rustrover"
alias intellij="$APP_DIR/ideaIU-2023.3.3/bin/idea.sh"
alias goland="$APP_DIR/GoLand-2023.3.4/bin/goland.sh"
alias dataspell="$APP_DIR/dataspell-2024.2.1/bin/dataspell"

# Set shell options and editor
set -o vi
export EDITOR=nvim

# Conda environment setup, only if conda is installed
if command -v conda &>/dev/null; then
    __conda_setup="$("$(command -v conda)" "shell.bash" "hook" 2>/dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    elif [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    fi
fi
unset __conda_setup

# Source Rust environment, only if cargo is installed
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi
