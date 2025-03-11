#!/usr/bin/env zsh

#### Change system settings ####

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
brew upgrade

# Install Xcode and Command Line tools
xcode-select --install && sudo xcodebuild -license

# Install all apps
brew install --cask google-chrome iterm2 rectangle vlc figma imageoptim google-drive vmware-fusion transmission discord visual-studio-code sublime-text 

brew install wget git neovim gh bat ffmpeg imagemagick

brew tap homebrew/cask-versions
brew install homebrew/cask-versions/firefox-developer-edition

nvm install

# Install Oh-My-Zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install Oh-My-Zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

#### Configurations ####
clear

# Git
gh auth login

# Dotfiles
git clone --bare git@github.com:yesiddgarzon/dotfiles.git $HOME/.dotfiles
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout main -f
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME git clean -fd
