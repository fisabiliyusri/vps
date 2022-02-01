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
# Repacked By gandring
# ==================================================
# Link Hosting Kalian
geovpn="raw.githubusercontent.com/Gandring15/vps/main/ssh"

# initialisasi var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
IP=$(wget -qO- ipinfo.io/ip);
IP2="s/xxxxxxxxx/$IP/g";
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
http-proxy xxxxxxxxx 3000
resolv-retry infinite
dhcp-option DNS 8.8.8.8
dhcp-option DNS 8.8.4.4
allow-recursive-routing
ifconfig-nowarn
connect-retry-max 1
connect-retry 1 300
resolv-retry 60
connect-timeout  5
tun-mtu 1342
tun-mtu-extra 32
mssfix 1450
sndbuf 524288
rcvbuf 524288
persist-key
persist-tun
ping 0
ping-restart 0
ping-timer-rem
reneg-sec 0
route-method exe
nobind
persist-key
persist-tun
pull
fast-io
cipher AES-256-CBC
auth-user-pass
comp-lzo
verb 1
END

sed -i $IP2 /etc/openvpn/config-tcp.ovpn;

# Buat config client UDP 3224
cat > /etc/openvpn/config-udp.ovpn <<-END
client
dev tun
proto udp
remote xxxxxxxxx 3224
http-proxy xxxxxxxxx 3000
resolv-retry infinite
dhcp-option DNS 8.8.8.8
dhcp-option DNS 8.8.4.4
allow-recursive-routing
ifconfig-nowarn
connect-retry-max 1
connect-retry 1 300
resolv-retry 60
connect-timeout  5
tun-mtu 1342
tun-mtu-extra 32
mssfix 1450
sndbuf 524288
rcvbuf 524288
route-method exe
nobind
persist-key
persist-tun
pull
fast-io
cipher AES-256-CBC
auth-user-pass
comp-lzo
verb 1
END

sed -i $IP2 /etc/openvpn/config-udp.ovpn;

# Buat config client SSL 3269
cat > /etc/openvpn/config-ssl.ovpn <<-END
client
dev tun
proto tcp
remote xxxxxxxxx 3269
http-proxy xxxxxxxxx 3000
resolv-retry infinite
dhcp-option DNS 8.8.8.8
dhcp-option DNS 8.8.4.4
allow-recursive-routing
ifconfig-nowarn
connect-retry-max 1
connect-retry 1 300
resolv-retry 60
connect-timeout  5
tun-mtu 1342
tun-mtu-extra 32
mssfix 1450
sndbuf 524288
rcvbuf 524288
route-method exe
nobind
persist-key
persist-tun
pull
fast-io
cipher AES-256-CBC
auth-user-pass
comp-lzo
verb 1
END

sed -i $IP2 /etc/openvpn/config-ssl.ovpn;

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

cd /home/vps/public_html/
zip cfg.zip config-tcp.ovpn config-udp.ovpn config-ssl.ovpn > /dev/null 2>&1
cd
cat <<'wisnu&gandring' > /home/vps/public_html/index.html
<!DOCTYPE html>
<html qlang="en">
<!--🔆SOLO THE SPIRIT OF JAVA🔆

<!-- 🔰wisnu & gandring configurasi🔰 -->

<head><meta charset="utf-8" /><title>🔅Silahkan Pilih Config🔅</title><meta name="description" content="Server" /><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" /><meta name="theme-color" content="#000000" /><link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"><link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"><link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.3/css/mdb.min.css" rel="stylesheet"></head><body><div class="container justify-content-center" style="margin-top:9em;margin-bottom:5em;"><div class="col-md"><div class="view"><img src="https://openvpn.net/wp-content/uploads/openvpn.jpg" class="card-img-top"><div class="mask rgba-white-slight"></div></div><div class="card"><div class="card-body"><h5 class="card-title">Config List</h5><br /><ul class="list-group">

<li class="list-group-item justify-content-between align-items-center" style="margin-bottom:1em;"><p>TCP <span class="badge light-blue darken-4">config android/iOS/PC</span><br /><small></small></p><a class="btn btn-outline-success waves-effect btn-sm" href="http://IP-ADDRESS:88/tcp.ovpn" style="float:right;"><i class="fa fa-download"></i> Download</a></li>

<li class="list-group-item justify-content-between align-items-center" style="margin-bottom:1em;"><p>UDP <span class="badge light-blue darken-4">config android/iOS/PC</span><br /><small></small></p><a class="btn btn-outline-success waves-effect btn-sm" href="http://IP-ADDRESS:88/udp.ovpn" style="float:right;"><i class="fa fa-download"></i> Download</a></li>

<li class="list-group-item justify-content-between align-items-center" style="margin-bottom:1em;"><p>SSL <span class="badge light-blue darken-4">config android/iOS/PC</span><br /><small></small></p><a class="btn btn-outline-success waves-effect btn-sm" href="http://IP-ADDRESS:88/ssl.ovpn" style="float:right;"><i class="fa fa-download"></i> Download</a></li>

<li class="list-group-item justify-content-between align-items-center" style="margin-bottom:1em;"><p> ALL.zip <span class="badge light-blue darken-4">config android/iOS/PC</span><br /><small></small></p><a class="btn btn-outline-success waves-effect btn-sm" href="http://IP-ADDRESS:88/cfg.zip" style="float:right;"><i class="fa fa-download"></i> Download</a></li>

</ul></div></div></div></div></body></html>
wisnu&gandring

sed -i "s|IP-ADDRESS|$(wget -qO- ipinfo.io/ip)|g"; /home/vps/public_html/index.html
rm -f /root/vpn.sh
clear
