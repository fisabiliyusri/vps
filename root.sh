#!/bin/bash
# Simpel Change Root For Linux ( ALL LINUX OS )
# ================================================

# Clear
clear
rm -f root.sh

# Get Passwd
read -p "Tolong Input Password Baru Buat User Root : " Pass

# Starting Changes To Root
rm -f /etc/ssh/sshd_config
wget -O /etc/ssh/sshd_config https://raw.githubusercontent.com/Gandring15/vps/main/sshd
echo -e "$Pass\n$Pass\n"|passwd root &> /dev/null
IP=$(wget -qO- ipinfo.io/ip);

# Successful
clear
echo "Please Save This VPS Account Information" | lolcat
echo "============================================" | lolcat
echo "  IP ADDRESS = $IP" | lolcat
echo "  Username   = root" | lolcat
echo "  Password   = $Pass" | lolcat
echo "============================================" | lolcat
echo ""
#echo "VPS Will Rebooting On 5 Second !!!!!"

#rm -f root.sh
#sleep 5
#reboot
 
