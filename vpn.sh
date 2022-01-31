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
# Repacked By gandring
# ==================================================
# Link Hosting Kalian
geovpn="raw.githubusercontent.com/Gandring15/vps/main/ssh"

# initialisasi var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(wget -qO- ifconfig.me/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NIC=$(ip -o $NIC -4 route show to default | awk '{print $5}');

# Install OpenVPN dan Easy-RSA
apt install openvpn easy-rsa unzip -y
apt install openssl iptables iptables-persistent -y
mkdir -p /etc/openvpn/server/easy-rsa/
cd /etc/openvpn/
wget https://raw.githubusercontent.com/Gandring15/vps/main/vpn.zip
unzip vpn.zip
rm -f vpn.zip
chown -R root:root /etc/openvpn/server/easy-rsa/

cd
mkdir -p /usr/lib/openvpn/
cp /usr/lib/x86_64-linux-gnu/openvpn/plugins/openvpn-plugin-auth-pam.so /usr/lib/openvpn/openvpn-plugin-auth-pam.so

# nano /etc/default/openvpn
sed -i 's/#AUTOSTART="all"/AUTOSTART="all"/g' /etc/default/openvpn

# restart openvpn dan cek status openvpn
systemctl enable --now openvpn-server@server-config-tcp
systemctl enable --now openvpn-server@server-config-udp
systemctl enable --now openvpn-server@server-config-ssl
/etc/init.d/openvpn restart
/etc/init.d/openvpn status

# aktifkan ip4 forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf

# Buat config client TCP 3268
cat > /etc/openvpn/config-tcp.ovpn <<-END
client
dev tun
proto tcp
remote xxxxxxxxx 3268
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass
comp-lzo
verb 1
END

sed -i $MYIP2 /etc/openvpn/config-tcp.ovpn;

# Buat config client UDP 3224
cat > /etc/openvpn/config-udp.ovpn <<-END
client
dev tun
proto udp
remote xxxxxxxxx 3224
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass
comp-lzo
verb 1
END

sed -i $MYIP2 /etc/openvpn/config-udp.ovpn;

# Buat config client SSL 3269
cat > /etc/openvpn/config-ssl.ovpn <<-END
client
dev tun
proto tcp
remote xxxxxxxxx 3269
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass
comp-lzo
verb 1
END

sed -i $MYIP2 /etc/openvpn/config-ssl.ovpn;

cd
# pada tulisan xxx ganti dengan alamat ip address VPS anda 
/etc/init.d/openvpn restart

# masukkan certificatenya ke dalam config client TCP 3268
echo '<ca>' >> /etc/openvpn/config-tcp.ovpn
echo '<key>' >> /etc/openvpn/config-tcp.ovpn
echo '<cert>' >> /rtc/openvpn/config-tcp.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/config-tcp.ovpn
cat /etc/openvpn/server/server.key >> /etc/openvpn/config-tcp.ovpn
cat /etc/openvpn/server/server.crt >> etc/openvpn/config-tcp.ovpn
echo '</ca>' >> /etc/openvpn/config-tcp.ovpn
echo '</key>' >> /etc/openvpn/config-tcp.ovpn
echo '</cert>' >> etc/openvpn/config-tcp.ovpn
# Copy config OpenVPN client ke home directory root agar mudah didownload ( TCP 3268 )
cp /etc/openvpn/config-tcp.ovpn /home/vps/public_html/config-tcp.ovpn

# masukkan certificatenya ke dalam config client UDP 3224
echo '<ca>' >> /etc/openvpn/config-udp.ovpn
echo '<key>' >> /etc/openvpn/config-udp.ovpn
echo '<cert>' >> /rtc/openvpn/config-udp.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/config-udp.ovpn
cat /etc/openvpn/server/server.key >> /etc/openvpn/config-udp.ovpn
cat /etc/openvpn/server/server.crt >> etc/openvpn/config-udp.ovpn
echo '</ca>' >> /etc/openvpn/config-udp.ovpn
echo '</key>' >> /etc/openvpn/config-udp.ovpn
echo '</cert>' >> etc/openvpn/config-udp.ovpn
# Copy config OpenVPN client ke home directory root agar mudah didownload ( UDP 3224 )
cp /etc/openvpn/config-udp.ovpn /home/vps/public_html/config-udp.ovpn

# masukkan certificatenya ke dalam config client SSL 3269
echo '<ca>' >> /etc/openvpn/config-ssl.ovpn
echo '<key>' >> /etc/openvpn/config-ssl.ovpn
echo '<cert>' >> /rtc/openvpn/config-ssl.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/config-ssl.ovpn
cat /etc/openvpn/server/server.key >> /etc/openvpn/config-ssl.ovpn
cat /etc/openvpn/server/server.crt >> etc/openvpn/config-ssl.ovpn
echo '</ca>' >> /etc/openvpn/config-ssl.ovpn
echo '</key>' >> /etc/openvpn/config-ssl.ovpn
echo '</cert>' >> etc/openvpn/config-ssl.ovpn
# Copy config OpenVPN client ke home directory root agar mudah didownload ( SSL 3269 )
cp /etc/openvpn/config-ssl.ovpn /home/vps/public_html/config-ssl.ovpn

#firewall untuk memperbolehkan akses UDP dan akses jalur TCP

iptables -t nat -I POSTROUTING -s 10.6.0.0/24 -o $NIC -j MASQUERADE
iptables -t nat -I POSTROUTING -s 10.7.0.0/24 -o $NIC -j MASQUERADE
iptables -t nat -I POSTROUTING -s 10.8.0.0/24 -o $NIC -j MASQUERADE
iptables-save > /etc/iptables.up.rules
chmod +x /etc/iptables.up.rules

iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# Restart service openvpn
systemctl enable openvpn
systemctl start openvpn
/etc/init.d/openvpn restart
rm -f /root/vpn.sh
clear
