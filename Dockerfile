FROM archlinux:latest

# PASO 1: Configurar BlackArch (Solo lo necesario para arrancar)
RUN pacman -Syu --noconfirm --needed wget gnupg && \
    curl -O https://blackarch.org/strap.sh && \
    chmod +x strap.sh && \
    ./strap.sh

# PASO 2: Bloque de herramientas ligeras
RUN pacman -S --noconfirm --needed nmap tmux btop fastfetch ffuf sqlmap

# PASO 3: El bloque pesado (Metasploit)
# Lo hacemos por separado para que Docker gestione mejor la memoria
RUN pacman -S --noconfirm --needed metasploit

# PASO 4: Configuración de usuario
RUN useradd -m aldo
USER aldo
WORKDIR /home/aldo
CMD ["/bin/bash"]
