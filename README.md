# local_setup

My personal macOS configuration files.

## Quick Setup

```bash
# Clone the repo
git clone git@github.com:manojkurien/local_setup.git ~/projects/local_setup

# Run the installer
cd ~/projects/local_setup
./install.sh

# Open nvim - plugins will auto-install
nvim
```

## What's Included

- **Neovim** - NvChad config with lazy.nvim
- **Zsh** - Oh-My-Zsh config with aliases and tools
- **Vim** - Basic vim configuration

## Prerequisites

Install these before running the installer:

- [Oh-My-Zsh](https://ohmyz.sh/)
- [pyenv](https://github.com/pyenv/pyenv)
- [nvm](https://github.com/nvm-sh/nvm)
- A Nerd Font (for terminal icons)

## How It Works

The `install.sh` script creates symlinks from your home directory to this repo:
- `~/.config/nvim` → `~/projects/local_setup/.config/nvim`
- `~/.zshrc` → `~/projects/local_setup/.zshrc`
- `~/.vimrc` → `~/projects/local_setup/.vimrc`

Any changes you make are automatically tracked in the repo.
