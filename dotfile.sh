#!/usr/bin/env bash

PROGRAMAS_PARA_INSTALAR=(
    snapd
    node 
    npm
)

## Removendo travas eventuais do apt ##
sudo rm /etc/apt/preferences.d/nosnap.pref

## Atualizando o repositório ##
sudo apt update -y

## Instalar programas no apt ##
for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; do
    if ! dpkg -l | grep -q $nome_do_programa; then # Só instala se já não estiver instalado
        apt install "$nome_do_programa" -y
    else
        echo "[Instalando] - $nome_do_programa"
    fi
done

## Atualizando o repositório depois da adição de novos repositórios ##
sudo apt update -y

## Instalando snaps ##

echo "Instalando VS Code"
sudo snap install code --classic 

echo "Instalando Spotify"
sudo snap install spotify 

echo "Instalando QBittorrent" 
sudo snap install qbittorrent-arnatious 

## Terminal ##

echo "Instalando o zsh"
sudo apt install zsh -y

sudo usermod --shell $(which zsh) $USER

echo "Fim"
