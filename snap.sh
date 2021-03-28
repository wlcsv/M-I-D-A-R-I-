#!/bin/bash 

ln -s $(pwd)/.gitconfig ~/.gitconfig
ln -s $(pwd)/.zshrc ~/.zshrc

# ----------------------------- VARIÁVEIS ----------------------------- #

URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"

PROGRAMAS_PARA_INSTALAR=(
    snapd
    git
    # npm
    # node
    zsh
)

# ---------------------------------------------------------------------- #

## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## Adicionando/Confirmando arquitetura de 32 bits ##
sudo dpkg --add-architecture i386

## Atualizando o repositório ##
sudo apt update -y

## Download e instalaçao de programas externos ##
mkdir "$DIRETORIO_DOWNLOADS"
wget -c "$URL_GOOGLE_CHROME"       -P "$DIRETORIO_DOWNLOADS"

## Instalando pacotes .deb baixados na sessão anterior ##
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

# Instalar programas no apt
for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; do
    if ! dpkg -l | grep -q $nome_do_programa; then # Só instala se já não estiver instalado
        apt install "$nome_do_programa" -y
    else
        echo "[INSTALADO] - $nome_do_programa"
    fi
done

## Instalação de pacotes Snap ##
echo "Instalando pacotes Snap"
sudo snap install code --classic
sudo snap install spotify
sudo snap install qbittorrent-arnatious
sudo snap install discord
# ---------------------------------------------------------------------- #

## Instalação do Oh My Zsh ##
# echo "Instalando o Oh My Zsh"
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# ---------------------------------------------------------------------- #

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
echo "Finalizando a instalação"
sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y
# ---------------------------------------------------------------------- #
