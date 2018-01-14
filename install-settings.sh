#!/bin/bash

# Git
git config --global user.name "Andrew Mok"
git config --global user.email "andrewmmc@users.noreply.github.com"

# iTerm2
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Oh My Zsh
ln -sf "$HOME/dotfiles/oh-my-zsh/.zshrc" "$HOME/.zshrc"

# VS Code
ln -sf "$HOME/dotfiles/vs-code/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
ln -sf "$HOME/dotfiles/vs-code/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
ln -sf "$HOME/dotfiles/vs-code/vsicons.settings.json" "$HOME/Library/Application Support/Code/User/vsicons.settings.json"
