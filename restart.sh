#!/bin/bash
# My Telegram : https://t.me/Pegasusq_governor
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
clear
echo -e ""
echo -e "Starting Restart All Service"
sleep 2
systemctl restart ssrmu
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart xray@v2ray-tls
systemctl restart xray@v2ray-nontls
systemctl restart xray@vless-tls
systemctl restart xray@vless-nontls
systemctl restart xray@trojan
systemctl restart shadowsocks-libev
systemctl restart xl2tpd
systemctl restart pptpd
systemctl restart ipsec
systemctl restart accel-ppp
systemctl restart ws-ovpn
systemctl restart wg-quick@wg0
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
systemctl restart trojan-go
systemctl restart wstunnel
systemctl restart wsstunnel
/etc/init.d/ssrmu restart
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/sslh restart
/etc/init.d/stunnel5 restart
/etc/init.d/openvpn restart
/etc/init.d/fail2ban restart
/etc/init.d/cron restart
/etc/init.d/nginx restart
/etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 100
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 100
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 100
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 100
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 100
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 100
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 100
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 100
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 100
echo -e "Restart All Service Berhasil"
sleep 2
clear
info
