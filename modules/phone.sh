#!/data/data/com.termux/files/usr/bin/bash

info_numero() {
  clear
  read -p "Número con código país (ej +5215512345678): " num
  [ -z "$num" ] && return

  # Validación básica
  if echo "$num" | grep -Eq '^\+[0-9]{8,15}$'; then
    echo -e "\e[1;32m[+] Formato válido\e[0m"
  else
    echo -e "\e[1;31m[-] Formato dudoso (usa + y solo dígitos)\e[0m"
  fi

  echo
  echo -e "\e[1;33m[*] Verificando número...\e[0m"
  curl -s "https://api.veriphone.io/v2/verify?phone=$num&key=DEMO" | jq 2>/dev/null \
    || echo "Servicio no disponible."

  # Extraer país si Veriphone responde
  pais=$(curl -s "https://api.veriphone.io/v2/verify?phone=$num&key=DEMO" | jq -r .country 2>/dev/null)
  if [ "$pais" != "null" ] && [ -n "$pais" ]; then
    echo -e "\e[1;32m[+] País detectado:\e[0m $pais"
  fi

  echo
  echo -e "\e[1;33m[*] Enlaces de búsqueda:\e[0m"
  echo "  Google  : https://www.google.com/search?q=%22$num%22"
  echo "  Truecall: https://www.truecaller.com/search/$(echo $num | tr -d '+')"
  echo "  WhatsApp: https://wa.me/$(echo $num | tr -d '+')"
  echo "  Telegram: https://t.me/+$(echo $num | tr -d '+')"

  echo
  read -p "Enter para volver..."
}
