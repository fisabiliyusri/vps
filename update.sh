#!/bin/bash
RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo -e "checking vps"

if [ ! -e /home/vps/public_html/TCP.ovpn ]; then
cp /etc/openvpn/client-tcp-700.ovpn /home/vps/public_html/tcp.ovpn
cp /etc/openvpn/client-udp-800.ovpn /home/vps/public_html/udp.ovpn
cp /etc/openvpn/client-tcp-ssl.ovpn /home/vps/public_html/ssl.ovpn

mkdir /root/OpenVPN
cp -r /etc/openvpn/client-tcp-ssl.ovpn OpenVPN/ssl.ovpn
cp -r /etc/openvpn/client-udp-800.ovpn OpenVPN/udp.ovpn
cp -r /etc/openvpn/client-tcp-700.ovpn OpenVPN/tcp.ovpn
cd /root
zip -r openvpn.zip OpenVPN > /dev/null 2>&1
cp -r /root/openvpn.zip /home/vps/public_html/geo.zip
rm -rf /root/OpenVPN
rm -f /root/openvpn.zip
fi
# text gambar
apt-get install boxes

# color text
cd
# banner /etc/issue.net
wget -O /etc/issue.net "https://raw.githubusercontent.com/Gandring15/vps/main/file/banner.conf"
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

cd /usr/bin
wget -O /usr/bin/system https://raw.githubusercontent.com/Gandring15/vps/main/menu/system.sh && chmod +x /usr/bin/system && cd /usr/bin && apt install -y dos2unix && dos2unix system

echo "0 0 * * * root clear-log && xp" >> /etc/crontab
echo "*/10 * * * * root xp-ws" >> /etc/crontab
cd
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh
rm -f /root/websocket.sh
rm -f /root/master.zip
rm -f /root/badvpn-master

apt install dnsutils jq -y
apt-get install net-tools -y
apt-get install tcpdump -y
apt-get install dsniff -y
apt install grepcidr -y

cd
systemctl restart cron
echo "1.0.1" > /home/ver
clear
figlet -f slant sukses | lolcat
rm -f update.sh
sleep 2
clear
neofetch
