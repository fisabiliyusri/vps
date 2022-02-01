#!/bin/bash
# My Telegram : https://t.me/pegasusq_governor
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
IP=$(wget -qO- ipinfo.io/ip);
echo -e "checking vps"
echo -e ""
echo -e "     MENU GANTI PORT LAYANAN"
echo -e "♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤"
echo -e "[1]. Ganti Port OpenVPN"
echo -e "[2]. Ganti Port Wireguard"
echo -e "[3]. Ganti Port Vmess"
echo -e "[4]. Ganti Port Vless"
echo -e "[5]. Ganti Port Trojan"
echo -e "[6]. Ganti Port Squid"
echo -e "[7]. Ganti Port SSTP"
echo -e "[8]. Ganti Port Ssh Ws Tls"
echo -e "[9]. Ganti Port Ssh Ws NonTls"
echo -e "[10]. Keluar"
echo -e ""
echo -e "♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤"
echo -e ""
read -p "Select From Options [ 1-8 ] : " port
echo -e ""
case $port in
1)
portovpn
;;
2)
portwg
;;
3)
portv2ray
;;
4)
portvless
;;
5)
porttrojan
;;
6)
portsquid
;;
7)
portsstp
;;
8)
portsshwstls
;;
9)
portsshwsnontls
;;
10)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
