#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
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

apt-get install figlet -y > /dev/null
apt-get install ruby -y > /dev/null
gem install lolcat
clear
# Getting
MYIP=$(wget -qO- ifconfig.me/ip);
clear
if [ -f "/etc/v2ray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/gandring;
echo "IP=" >> /var/lib/gandring/ipvps.conf
wget https://raw.githubusercontent.com/Gandring15/vps/main/cf.sh && chmod +x cf.sh && ./cf.sh
#install ssh ovpn
wget https://raw.githubusercontent.com/Gandring15/vps/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://raw.githubusercontent.com/Gandring15/vps/main/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
#install ssr
wget https://raw.githubusercontent.com/Gandring15/vps/main/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
wget https://raw.githubusercontent.com/Gandring15/vps/main/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
#installwg
wget https://raw.githubusercontent.com/Gandring15/vps/main/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
#install v2ray
wget https://raw.githubusercontent.com/Gandring15/vps/main/ins-xray.sh && chmod +x ins-xray.sh && screen -S xray ./ins-xray.sh
#install L2TP
wget https://raw.githubusercontent.com/Gandring15/vps/main/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
wget https://raw.githubusercontent.com/Gandring15/vps/main/set-br.sh && chmod +x set-br.sh && ./set-br.sh
# Websocket
wget https://raw.githubusercontent.com/Gandring15/vps/main/edu.sh && chmod +x edu.sh && ./edu.sh
# Ohp Server
wget https://raw.githubusercontent.com/Gandring15/vps/main/ohp.sh && chmod +x ohp.sh && ./ohp.sh
MYIP=$(wget -qO- https://icanhazip.com);
host=$(hostname);
cat > /etc/hosts <<-END
127.0.0.1 localhost.localdomain localhost
127.0.1.1 localhost
$MYIP $host
END
apt-get install dbus -y > /dev/null
sudo hostnamectl set-hostname Setup-gandring

rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-xray.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/edu.sh
rm -f /root/ohp.sh
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://github.com/Gandring15/vps/main/

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://raw.githubusercontent.com/Gandring15/vps/main/set.sh"
chmod +x /etc/set.sh
history -c
echo "2.9" > /home/ver
echo " "
echo "Installation has been completed!!"
echo " "
echo "♤♤♤♤Script Install Vpn By gandring♤♤♤♤" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 222, 22"    | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 700, UDP 800, SSL 990"  | tee -a log-install.txt
echo "   - Stunnel5                : 445, 442"   | tee -a log-install.txt
echo "   - Dropbear                : 200, 300"   | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080" | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - SSTP BPN                : 444"   | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - TROJAN-GO               : 2053"  | tee -a log-install.txt
echo "   - WIREGUARD               : 51820" | tee -a log-install.txt
echo "   - SHADOWSOCKS-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - Vmess TLS               : 8443"  | tee -a log-install.txt
echo "   - Vmess None TLS          : 2095"  | tee -a log-install.txt
echo "   - Vless TLS               : 443"   | tee -a log-install.txt
echo "   - Vless None TLS          : 80"    | tee -a log-install.txt
echo "   - Trojan-GFW              : 2087"  | tee -a log-install.txt
echo "   - Websocket TLS           : 2083"  | tee -a log-install.txt
echo "   - Websocket None TLS      : 8880"  | tee -a log-install.txt
echo "   - Websocket Ovpn          : 2086"  | tee -a log-install.txt
echo "   - OHP SSH                 : 8181"  | tee -a log-install.txt
echo "   - OHP Dropbear            : 8282"  | tee -a log-install.txt
echo "   - OHP OpenVPN             : 8383"  | tee -a log-install.txt
echo "   - Nginx                   : 89"    | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Dev/Main                : "  | tee -a log-install.txt
echo "   - Recode                  : " | tee -a log-install.txt
echo "   - Telegram                : T.me/"  | tee -a log-install.txt
echo "   - Instagram               : ~"  | tee -a log-install.txt
echo "   - Whatsapp                : ~"  | tee -a log-install.txt
echo "   - Facebook                : ~" | tee -a log-install.txt
echo "♤♤♤♤SELESAI INSTALASI VPN BY gandring♤♤♤♤" | tee -a log-install.txt
echo ""
echo " Reboot 7 Sec"
sleep 7
rm -f setup.sh
reboot
