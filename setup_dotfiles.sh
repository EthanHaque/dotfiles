


DOTFILES_REPO="git@github.com:EthanHaque/dotfiles.git"
DOTFILES_DIR="$HOME/repos/dotfiles"  
NVIM_CONFIG_DIR="$HOME/.config/nvim"


if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repository into $DOTFILES_DIR..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
    echo "Dotfiles repository already exists in $DOTFILES_DIR."
fi


mkdir -p "$HOME/.config"


if [ -L "$NVIM_CONFIG_DIR" ] || [ -e "$NVIM_CONFIG_DIR" ]; then
    echo "Removing existing Neovim config..."
    rm -rf "$NVIM_CONFIG_DIR"
fi
echo "Creating symlink for Neovim config..."
ln -s "$DOTFILES_DIR/nvim" "$NVIM_CONFIG_DIR"


echo "Creating symlinks for other dotfiles..."
ln -sf "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
ln -sf "$DOTFILES_DIR/.profile" "$HOME/.profile"
ln -sf "$DOTFILES_DIR/.bash_profile" "$HOME/.bash_profile"
ln -sf "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"


echo "Dotfiles setup complete!"

