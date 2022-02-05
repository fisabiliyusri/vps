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
IP=$(wget -qO- ipinfo.io/ip);
echo -e "checking vps"
source /var/lib/gandring/ipvps.conf
if [[ "$IP2" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP2
fi
tls="$(cat ~/log-install.txt | grep -w "Vless TLS" | cut -d: -f2|sed 's/ //g')"
nontls="$(cat ~/log-install.txt | grep -w "Vless None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/vless-tls.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-vless-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/vless-tls.json
sed -i '/#xray-vless-nontls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/vless-nontls.json
xrayvless1="vless://${uuid}@${domain}:$tls?path=/gandring&security=tls&encryption=none&type=ws#${user}"
xrayvless2="vless://${uuid}@${domain}:$nontls?path=/gandring&encryption=none&type=ws#${user}"
systemctl restart xray@vless-tls
systemctl restart xray@vless-nontls
service cron restart
clear
echo -e ""
echo -e "♤♤♤♤♤ AKUN VLESS ♤♤♤♤♤"
echo -e "Remarks     : ${user}"
echo -e "IP/Host     : ${IP}"
echo -e "Address     : ${domain}"
echo -e "Port TLS    : $tls"
echo -e "Port No TLS : $nontls"
echo -e "User ID     : ${uuid}"
echo -e "Encryption  : none"
echo -e "Network     : ws"
echo -e "Path        : /gandring"
echo -e "Created     : $hariini"
echo -e "Expired     : $exp"
echo -e "♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤"
echo -e "Link TLS    : ${xrayvless1}"
echo -e "♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤"
echo -e "Link No TLS : ${xrayvless2}"
echo -e "♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤"
echo -e "Luxury Edition by @zerossl"
