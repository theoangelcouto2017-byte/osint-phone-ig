#!/data/data/com.termux/files/usr/bin/bash

mi_ip() {
  clear
  echo -e "\e[1;33m[*] Tu IP pública:\e[0m"
  curl -s https://api.ipify.org; echo
  echo
  echo -e "\e[1;33m[*] Datos del proveedor:\e[0m"
  curl -s https://ipinfo.io/json | jq
  echo
  read -p "Enter para volver..."
}
