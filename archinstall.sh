#!/usr/bin/env bash

local packages=(
arc-gtk-theme
bat
betterlockscreen
bridge-utils
bspwm
dnsmasq
dunst
feh
firefox
github-cli
google-chrome
jq
kitty
libguestfs
libreoffice-fresh
lxappearance
neovim
nerd-fonts-jetbrains-mono
nerd-fonts-roboto-mono
nerd-fonts-sf-mono
noto-fonts
ntfs-3g
numlockx
openbsd-netcat
papirus-icon-theme
pavucontrol
picom
playerctl
python-pillow
qemu
qemu-guest-agent
ranger
rofi
spice-vdagent
spotify
sublime-text-4
sxhkd
ttf-dejavu
ttf-iosevka-nerd
ttf-roboto
ttf-ubuntu-font-family
ufw
unrar
vde2
vimix-cursors
virt-manager
virt-viewer
vlc
xclip
xfce4-power-manager
xorg-xsetroot
zsh
zsh-autosuggestions
zsh-syntax-highlighting
zsh-theme-powerlevel10k-git
)

# Actualizar mirrorlist con reflector
sudo pacman -Sy --noconfirm --needed reflector
sudo reflector --latest 10 --protocol http,https --sort rate --save /etc/pacman.d/mirrorlist

# YAY
sudo pacman -Sy --noconfirm --needed git
cd Downloads
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd

# Instalación de paquetes
yay -Sy --needed --noconfirm $packages

# QEMU+KVM
sudo systemctl enable libvirtd.service 
sudo systemctl start libvirtd.service
sudo sed -i 's/^unix_sock_group\s*=\s*\(.*\)/unix_sock_group = "libvirt" #\1/ #\2g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/^unix_sock_rw_perms\s*=\s*\(.*\)/unix_sock_rw_perms = "0770" #\1/ #\2g' /etc/libvirt/libvirtd.conf
sudo usermod -aG libvirt $(whoami)
clear
read -n 1 -r -s -p $'En otra terminal hacer: "newgrp libvirt" y presionar enter...\n'
sudo virsh net-autostart default
sudo systemctl restart libvirtd.service
clear

# Bspwm
install -Dm755 /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc
install -Dm644 /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc

# NVM + NvChad
clear
read -n 1 -r -s -p $'Ahora instala NvChad y NVM\nPresiona enter al terminar...\n'

# Fix Cursores
sudo sed -i 's/^Inherits\s*=\s*\(.*\)/Inherits=Vimix-cursors #\1/ #\2g' /usr/share/icons/default/index.theme
sudo su <<END
echo "gtk-cursor-theme-name = Vimix-cursors" > /usr/share/gtk-3.0/settings.ini
END

# Activar servicios
clear
sudo systemctl enable ufw
sudo systemctl enable sshd

# Instalar temas e iconos
cd Downloads
git clone https://github.com/vinceliuice/Colloid-icon-theme.git
cd Colloid-gtk-theme && ./install.sh && cd ..
cd

# Cargar dotfiles
clear
echo "DOTFILES"
git config --global user.name "yesiddgarzon"
git config --global user.email "yesiddgarzon@gmail.com"
git config --global color.ui true
git config --global core.editor nvim
git config --global init.defaultBranch main
ssh-keygen -t rsa -C "yesiddgarzon@gmail.com"
gh auth login
ssh -T git@github.com
git clone --bare git@github.com:yesiddgarzon/dotfiles.git $HOME/.dotfiles
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout -f -B main
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no

# Configuraciones finales
chsh -s $(which zsh)
rm -rf Downloads/*
sudo rm -rf /usr/share/gnome-shell/extensions/*
clear
read -n 1 -r -s -p $'Reiniciar ahora...\n'
