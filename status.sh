#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'

AKTIF="$bd Aktif [ ${green}Running${NC} ]"
ERROR="Error [ ${red}Not Running${NC} ]"

keook=()
gandring=()
declare ingfo=()


             
#=====================================

wsdrop=$(systemctl status ws-nontls | grep -i "active (running)")
wstls=$(systemctl status ws-tls | grep -i "active (running)")
wsopen=$(systemctl status ws-openssh | grep -i "active (running)")
wsovpn=$(systemctl status ws-ovpn | grep -i "active (running)")
v2ray=$(systemctl status xray@v2ray-tls | grep -i "active (running)")
v2none=$(systemctl status xray@v2ray-nontls | grep -i "active (running)")
vless=$(systemctl status xray@vless-tls | grep -i "active (running)")
vless-grpc=$(systemctl status xray@vless-grpc | grep -i "active (running)")
vnone=$(systemctl status xray@vless-nontls | grep -i "active (running)")
trojan=$(systemctl status xray@trojan | grep -i "active (running)")
trojang=$(systemctl status trojan-go | grep -i "active (running)")
ipsec=$(systemctl status ipsec | grep -i "active (running)")
shadowo=$(systemctl status shadowsocks-libev | grep -i "active (running)")
shadowh=$(systemctl status shadowsocks-libev-server@http | grep -i "active (running)")
ssr=$(systemctl status ssrmu | grep -i "active (running)")
sstp=$(systemctl status accel-ppp | grep -i "active (running)")
l2tp=$(systemctl status xl2tpd | grep -i "active (running)")
pptp=$(systemctl status pptpd | grep -i "active (running)")
wg=$(systemctl status wg-quick@wg0 | grep -i "active (running)")
wgws=$(systemctl status wg-quick@wg1 | grep -i "active (running)")
ssh=$(systemctl status ssh | grep -i "active (running)")
ssl=$(systemctl status stunnel5 | grep -i "active (running)")
drop=$(systemctl status dropbear | grep -i "active (running)")
ovpn=$(systemctl status openvpn | grep -i "active (running)")
nginx=$(systemctl status nginx | grep -i "active (running)")
squid=$(systemctl status squid | grep -i "active (running)")
cron=$(systemctl status cron | grep -i "active (running)")
fail2ban=$(systemctl status fail2ban | grep -i "active (running)")
vnstat=$(systemctl status vnstat | grep -i "active (running)")
sslh=$(systemctl status sslh | grep -i "active (running)")
ohp=$(systemctl status dropbear-ohp | grep -i "active (running)")
ohq=$(systemctl status openvpn-ohp | grep -i "active (running)")
ohr=$(systemctl status ssh-ohp | grep -i "active (running)")
wsstunnel=$(systemctl status wsstunnel | grep -i "active (running)")
wstunnel=$(systemctl status wstunnel | grep -i "active (running)")
privoxy=$(systemctl status privoxy | grep -i "active (running)")
#======================================

if [[ $wsdrop == "" ]]; then
      swsdrop=$ERROR
      info+=("WebSocket Dropbear")
      keook+=("err1")
else
      swsdrop=$AKTIF
      gandring+=("enjoooos1")
fi
if [[ $wsopen == "" ]]; then
      swsdrop=$ERROR
      info+=("WebSocket Openssh")
      keook+=("err2")
else
      swsopen=$AKTIF
      gandring+=("enjoooos2")
fi
if [[ $wstls == "" ]]; then
      swstls=$ERROR
      wstls+=("WebSocket TLS")
      keook+=("err3")
else
      swstls=$AKTIF
      gandring+=("enjoooos3")
fi
if [[ $wsovpn == "" ]]; then
      swsovpn=$ERROR
      info+=("WebSocket ovpn")
      keook+=("err4")
else
      swsovpn=$AKTIF
      gandring+=("enjoooos4")

fi
if [[ $v2ray == "" ]]; then
      sv2ray=$ERROR
      info+=("VMess TLS")
      keook+=("err5")
else
      sv2ray=$AKTIF
      gandring+=("enjoooos5")
fi
if [[ $v2none == "" ]]; then
      sv2none=$ERROR
      info+=("VMess NON-TLS")
      keook+=("err6")
else
      sv2none=$AKTIF
      gandring+=("enjoooos6")
fi
if [[ $vless == "" ]]; then
      svless=$ERROR
      info+=("VLess TLS")
      keook+=("err7")
else
      svless=$AKTIF
      gandring+=("enjoooos7")
fi
if [[ $vnone == "" ]]; then
      svnone=$ERROR
      ingfo+=("VLess NON-TLS")
      keook+=("err8")
else
      svnone=$AKTIF
      gandring+=("enjoooos8")
fi
if [[ $trojan == "" ]]; then
      strojan=$ERROR
      ingfo+=("Trojan-Gfw")
      keook+=("err9")
else
      strojan=$AKTIF
      gandring+=("enjoooos9")
fi
if [[ $trojang == "" ]]; then
      strojang=$ERROR
      ingfo+=("Trojan-GO")
      keook+=("err10")
else
      strojang=$AKTIF
      gandring+=("enjoooos10")
fi
if [[ $ipsec == "" ]]; then
      sipsec=$ERROR
      ingfo+=("IPSec Services")
      keook+=("err11")
else
      sipsec=$AKTIF
      gandring+=("enjoooos11")
fi
if [[ $shadow == "" ]]; then
      sshadow=$ERROR
      ingfo+=("Shadowsocks OBFS")
      keook+=("err12")
else
      sshadow=$AKTIF
      gandring+=("enjoooos12")
fi
if [[ $ssr == "" ]]; then
      sssr=$ERROR
      ingfo+=("ShadowsocksR")
      keook+=("err13")
else
      sssr=$AKTIF
      gandring+=("enjoooos13")
fi
if [[ $sstp == "" ]]; then
      ssstp=$ERROR
      ingfo+=("SSTP")
      keook+=("err14")
else
      ssstp=$AKTIF
      gandring+=("enjoooos14")
fi
if [[ $l2tp == "" ]]; then
      sl2tp=$ERROR
      ingfo+=("L2TP")
      keook+=("err15")
else
      sl2tp=$AKTIF
      gandring+=("enjoooos15")
fi
if [[ $pptp == "" ]]; then
      spptp=$ERROR
      ingfo+=("PPTP")
      keook+=("err16")
else
      spptp=$AKTIF
      gandring+=("enjoooos16")
fi
if [[ $wgws == "" ]]; then
      swgws =$ERROR
      ingfo+=("Wireguard Websocket")
      keook+=("err17")
else
      swg=$AKTIF
      gandring+=("enjoooos17")
fi
if [[ $ssh == "" ]]; then
      sssh=$ERROR
      ingfo+=("OpenSSH")
      keook+=("err18")
else
      sssh=$AKTIF
      gandring+=("enjoooos18")
fi
if [[ $ssl == "" ]]; then
      sssl=$ERROR
      ingfo+=("Stunnel5")
      keook+=("err19")
else
      sssl=$AKTIF
      gandring+=("enjoooos19")
fi
if [[ $drop == "" ]]; then
      sdrop=$ERROR
      ingfo+=("Dropbear")
      keook+=("err20")
else
      sdrop=$AKTIF
      gandring+=("enjoooos20")
fi
if [[ $ovpn == "" ]]; then
      sovpn=$ERROR
      ingfo+=("OpenVPN")
      keook+=("err21")
else
      sovpn=$AKTIF
      gandring+=("enjoooos21")
fi
if [[ $nginx == "" ]]; then
      snginx=$ERROR
      ingfo+=("Nginx")
      keook+=("err22")
else
      snginx=$AKTIF
      gandring+=("enjoooos22")
fi
if [[ $squid == "" ]]; then
      ssquid=$ERROR
      ingfo+=("Squid")
      keook+=("err23")
else
      ssquid=$AKTIF
      gandring+=("enjoooos23")
fi
if [[ $cron == "" ]]; then
      scron=$ERROR
      ingfo+=("Cron Services")
      keook+=("err24")
else
      scron=$AKTIF
      gandring+=("enjoooos24")
fi
if [[ $fail2ban == "" ]]; then
      sfail2ban=$ERROR
      ingfo+=("Fail2Ban Services")
      keook+=("err25")
else
      sfail2ban=$AKTIF
      gandring+=("enjoooos25")
fi
if [[ $vnstat == "" ]]; then
      svnstat=$ERROR
      ingfo+=("VnStats Services")
      keook+=("err26")
else
      svnstat=$AKTIF
      gandring+=("enjoooos26")
fi
if [[ $sslh == "" ]]; then
      ssslh=$ERROR
      ingfo+=("SSLH Services")
      keook+=("err27")
else
      ssslh=$AKTIF
      gandring+=("enjoooos27")
fi
if [[ $shadowo == "" ]]; then
      sshadowo=$ERROR
      ingfo+=("Shadosocks Obfs")
      keook+=("err28")
else
      sshadowo=$AKTIF
      gandring+=("enjoooos28")
fi
if [[ $shadowh == "" ]]; then
      sshadowh=$ERROR
      ingfo+=("Shadosocks Http")
      keook+=("err29")
else
      sshadowh=$AKTIF
      gandring+=("enjoooos29")
fi
if [[ $ohp == "" ]]; then
      sohp=$ERROR
      ingfo+=("OHP Dropbear")
      keook+=("err30")
else
      sohp=$AKTIF
      gandring+=("enjoooose30")
fi
if [[ $ohq == "" ]]; then
      sohq=$ERROR
      ingfo+=("OHP Ovpn")
      keook+=("err31")
else
      sohq=$AKTIF
      gandring+=("enjoooos31")
fi
if [[ $ohr == "" ]]; then
      sohr=$ERROR
      ingfo+=("OHP SSH")
      keook+=("err32")
else
      sohr=$AKTIF
      gandring+=("enjoooos32")
fi
if [[ $wsstunnel == "" ]]; then
      swsstunnel=$ERROR
      ingfo+=("Wss tunnel")
      keook+=("err33")
else
      swsstunel=$AKTIF
      gandring+=("enjoooos33")
fi
if [[ $wstunnel == "" ]]; then
      swstunnel=$ERROR
      ingfo+=("Ws tunnel")
      keook+=("err34")
else
      swstunel=$AKTIF
      gandring+=("enjoooos34")
fi
if [[ $privoxy == "" ]]; then
      sprivoxy=$ERROR
      ingfo+=("Privoxy")
      keook+=("err3t")
else
      sprivoxy=$AKTIF
      gandring+=("enjoooos35")
fi
if [[ $vless-grpc == "" ]]; then
      svless-grpc=$ERROR
      info+=("VLess gRPC")
      keook+=("err36")
else
      svless-grpc=$AKTIF
      gandring+=("enjoooos36")
fi
jumlah1="${#gandring[@]}"
jumlah2="${#keook[@]}"

if [[ $jumlah1 == "" ]] || [[ $jumlah1 -eq 0 ]]; then
     jumlah_aktif=0
else
     let gandring=${jumlah1}
     jumlah_aktif=$njoooos
fi
if [[ $jumlah2 == "" ]] || [[ $jumlah2 -eq 0 ]]; then
    jumlah_error=0
else
    let keook=${jumlah2}
    jumlah_error=$keook
fi

#=================================================================================================
clear

#echo -e "____________________________________________________________${off}" | lolcat
echo -e ""
echo -e "${purple}♤♤♤♤♤♤♤♤♤♤-[ STATUS LAYANAN ]-♤♤♤♤♤♤♤♤♤♤${off}" | lolcat
echo -e ""
echo -e " $mg - $off $bd Dropbear   $off                 : $sdrop "
echo -e " $mg - $off $bd OpenSSH      $off               : $sssh "
echo -e " $mg - $off $bd Stunnel5       $off             : $sssl "
echo -e " $mg - $off $bd OpenVPN           $off          : $sovpn "
echo -e " $mg - $off $bd Open HTTP Puncher Dropbear $off : $sohp "
echo -e " $mg - $off $bd Open HTTP Puncher OpenVPN $off  : $sohq "
echo -e " $mg - $off $bd Open HTTP Puncher SSH $off      : $sohr "
echo -e " $mg - $off $bd WebSocket Dropbear $off         : $swsdrop"
echo -e " $mg - $off $bd WebSocket OpenSSH $off          : $swsopen"
echo -e " $mg - $off $bd WebSocket OpenVPN $off          : $swsovpn"
echo -e " $mg - $off $bd WebSocket TLS      $off         : $swstls"
echo -e " $mg - $off $bd VMess TLS        $off           : $sv2ray "
echo -e " $mg - $off $bd VMess NON-TLS  $off             : $sv2none "
echo -e " $mg - $off $bd VLess TLS     $off              : $svless "
echo -e " $mg - $off $bd VLess NON-TLS    $off           : $svnone "
echo -r " $mg - $off $bd Vless gRPC         $off         : $svless-grpc "
echo -e " $mg - $off $bd Shadowsocks OBFS   $off         : $sshadow "
echo -e " $mg - $off $bd Shadowsocks HTTP    $off        : $sshadown "
echo -e " $mg - $off $bd ShadowsocksR        $off        : $sssr "
echo -e " $mg - $off $bd Wireguard Web    $off           : $swg "
echo -e " $mg - $off $bd Trojan-Gfw    $off              : $strojan "
echo -e " $mg - $off $bd Trojan-GO    $off               : $strojang "
echo -e " $mg - $off $bd IPSec       $off                : $sipsec "
echo -e " $mg - $off $bd SSTP       $off                 : $ssstp "
echo -e " $mg - $off $bd PPTP      $off                  : $spptp "
echo -e " $mg - $off $bd L2TP       $off                 : $sl2tp"
echo -e " $mg - $off $bd Nginx       $off                : $snginx "
echo -e " $mg - $off $bd Squid        $off               : $ssquid "
echo -e " $mg - $off $bd Cron            $off            : $scron "
echo -e " $mg - $off $bd Fail2Ban          $off          : $sfail2ban "
echo -e " $mg - $off $bd VnStats          $off           : $svnstat "
echo -e " $mg - $off $bd SSLH            $off            : $ssslh "
echo -e " $mg - $off $bd WSS Tunnel    $off              : $swsstunnel "
echo -e " $mg - $off $bd Ws Tunnel    $off               : $swstunnel "
echo -e " $mg - $off $bd Privoxy    $off                 : $sprivoxy "
echo -e "_____________________________________________________________" | lolcat
echo -e "${purple}♤♤♤♤♤♤♤♤♤♤-[ SOLO THE SPIRIT OF JAVA ]-♤♤♤♤♤♤♤♤♤♤${off}"  | lolcat
echo -e "${green}_______________________________________________________${off}" | lolcat
echo -e "  - Jumlah Services Running [ ${green}$jumlah_aktif${off} ]"
echo -e "  - Jumlah Services Error [ ${red}$jumlah_error${off} ]"

if [[ "${ingfo[@]}" != "" ]]; then
      echo -e ""
      echo -e "  ${red} !!! Peringatan !!!${off}"
for oo in "${ingfo[@]}"
  do
       echo -e "  - [${red} ${oo} ${off}] ${red}Error !!!${off}"
done
echo -e ""
min=0
sec=10
                while [ $min -ge 0 ]; do
                        while [ $sec -ge 0 ]; do
                                echo -ne " [#]  ${cyan}Auto Restart Services Dalam${off} [${green} $min:$sec ${off}]\033[0K\r"
                                 let "sec=sec-1"
                                 sleep 1
            done
            sec=10
            let "min=min-1"            
      done      
         echo -e " \n${green} Merestart Services... ${off}"
         sleep 1
                systemctl restart ssrmu
                systemctl restart ws-tls
                systemctl restart ws-open
                systemctl restart ws-nontls
                systemctl restart ws-ovpn
                systemctl restart xray@v2ray-tls
                systemctl restart xray@v2ray-nontls
                systemctl restart xray@vless-tls
                systemctl restart xray@vless-nontls
                systemctl restart xray@vless-grpc
                systemctl restart xray@trojan
                systemctl restart shadowsocks-libev
                systemctl restart shadowsocks-libev-server@$user-http
                systemctl restart xl2tpd
                systemctl restart pptpd
                systemctl restart ipsec
                systemctl restart accel-ppp
                systemctl restart ws-ovpn
                systemctl restart wg-quick@wg0
                systemctl restart wg-quick@wg1
                systemctl restart ssh-ohp
                systemctl restart dropbear-ohp
                systemctl restart openvpn-ohp
                systemctl restart trojan-go
                systemctl restart wsstunnel
                systemctl restart wstunnel
                systemctl restart sslh
                systemctl restart stunnel
                systemctl restart privoxy
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
fi
echo ""
echo -e "${pink}♤♤♤♤♤♤♤♤♤♤SOLO THE SPIRIT OF JAVA♤♤♤♤♤♤♤♤♤♤${off}" | lolcat
echo -e "${orange}_________________________________________________${off}" | lolcat
echo -e "${purple}Luxury Edition by @zerossl${off}"
echo -e ""
echo -e "${red}Silahkan ketik menu untuk menampilkan daftar layanan${off}"
echo -e "${blue}Silahkan ketik menu2 untuk tampilan klasik${off}"
echo -e ""
