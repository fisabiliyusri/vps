#!/bin/bash
# My Telegram : https://t.me/geovpn
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
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/geovpn/perizinan/main/ip | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
echo -e "${NC}${LIGHT}Telegram : https://t.me/geovpn"
exit 0
fi
clear
echo -e ""
echo -e "======================================"
echo -e ""
echo -e "[1]. Change Port OpenVPN"
echo -e "[2]. Change Port Wireguard"
echo -e "[3]. Change Port Vmess"
echo -e "[4]. Change Port Vless"
echo -e "[5]. Change Port Trojan"
echo -e "[6]. Change Port Squid"
echo -e "[7]. Change Port SSTP"
echo -e "[8]. Exit"
echo -e ""
echo -e "======================================"
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
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
