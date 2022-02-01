#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
IP=$(wget -qO- ipinfo.io/ip);
echo -e "checking vps"
echo -e ""
cat /usr/bin/bannerWIREGUARD | lolcat
echo -e""
echo -e "${color1}1${color3}.$bd Buat Akun Wireguard (${color2}addwg${color3})"
echo -e "${color1}2${color3}.$bd Hapus Akun Wireguard (${color2}delwg${color3})"
echo -e "${color1}3${color3}.$bd Cek User Login Wireguard (${color2}cekwg${color3})"
echo -e "${color1}4${color3}.$bd Perpanjang Masa Aktif Akun Wireguard (${color2}renewwg${color3})"
echo -e""
echo -e "${color1}x${color3}.$bd Menu"
echo -e""
read -p "  Please Enter The Number  [1-4 or x] :  "  wgr
echo -e ""
case $wgr in
1)
addwg
;;
2)
delwg
;;
3)
cekwg
;;
4)
renewwg
;;
x)
paneli
;;
*)
echo "pilih nomor yang tersedia"
sleep 1
wgr
;;
esac
