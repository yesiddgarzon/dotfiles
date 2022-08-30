# Enable Powerlevel10k instant prompt
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

# Path
PATH+=:$HOME/.local/bin/

# Aliases

# -- better ls & cat
alias ls='ls --color --group-directories-first'
alias ll='ls -lh'
alias la='ls -lha'
alias cat='bat'

# -- utilities
alias ..='cd ..'
alias c='clear'
alias sudo='sudo '
alias reset='source ~/.zshrc && clear'
alias vim='nvim'
alias vi='nvim'
alias update='yay'
alias clean='gio trash --empty && sudo pacman -Scc && yay -Scc && sudo pacman -Rns $(pacman -Qtdq) && sudo du -sh ~/.cache/'
alias mirrorup='sudo reflector --latest 10 --protocol http,https --sort rate --save /etc/pacman.d/mirrorlist'

# -- dotfiles
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dota='dots add'
alias dotc='dots commit -m'
alias dotp='dots push'
alias dotss='dots status'
alias dotaa='dots commit -a'

# -- file management
alias cp='cp -r'
alias rm='rm -rf'
alias mkdir='mkdir -p'

# -- install utilities
alias pinstall='sudo pacman -Sy --needed'
alias yinstall='yay -Sy --needed'

# Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
(( ! ${+functions[p10k-instant-prompt-finalize]} )) || p10k-instant-prompt-finalize
