#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/Sangarya/izin/main/ipvps | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}";
echo "Only For Premium Users"
exit 0
fi
clear
cat /usr/bin/bannerVPN | lolcat
echo -e""
echo -e "${color1}1${color3}.$bd  Secure Socket Tunneling Protocol (${color2}ms-sstp${color3})"
echo -e "${color1}2${color3}.$bd  Layer Two Tunneling Protocol (${color2}l2tp${color3})"
echo -e "${color1}3${color3}.$bd  Point-to-Point Tunneling Protocol (${color2}pptp${color3})"
echo -e "${color1}4${color3}.$bd  WireGuard® Protokol (${color2}Wireguard${color3})"
echo -e""
echo -e "${color1}x${color3}.$bd Menu"
echo -e ""
read -p " Please Enter The Number  [1-4 or x] :  "  lon
echo -e ""
case $lon in
1)
sstpp
;;
2)
l2tp
;;
3)
ppt
;;
4)
wgr
;;
x)
menu
;;
*)
echo "Masukkan Nomor Yang Ada Sayang!"
sleep 1
paneli
;;
esac
