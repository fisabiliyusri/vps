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
cat /usr/bin/bannerV2RAY | lolcat
echo -e""
echo -e "${color1}1${color3}.$bd Buat Akun Vmess Websocket (${color2}addv2ray${color3})"
echo -e "${color1}2${color3}.$bd Hapus AkunVmess Websocket (${color2}delv2ray${color3})"
echo -e "${color1}3${color3}.$bd Perpanjang Akun Vmess websocket(${color2}renewv2ray${color3})"
echo -e "${color1}4${color3}.$bd Cek User Login Vmess (${color2}cekv2ray${color3})"
echo -e "${color1}5${color3}.$bd Buat Akun Vless Websocket (${color2}addvless${color3})"
echo -e "${color1}6${color3}.$bd Hapus Akun Vless Websocket (${color2}delvless${color3})"
echo -e "${color1}7${color3}.$bd Perpanjang Akun Vless Websocket(${color2}renewvless${color3})"
echo -e "${color1}8${color3}.$bd Cek User Login Vless (${color2}cekvless${color3})"
echo -e "${color1}9${color3}.$bd Buat Akun Vless gRPC (${color2}cekvless-grpc${color3})"
echo -e "${color1}10${color3}.$bd Hapus Akun Vless gRPC (${color2}cekvless-grpc${color3})"
echo -e "${color1}11${color3}.$bd Perpanjang Akun Vless gRPC (${color2}cekvless-grpc${color3})"
echo -e "${color1}12${color3}.$bd Cek User Login Vless gRPC (${color2}cekvless-grpc${color3})"
echo -e""
echo -e "${color1}x${color3}.$bd Menu"
echo -e""
read -p " silahkan masukkan nomor [1-8 or x] :  "  v2ray
echo -e ""
case $v2ray in
1)
addv2ray
;;
2)
delv2ray
;;
3)
renewv2ray
;;
4)
cekv2ray
;;
5)
addvless
;;
6)
delvless
;;
7)
renewvless
;;
8)
cekvless
;;
9)
addvless-grpc
;;
10)
delvless-grpc
;;
11)
renewvless-grpc
;;
12)
cekvless-grpc
;;
x)
menu
;;
*)
echo "Masukkan Nomor Yang Ada"
sleep 1
v2raay
;;
esac
