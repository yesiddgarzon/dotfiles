# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Fix Java
export _JAVA_AWT_WM_NONREPARENTING=1

# Prompt Setup
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch notify
bindkey -e

# Completion System
zstyle :compinstall filename '/home/yesid/.zshrc'
autoload -Uz compinit
compinit

# Aliases

# -- better ls
alias ll='ls -lh'
alias la='ls -lha'

# -- utilities
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias c='clear'
alias sudo='sudo '
alias reset='source ~/.zshrc && clear'
alias sysupdate='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g'

# -- folder shotcuts
alias dl='cd ~/Downloads'
alias docs='cd ~/Documents'
alias cod='cd ~/code'

# -- dotfiles
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dotss='dot status'
alias dotadd='dot commit -a -m'

# -- file management
alias cp='cp -r'
alias rm='rm -rf'
alias mkdir='mkdir -p'

# Plugins
source ~/powerlevel10k/powerlevel10k.zsh-theme
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
(( ! ${+functions[p10k-instant-prompt-finalize]} )) || p10k-instant-prompt-finalize
