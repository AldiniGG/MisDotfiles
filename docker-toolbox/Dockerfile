# Usamos la imagen oficial de Arch Linux como base
FROM archlinux:latest

# Actualizamos el sistema e instalamos dependencias básicas
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm wget gnupg grep && \
    # Instalamos el script de expansión de BlackArch
    curl -O https://blackarch.org/strap.sh && \
    chmod +x strap.sh && \
    ./strap.sh && \
    pacman -Syu --noconfirm

# Instalamos TU arsenal (puedes añadir más aquí)
RUN pacman -S --noconfirm \
    nmap \
    metasploit \
    ffuf \
    sqlmap \
    tmux \
    btop \
    fastfetch

# Configuramos un usuario para no usar siempre root
RUN useradd -m aldo
USER aldo
WORKDIR /home/aldo

# Comando por defecto al iniciar el contenedor
CMD ["/bin/bash"]
