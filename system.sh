#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"
cat /usr/bin/bannerSYSTEM | lolcat
echo -e""
echo -e "${color1} 1${color3}.$bd Ganti Port Layanan Tunnel (${color2}change-port${color3})"
echo -e "${color1} 2${color3}.$bd Menu Webmin (${color2}webmin${color3})"
echo -e "${color1} 3${color3}.$bd Limit Bandwith Speed Server (${color2}limit-speed${color3})"
echo -e "${color1} 4${color3}.$bd Cek Penggunaan Ram Vps(${color2}ram${color3})"
echo -e "${color1} 5${color3}.$bd Reboot VPS (${color2}reboot${color3})"
echo -e "${color1} 6${color3}.$bd Speedtest VPS (${color2}speedtest${color3})"
echo -e "${color1} 7${color3}.$bd Tampilkan Informasi System (${color2}info${color3})"
echo -e "${color1} 8${color3}.$bd Info Tentang Script Insatall Vps (${color2}about${color3})"
echo -e "${color1} 9${color3}.$bd Hapus Log (${color2}clearlog${color3})"
echo -e "${color1}10${color3}.$bd Auto Reboot (${color2}autoreboot${color3})"
echo -e "${color1}11${color3}.$bd Status Layanan Tunnel (${color2}status${color3})"
echo -e "${color1}12${color3}.$bd Cek Bandwidth VPS (${color2}bw${color3})"
echo -e "${color1}13${color3}.$bd Instalasi BBR (${color2}bbr${color3})"
echo -e "${color1}14${color3}.$bd Ganti iklan SSH (${color2}change-banner${color3})"
echo -e "${color1}15${color3}.$bd Ganti Pass VPS (${color2}root${color3})"
echo -e "${color1}16${color3}.$bd Menu Domain Server (${color2}panel-domain${color3})"
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
webmin
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
wget https://raw.githubusercontent.com/Gandring15/vps/main/root.sh && chmod +x root.sh && ./root.sh
;;
16)
medo
;;
x)
menu
;;
*)
echo "Masukkan Nomor Yang Ada"
sleep 1
system
;;
esac
