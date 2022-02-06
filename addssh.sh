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
domain=$(cat /etc/xray/domain)
clear
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (Days): " masaaktif

IP=$(wget -qO- ipinfo.io/ip);
ssl="$(cat ~/log-install.txt | grep -w "Stunnel5" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
clear
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart ws-open
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e ""
echo -e "♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤"
echo -e "Informasi SSH & OpenVPN"
echo -e "♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤"
echo -e "IP/Host: $IP / ${domain}"
echo -e "Username      : $Login"
echo -e "Password      : $Pass"
echo -e "Port Openssh  : 22, 222"
echo -e "Port Ssl      : 445, 447, 442"
echo -e "Port Dropbear : 389, 390"
echo -e "Ssh Ws SSL    : 2083"
echo -e "Ssh Ws No SSL : 8880"
echo -e "Ovpn Ws       : 2086"
echo -e "Port TCP      : $ovpn"
echo -e "Port UDP      : $ovpn2"
echo -e "Port SSL      : 3269"
echo -e "Privoxy       : 3000"
echo -e "Squid3 : $sqd"
echo -e "UDPGW  : 7100-7200-7300-upto 7900"
echo -e "OVPN TCP: http://$IP:88/config-tcp.ovpn"
echo -e "OVPN UDP: http://$IP:88/config-udp.ovpn"
echo -e "OVPN SSL: http://$IP:88/config-ssl.ovpn"
echo -e "Dibuat        : $hariini"
echo -e "Masa aktif    : $expi"
echo -e "♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤"
echo -e "Payload Websocket"
echo -e "♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤"
echo -e "CONNECT wss://bugmu.com/HTTP/1.1[crlf]Host: ${domain}[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤"
echo -e "Luxury Edition by @zerossl"
