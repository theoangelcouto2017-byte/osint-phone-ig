#!/data/data/com.termux/files/usr/bin/bash

# Cargar módulos
DIR="$(cd "$(dirname "$0")" && pwd)"
source "$DIR/modules/ip.sh"
source "$DIR/modules/geo.sh"
source "$DIR/modules/phone.sh"
source "$DIR/modules/instagram.sh"

C="\e[1;36m"; Y="\e[1;33m"; G="\e[1;32m"; N="\e[0m"

banner() {
  clear
  echo -e "${C}"
  echo "  ╔══════════════════════════════════════╗"
  echo "  ║   OSINT  PHONE  &  INSTAGRAM         ║"
  echo "  ║   IP · GEO · NÚMERO · INSTAGRAM      ║"
  echo "  ╚══════════════════════════════════════╝"
  echo -e "${N}"
}

while true; do
  banner
  echo "  [1] Mi IP pública"
  echo "  [2] Geolocalizar una IP"
  echo "  [3] Info por número de teléfono"
  echo "  [4] Info por Instagram"
  echo "  [5] Salir"
  echo
  read -p "  Opción > " op

  case $op in
    1) mi_ip ;;
    2) geo_ip ;;
    3) info_numero ;;
    4) info_ig ;;
    5) echo -e "${G}¡Hasta luego!${N}"; exit 0 ;;
    *) echo -e "\e[1;31mOpción inválida\e[0m"; sleep 1 ;;
  esac
done
