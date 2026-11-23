
---

## 2️⃣ `install.sh`

```bash
#!/data/data/com.termux/files/usr/bin/bash

set -e
G="\e[1;32m"; Y="\e[1;33m"; R="\e[1;31m"; N="\e[0m"

echo -e "${Y}[*] Actualizando paquetes...${N}"
pkg update -y && pkg upgrade -y

echo -e "${Y}[*] Instalando dependencias...${N}"
pkg install -y curl wget jq git python

echo -e "${Y}[*] Instalando dependencias Python...${N}"
pip install -r requirements.txt

chmod +x menu.sh modules/*.sh

echo -e "${G}[✔] Instalación completa. Ejecuta: bash menu.sh${N}"
