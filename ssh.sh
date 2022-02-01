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
echo "Checking VPS"
cat /usr/bin/bannerSSH | lolcat
echo -e""
echo -e "${color1}1${color3}.$bd Buat Akun SSH & OpenVPN (${color2}addssh${color3})"
echo -e "${color1}2${color3}.$bd Trial Akun SSH & OpenVPN (${color2}trialssh${color3})"
echo -e "${color1}3${color3}.$bd Perpanjang Akun SSH & OpenVPN (${color2}renewssh${color3})"
echo -e "${color1}4${color3}.$bd Hapus Akun SSH & OpenVPN (${color2}delssh${color3})"
echo -e "${color1}5${color3}.$bd Check User Login SSH & OpenVPN (${color2}cekssh${color3})"
echo -e "${color1}6${color3}.$bd Daftar Member SSH & OpenVPN (${color2}member${color3})"
echo -e "${color1}7${color3}.$bd Hapus User SSH & OpenVPN Kadaluarsa (${color2}delexp${color3})"
echo -e "${color1}8${color3}.$bd Set up Autokill SSH (${color2}autokill${color3})"
echo -e "${color1}9${color3}.$bd Cek User Multi Login SSH (${color2}ceklim${color3})"
echo -e "${color1}10${color3}.$bd Restart Layanan (${color2}restart${color3})"
echo -e "${color1}11${color3}.$bd Limit User (${color2}user-limit${color3})"
echo -e""
echo -e "${color1}x${color3}.$bd Menu"
echo -e""
read -p "  Please Enter The Number  [1-9 or x] :  "  ssh
echo -e ""
case $ssh in
1)
addssh
;;
2)
trialssh
;;
3)
renewssh
;;
4)
delssh
;;
5)
cekssh
;;
6)
member
;;
7)
delexp
;;
8)
autokill
;;
9)
ceklim
;;
10)
restart
;;
11)
user-limit
;;
x)
menu
;;
*)
echo "Masukkan Nomor Yang Ada"
sleep 1
ssh
;;
esac
