#!/usr/bin/env bash

## Váriaveis ##
URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"

PROGRAMAS_PARA_INSTALAR=(
    snapd
    node 
    npm
)

## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock
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

## Download e instalaçao de programas externos ##
mkdir "$DIRETORIO_DOWNLOADS"
wget -c "$URL_GOOGLE_CHROME"       -P "$DIRETORIO_DOWNLOADS"

## Instalando pacotes .deb baixados na sessão anterior ##
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

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

curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh; zsh

sudo usermod --shell $(which zsh) $USER

## Fim ##
echo "Fim da instalação"
