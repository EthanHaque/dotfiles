#!/bin/bash

DOTFILES_REPO="git@github.com:EthanHaque/dotfiles.git"
DOTFILES_DIR="$HOME/repos/dotfiles"
NVIM_CONFIG_DIR="$HOME/.config/nvim"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repository into $DOTFILES_DIR..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
    echo "Dotfiles repository already exists in $DOTFILES_DIR."
fi

mkdir -p "$HOME/.config"

if [ -L "$NVIM_CONFIG_DIR" ] || [ -e "$NVIM_CONFIG_DIR" ]; then
    echo "Backing up existing Neovim config to $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
    mv "$NVIM_CONFIG_DIR" "$BACKUP_DIR/"
fi

echo "Creating symlink for Neovim config..."
ln -s "$DOTFILES_DIR/nvim" "$NVIM_CONFIG_DIR"

create_symlink() {
    local src=$1
    local dest=$2
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "Backing up existing $dest to $BACKUP_DIR"
        mv "$dest" "$BACKUP_DIR/"
    fi
    ln -sf "$src" "$dest"
}

echo "Creating symlinks for other dotfiles..."
create_symlink "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
create_symlink "$DOTFILES_DIR/.profile" "$HOME/.profile"
create_symlink "$DOTFILES_DIR/.bash_profile" "$HOME/.bash_profile"
create_symlink "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"

echo "Dotfiles setup complete! Backups (if any) are stored in $BACKUP_DIR."
