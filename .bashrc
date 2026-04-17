#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
# Banner Visual de BlackArch
fastfetch --logo blackarch --color-keys red --color-title red

# Efecto de sonido: Corte de Katana Samurai
mpv --no-video --volume=90 ~/.config/sounds/katana.mp3 > /dev/null 2>&1 &
export PATH="$HOME/.local/bin:$PATH"

export PATH=$PATH:/home/aldo/.spicetify
# Sincronización automática de mi sistema a GitHub
alias respaldar='cd ~/MisDotfiles && \
pacman -Qqen > pacman_oficial.txt && \
pacman -Qqem > aur_programas.txt && \
cp ~/.bashrc . && \
cp ~/.config/picom/picom.conf . && \
git add . && \
git commit -m "Respaldo automático: $(date +%Y-%m-%d_%H:%M)" && \
git push origin main && \
echo "--- ¡Sistema respaldado en GitHub, AldiniGG! ---"'
