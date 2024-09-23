# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Source Rust environment, only if cargo is installed
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi
