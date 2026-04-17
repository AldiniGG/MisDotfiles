#!/bin/bash
echo "Iniciando la resurrección de la BlackAcer..."

# 1. Instalar programas oficiales
sudo pacman -S --needed - < pacman_oficial.txt

# 2. Instalar un gestor de AUR (yay es el estándar)
if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd ..
fi

# 3. Instalar programas del AUR
yay -S --needed - < aur_programas.txt

# 4. Restaurar configuraciones
cp .bashrc ~/.bashrc
mkdir -p ~/.config/picom/
cp picom.conf ~/.config/picom/picom.conf

echo "¡Sistema restaurado! Reinicia para ver la magia."
