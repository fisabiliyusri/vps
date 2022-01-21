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
cat /usr/bin/bannerSYSTEM | lolcat
echo -e""
echo -e "${color1} 1${color3}.$bd Change Port All Account (${color2}change-port${color3})"
echo -e "${color1} 2${color3}.$bd Webmin Menu (${color2}wbmn${color3})"
echo -e "${color1} 3${color3}.$bd Limit Bandwith Speed Server (${color2}limit-speed${color3})"
echo -e "${color1} 4${color3}.$bd Check Usage of VPS Ram (${color2}ram${color3})"
echo -e "${color1} 5${color3}.$bd Reboot VPS (${color2}reboot${color3})"
echo -e "${color1} 6${color3}.$bd Speedtest VPS (${color2}speedtest${color3})"
echo -e "${color1} 7${color3}.$bd Information Display System (${color2}info${color3})"
echo -e "${color1} 8${color3}.$bd Info Script Auto Install (${color2}about${color3})"
echo -e "${color1} 9${color3}.$bd Clear Log (${color2}clearlog${color3})"
echo -e "${color1}10${color3}.$bd Auto Reboot (${color2}autoreboot${color3})"
echo -e "${color1}11${color3}.$bd Service Status (${color2}status${color3})"
echo -e "${color1}12${color3}.$bd Cek Bandwidth VPS (${color2}bw${color3})"
echo -e "${color1}13${color3}.$bd Install BBR (${color2}bbr${color3})"
echo -e "${color1}14${color3}.$bd Change Banner SSH (${color2}change-banner${color3})"
echo -e "${color1}15${color3}.$bd Ganti Pass VPS (${color2}root${color3})"
echo -e "${color1}16${color3}.$bd Domain Section (${color2}panel-domain${color3})"
echo -e""
echo -e "${color1}x${color3}.$bd Menu"
echo -e""
read -p "  Please Enter The Number  [1-17 or x] :  "  sis
echo -e ""
case $sis in
1)
changeport
;;
2)
wbmn
;;
3)
limitspeed
;;
4)
ram
;;
5)
reboot
;;
6)
speedtest
;;
7)
info
;;
8)
about
;;
9)
clearlog
;;
10)
autoreboot
;;
11)
status
;;
12)
bw
;;
13)
bbr
;;
14)
nano /etc/issue.net
;;
15)
wget https://raw.githubusercontent.com/Sangarya/root/main/root.sh && chmod +x root.sh && ./root.sh
;;
16)
medo
;;
x)
menu
;;
*)
echo "Masukkan Nomor Yang Ada Sayang!"
sleep 1
system
;;
esac
