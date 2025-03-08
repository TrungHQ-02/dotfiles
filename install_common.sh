#!/bin/bash

echo "Installing common tools..."

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ""--unattended""
else
    echo "oh-my-zsh is already installed."
fi

# Install zsh-autosuggestions
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
    echo "zsh-autosuggestions is already installed."
fi

# Install powerlevel10k
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    echo "Installing powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
    echo "powerlevel10k is already installed."
fi

# Install zsh-autocomplete
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autocomplete" ]; then
    echo "Installing zsh-autocomplete..."
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete
else
    echo "zsh-autocomplete is already installed."
fi

# Install zsh-syntax-highlighting
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting..."
    # git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
    echo "zsh-syntax-highlighting is already installed."
fi

echo "----------------------------"

echo "I will manage dotfiles using GNU Stow."

# Symbolic links for dotfiles
# Dotfiles to manage
dotfiles=(.zshrc .zshenv .p10k.zsh .tmux.conf .wezterm.lua)

# Create symbolic links for each dotfile
for file in "${dotfiles[@]}"; do
    if [ -L "$HOME/$file" ]; then
        echo "$file is already a symlink. Removing it before applying stow."
        rm -rf "$HOME/$file"
    elif [ -f "$HOME/$file" ]; then
        echo "$file already exists. Backing up and creating symbolic link."
        mv "$HOME/$file" "$HOME/$file.bak"
    else
        echo "$file not found. Creating symbolic link."
    fi
    echo "------"
done

stow -v -d "$(pwd)" -t ~ zsh tmux wezterm