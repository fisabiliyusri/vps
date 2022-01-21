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
cat /usr/bin/bannerTROJAN | lolcat
echo -e""
echo -e "${color1}1${color3}.$bd Create Trojan Account (${color2}addtrojan${color3})"
echo -e "${color1}2${color3}.$bd Deleting Trojan Account (${color2}deltrojan${color3})"
echo -e "${color1}3${color3}.$bd Renew Trojan Account (${color2}renewtrojan${color3})"
echo -e "${color1}4${color3}.$bd Check User Login Trojan (${color2}cektrojan${color3})"
echo -e "${color1}5${color3}.$bd Create TrojanGO Account (${color2}addtrgo${color3})"
echo -e "${color1}6${color3}.$bd Deleting TrojanGO Account (${color2}deltrgo${color3})"
echo -e "${color1}7${color3}.$bd Renew TrojanGO Account (${color2}renewtrgo${color3})"
echo -e "${color1}8${color3}.$bd Renew TrojanGO Account (${color2}renewtrgo${color3})"
echo -e""
echo -e "${color1}x${color3}.$bd Menu"
echo -e""
read -p " Please Enter The Number  [1-8 or x] :  "  trojan
echo -e ""
case $trojan in
1)
addtrojan
;;
2)
deltrojan
;;
3)
renewtrojan
;;
4)
cektrojan
;;
5)
addtrgo
;;
6)
deltrgo
;;
7)
renewtrgo
;;
8)
cektrgo
;;
x)
menu
;;
*)
echo "Masukkan Nomor Yang Ada Sayang!"
sleep 1
trojaan
;;
esac
