#!/data/data/com.termux/files/usr/bin/bash

geo_ip() {
  clear
  read -p "IP a geolocalizar (ej 8.8.8.8): " ip
  [ -z "$ip" ] && return

  echo -e "\e[1;33m[*] Consultando $ip ...\e[0m"
  data=$(curl -s "https://ipinfo.io/$ip/json")
  echo "$data" | jq

  loc=$(echo "$data" | jq -r .loc)
  if [ "$loc" != "null" ] && [ -n "$loc" ]; then
    echo
    echo -e "\e[1;32m[+] Coordenadas:\e[0m $loc"
    echo -e "\e[1;32m[+] Mapa:\e[0m https://www.google.com/maps?q=$loc"
  fi

  echo
  read -p "Enter para volver..."
}
