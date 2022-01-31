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
MYIP=$(wget -qO- ifconfig.me/ip);
echo -e "checking vps"
# Link Hosting Kalian
curl https://rclone.org/install.sh | bash
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://raw.githubusercontent.com/Gandring15/vps/main/rclone.conf"
git clone  https://github.com/magnific0/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account default
host smtp.gmail.com
port 587
auth on
user djarumpentol01@gmail.com
from djarumpentol01@gmail.com
password janoko85
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
cd /usr/bin
wget -O autobackup "https://raw.githubusercontent.com/Gandring15/vps/main/autobackup.sh"
wget -O backup "https://raw.githubusercontent.com/Gandring15/vps/main/backup.sh"
wget -O restore "https://raw.githubusercontent.com/Gandring15/vps/main/restore.sh"
wget -O strt "https://raw.githubusercontent.com/Gandring15/vps/main/strt.sh"
wget -O limitspeed "https://raw.githubusercontent.com/Gandring15/vps/main/limitspeed.sh"
chmod +x autobackup
chmod +x backup
chmod +x restore
chmod +x strt
chmod +x limitspeed
cd
rm -f /root/set-br.sh
