#!/bin/bash
# Simple dotfiles installer - creates symlinks

DOTFILES_DIR="$HOME/projects/local_setup"

echo "Installing dotfiles..."

# Starship prompt
if ! command -v starship &>/dev/null; then
    echo "Installing starship..."
    brew install starship
fi

# Neovim config
if [ -e "$HOME/.config/nvim" ]; then
    echo "⚠️  ~/.config/nvim already exists. Skipping..."
else
    ln -sf "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
    echo "✓ Linked nvim config"
fi

# Zsh config
if [ -e "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
    echo "⚠️  ~/.zshrc already exists. Backing up to ~/.zshrc.backup"
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
echo "✓ Linked .zshrc"

# Vim config
if [ -e "$HOME/.vimrc" ] && [ ! -L "$HOME/.vimrc" ]; then
    echo "⚠️  ~/.vimrc already exists. Backing up to ~/.vimrc.backup"
    mv "$HOME/.vimrc" "$HOME/.vimrc.backup"
fi
ln -sf "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
echo "✓ Linked .vimrc"

# Starship config
if [ -e "$HOME/.config/starship.toml" ] && [ ! -L "$HOME/.config/starship.toml" ]; then
    echo "⚠️  ~/.config/starship.toml already exists. Backing up..."
    mv "$HOME/.config/starship.toml" "$HOME/.config/starship.toml.backup"
fi
ln -sf "$DOTFILES_DIR/.config/starship.toml" "$HOME/.config/starship.toml"
echo "✓ Linked starship.toml"

# Git config
git config --global core.editor "nvim"
echo "✓ Set git editor to nvim"

echo ""
echo "Done! Open nvim - plugins will auto-install on first launch."
