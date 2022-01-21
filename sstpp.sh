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
cat /usr/bin/bannerSSTP | lolcat
echo -e""
echo -e "${color1}1${color3}.$bd Create Account SSTP (${color2}addsstp${color3})"
echo -e "${color1}2${color3}.$bd Delete SSTP Account (${color2}delsstp${color3})"
echo -e "${color1}3${color3}.$bd Renew SSTP Account (${color2}renewsstp${color3})"
echo -e "${color1}4${color3}.$bd Check User Login SSTP (${color2}ceksstp${color3})"
echo -e""
echo -e "${color1}x${color3}.$bd Menu"
echo -e""
read -p " Please Enter The Number  [1-4 or x] :  "  sstpp
echo -e ""
case $sstpp in
1)
addsstp
;;
2)
delsstp
;;
3)
renewsstp
;;
4)
ceksstp
;;
x)
paneli
;;
*)
echo "Masukkan Nomor Yang Ada Sayang!"
sleep 1
sstpp
;;
esac
