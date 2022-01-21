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
cat /usr/bin/bannerL2TP | lolcat
echo -e""
echo -e "${color1}1${color3}.$bd Creating L2TP Account (${color2}addl2tp${color3})"
echo -e "${color1}2${color3}.$bd Deleting L2TP Account (${color2}dell2tp${color3})"
echo -e "${color1}3${color3}.$bd Renew L2TP Account (${color2}renewl2tp${color3})"
echo -e ""
echo -e "${color1}x${color3}.$bd Menu"
echo -e ""
read -p "  Please Enter The Number  [1-3 or x] :  "  l2tp
echo -e ""
case "$l2tp" in
1)
addl2tp
;;
2)
dell2tp
;;
3)
renewl2tp
;;
x)
paneli
;;
*)
echo "Masukkan Nomor Yang Ada!"
l2tp
;;
esac
