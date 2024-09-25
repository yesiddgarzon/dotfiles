#!/usr/bin/env zsh

#### Change some system settings ####

# Take screenshots as jpg (usually smaller size) and not png
defaults write com.apple.screencapture type jpg

# Do not open previous previewed files (e.g. PDFs) when opening a new one
defaults write com.apple.Preview ApplePersistenceIgnoreState YES

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true
killall Finder;

#### Install all necesary apps ####
clear

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew upgradet

# Install necesary apps
brew install —cask google-chrome iterm2 rectangle vlc figma imageoptim vmware-fusion google-drive

brew install wget git nvm neovim gh bat

# Install Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install Oh-My-Zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#### Configurations ####
clear

# Git
gh auth login

# Dotfiles
git clone --bare git@github.com:yesiddgarzon/dotfiles.git $HOME/.dotfiles
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout main -f
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME git clean -fd
