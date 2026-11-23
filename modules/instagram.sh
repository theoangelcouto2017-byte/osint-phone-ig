#!/data/data/com.termux/files/usr/bin/bash

info_ig() {
  clear
  read -p "Usuario de Instagram (sin @): " user
  [ -z "$user" ] && return

  echo -e "\e[1;33m[*] Buscando @$user ...\e[0m"
  resp=$(curl -s -A "Mozilla/5.0 (Linux; Android 10)" \
    "https://www.instagram.com/$user/?__a=1&__d=dis")

  nombre=$(echo "$resp" | jq -r '.graphql.user.full_name // .user.full_name // empty' 2>/dev/null)
  bio=$(echo "$resp" | jq -r '.graphql.user.biography // .user.biography // empty' 2>/dev/null)
  seguidores=$(echo "$resp" | jq -r '.graphql.user.edge_followed_by.count // .user.follower_count // empty' 2>/dev/null)
  foto=$(echo "$resp" | jq -r '.graphql.user.profile_pic_url_hd // empty' 2>/dev/null)

  if [ -n "$nombre" ]; then
    echo -e "\e[1;32m[+] Nombre    :\e[0m $nombre"
    echo -e "\e[1;32m[+] Bio       :\e[0m $bio"
    echo -e "\e[1;32m[+] Seguidores:\e[0m $seguidores"
    echo -e "\e[1;32m[+] Foto HD   :\e[0m $foto"
  else
    echo -e "\e[1;31m[-] Instagram bloqueó la consulta o el perfil no existe.\e[0m"
    echo "    Usando servicios alternativos..."
  fi

  echo
  echo -e "\e[1;33m[*] Enlaces útiles:\e[0m"
  echo "  Perfil   : https://www.instagram.com/$user/"
  echo "  Imginn   : https://imginn.com/$user/"
  echo "  Picuki   : https://www.picuki.com/profile/$user"
  echo "  Google   : https://www.google.com/search?q=site:instagram.com+$user"

  echo
  read -p "Enter para volver..."
}
