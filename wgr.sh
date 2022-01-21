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
echo -e ""
cat /usr/bin/bannerWIREGUARD | lolcat
echo -e""
echo -e "${color1}1${color3}.$bd Create Wireguard Account (${color2}addwg${color3})"
echo -e "${color1}2${color3}.$bd Delete Wireguard Account (${color2}delwg${color3})"
echo -e "${color1}3${color3}.$bd Check User Login Wireguard (${color2}cekwg${color3})"
echo -e "${color1}4${color3}.$bd Renew Wireguard Account (${color2}renewwg${color3})"
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
echo "Masukkan Nomor Yang Ada Sayang!"
sleep 1
wgr
;;
esac
