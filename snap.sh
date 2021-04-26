#!/bin/bash 

## Instalação de pacotes Snap ##
echo "Instalando pacotes Snap"
 
sudo snap install nvim --classic
sudo snap install spotify

# sudo snap install qbittorrent-arnatious
# sudo snap install discord
# sudo snap install code --classic

## Instalação do Oh My Zsh ##
echo "Instalando o Oh My Zsh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

