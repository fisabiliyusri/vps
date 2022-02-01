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
#wsopen=$(systemctl status ws-openssh | grep -i "active (running)")
wsovpn=$(systemctl status ws-ovpn | grep -i "active (running)")
v2ray=$(systemctl status xray@v2ray-tls | grep -i "active (running)")
v2none=$(systemctl status xray@v2ray-nontls | grep -i "active (running)")
vless=$(systemctl status xray@vless-tls | grep -i "active (running)")
vnone=$(systemctl status xray@vless-nontls | grep -i "active (running)")
trojan=$(systemctl status xray@trojan | grep -i "active (running)")
trojang=$(systemctl status trojan-go | grep -i "active (running)")
ipsec=$(systemctl status ipsec | grep -i "active (running)")
shadow=$(systemctl status shadowsocks-libev | grep -i "active (running)")
#shadown=$(systemctl status shadowsocks-libev-server@http | grep -i "active (running)")
ssr=$(systemctl status ssrmu | grep -i "active (running)")
sstp=$(systemctl status accel-ppp | grep -i "active (running)")
l2tp=$(systemctl status xl2tpd | grep -i "active (running)")
pptp=$(systemctl status pptpd | grep -i "active (running)")
wg=$(systemctl status wg-quick@wg0 | grep -i "active (exited)")

ssh=$(systemctl status ssh | grep -i "active (running)")
ssl=$(systemctl status stunnel5 | grep -i "active (running)")
drop=$(systemctl status dropbear | grep -i "active (running)")
ovpn=$(systemctl status openvpn | grep -i "active (exited)")
nginx=$(systemctl status nginx | grep -i "active (running)")
squid=$(systemctl status squid | grep -i "active (running)")
cron=$(systemctl status cron | grep -i "active (running)")
fail2ban=$(systemctl status fail2ban | grep -i "active (running)")
vnstat=$(systemctl status vnstat | grep -i "active (running)")
ksslh=$(systemctl status sslh | grep -i "active (running)")
ohp=$(systemctl status dropbear-ohp | grep -i "active (running)")
ohq=$(systemctl status openvpn-ohp | grep -i "active (running)")
ohr=$(systemctl status ssh-ohp | grep -i "active (running)")
wsstunnel=$(systemctl status wsstunnel | grep -i "active (running)")
#======================================

if [[ $wsdrop == "" ]]; then
      swsdrop=$ERROR
      info+=("WebSocket Dropbear")
      keook+=("err1")
else
      swsdrop=$AKTIF
      gandring+=("enjoooos1")
fi

if [[ $wstls == "" ]]; then
      swstls=$ERROR
      wstls+=("WebSocket TLS")
      keook+=("err2")
else
      swstls=$AKTIF
      gandring+=("enjoooos2")
fi

if [[ $wsovpn == "" ]]; then
      swsovpn=$ERROR
      info+=("WebSocket ovpn")
      keook+=("err3")
else
      swsovpn=$AKTIF
      gandring+=("enjoooos3")

fi

if [[ $v2ray == "" ]]; then
      sv2ray=$ERROR
      info+=("V2ray/VMess TLS")
      keook+=("err4")
else
      sv2ray=$AKTIF
      gandring+=("enjoooos4")
fi

if [[ $v2none == "" ]]; then
      sv2none=$ERROR
      info+=("V2ray/VMess NON-TLS")
      keook+=("err5")
else
      sv2none=$AKTIF
      gandring+=("enjoooos5")
fi

if [[ $vless == "" ]]; then
      svless=$ERROR
      info+=("V2ray/VLess TLS")
      keook+=("err6")
else
      svless=$AKTIF
      gandring+=("enjoooos6")
fi

if [[ $vnone == "" ]]; then
      svnone=$ERROR
      ingfo+=("V2ray/VLess NON-TLS")
      keook+=("err7")
else
      svnone=$AKTIF
      gandring+=("enjoooos7")
fi

if [[ $trojan == "" ]]; then
      strojan=$ERROR
      ingfo+=("Trojan")
      keook+=("err8")
else
      strojan=$AKTIF
      gandring+=("enjoooos8")
fi

if [[ $trojang == "" ]]; then
      strojang=$ERROR
      ingfo+=("TrojanGO")
      keook+=("err9")
else
      strojang=$AKTIF
      gandring+=("enjoooos9")
fi

if [[ $ipsec == "" ]]; then
      sipsec=$ERROR
      ingfo+=("IPSec Services")
      keook+=("err10")
else
      sipsec=$AKTIF
      gandring+=("enjoooos10")
fi

if [[ $shadow == "" ]]; then
      sshadow=$ERROR
      ingfo+=("Shadowsocks OBFS")
      keook+=("err11")
else
      sshadow=$AKTIF
      gandring+=("enjoooos11")
fi

if [[ $ssr == "" ]]; then
      sssr=$ERROR
      ingfo+=("ShadowsocksR/SSR")
      keook+=("err12")
else
      sssr=$AKTIF
      gandring+=("enjoooos12")
fi

if [[ $sstp == "" ]]; then
      ssstp=$ERROR
      ingfo+=("SSTP")
      keook+=("err13")
else
      ssstp=$AKTIF
      gandring+=("enjoooos13")
fi

if [[ $l2tp == "" ]]; then
      sl2tp=$ERROR
      ingfo+=("L2TP")
      keook+=("err14")
else
      sl2tp=$AKTIF
      gandrin+=("enjoooos14")
fi

if [[ $pptp == "" ]]; then
      spptp=$ERROR
      ingfo+=("PPTP")
      keook+=("err15")
else
      spptp=$AKTIF
      gandring+=("enjoooos15")
fi

if [[ $wg == "" ]]; then
      swg=$ERROR
      ingfo+=("Wireguard")
      keook+=("err16")
else
      swg=$AKTIF
      gandring+=("enjoooos16")
fi

if [[ $ssh == "" ]]; then
      sssh=$ERROR
      ingfo+=("OpenSSH")
      keook+=("err17")
else
      sssh=$AKTIF
      gandring+=("enjoooos17")
fi

if [[ $ssl == "" ]]; then
      sssl=$ERROR
      ingfo+=("Stunnel4")
      keook+=("err18")
else
      sssl=$AKTIF
      gandring+=("enjoooos18")
fi

if [[ $drop == "" ]]; then
      sdrop=$ERROR
      ingfo+=("Dropbear")
      keook+=("err19")
else
      sdrop=$AKTIF
      gandring+=("enjoooos19")
fi

if [[ $ovpn == "" ]]; then
      sovpn=$ERROR
      ingfo+=("OpenVPN")
      keook+=("err20")
else
      sovpn=$AKTIF
      gandring+=("enjoooos20")
fi

if [[ $nginx == "" ]]; then
      snginx=$ERROR
      ingfo+=("Nginx")
      keook+=("err21")
else
      snginx=$AKTIF
      gandring+=("enjoooos21")
fi

if [[ $squid == "" ]]; then
      ssquid=$ERROR
      ingfo+=("Squid")
      keook+=("err22")
else
      ssquid=$AKTIF
      gandring+=("enjoooos22")
fi

if [[ $cron == "" ]]; then
      scron=$ERROR
      ingfo+=("Cron Services")
      keook+=("err23")
else
      scron=$AKTIF
      gandring+=("enjoooos23")
fi

if [[ $fail2ban == "" ]]; then
      sfail2ban=$ERROR
      ingfo+=("Fail2Ban Services")
      keook+=("err24")
else
      sfail2ban=$AKTIF
      gandring+=("enjoooos24")
fi

if [[ $vnstat == "" ]]; then
      svnstat=$ERROR
      ingfo+=("VnStats Services")
      keook+=("err25")
else
      svnstat=$AKTIF
      gandring+=("enjoooos25")
fi

if [[ $ksslh == "" ]]; then
      sksslh=$ERROR
      ingfo+=("SSLH Services")
      keook+=("err26")
else
      sksslh=$AKTIF
      gandring+=("enjoooos26")
fi

if [[ $shadown == "" ]]; then
      sshadown=$ERROR

fi

if [[ $ohp == "" ]]; then
      sohp=$ERROR
      ingfo+=("OHP Dropbear")
      keook+=("err28")
else
      sohp=$AKTIF
      gandring+=("enjoooos28")
fi

if [[ $ohq == "" ]]; then
      sohq=$ERROR
      ingfo+=("OHP Ovpn")
      keook+=("err29")
else
      sohq=$AKTIF
      gandring+=("enjoooos29")
fi

if [[ $ohr == "" ]]; then
      sohr=$ERROR
      ingfo+=("OHP SSH")
      keook+=("err3O")
else
      sohr=$AKTIF
      gandring+=("enjoooos30")
fi

if [[ $wsstunnel == "" ]]; then
      $wsstunnel=$ERROR
      ingfo+=("Wss tunnel")
      $keook+=("err31")
else
      $wsstunel=$AKTIF
      $gandring+=("enjoooos31")
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

#echo -e "###################################################################################" | lolcat
echo -e ""
echo -e "${cyan}♤♤♤♤♤♤♤♤♤♤-[ STATUS LAYANAN ]-♤♤♤♤♤♤♤♤♤♤${off}"
echo -e ""
echo -e " $mg - $off $bd Dropbear          $off          : $sdrop "
echo -e " $mg - $off $bd OpenSSH           $off          : $sssh "
echo -e " $mg - $off $bd Stunnel5          $off          : $sssl "
echo -e " $mg - $off $bd OpenVPN            $off         : $sovpn "
echo -e " $mg - $off $bd Open HTTP Puncher Dropbear $off : $sohp "
echo -e " $mg - $off $bd Open HTTP Puncher OpenVPN $off  : $sohq "
echo -e " $mg - $off $bd Open HTTP Puncher SSH $off      : $sohr "
echo -e " $mg - $off $bd WebSocket Dropbear $off         : $swsdrop"
#echo -e " $mg - $off $bd WebSocket OpenSSH   $off       : $swsopen"
echo -e " $mg - $off $bd WebSocket OpenVPN  $off         : $swsovpn"
echo -e " $mg - $off $bd WebSocket TLS    $off           : $swstls"
echo -e " $mg - $off $bd VMess TLS         $off          : $sv2ray "
echo -e " $mg - $off $bd VMess NON-TLS    $off           : $sv2none "
echo -e " $mg - $off $bd VLess TLS          $off         : $svless "
echo -e " $mg - $off $bd VLess NON-TLS      $off         : $svnone "
echo -e " $mg - $off $bd Shadowsocks       $off          : $sshadow "
#echo -e " $mg - $off $bd Shadowsocks HTTP  $off         : $sshadown "
echo -e " $mg - $off $bd Wireguard        $off           : $swg "
echo -e " $mg - $off $bd Trojan           $off           : $strojan "
echo -e " $mg - $off $bd TrojanGO   $off                 : $strojang "
echo -e " $mg - $off $bd IPSec           $off            : $sipsec "
echo -e " $mg - $off $bd SSR              $off           : $sssr "
echo -e " $mg - $off $bd SSTP            $off            : $ssstp "
echo -e " $mg - $off $bd PPTP              $off          : $spptp "
echo -e " $mg - $off $bd L2TP            $off            : $sl2tp"
echo -e " $mg - $off $bd Nginx          $off             : $snginx "
echo -e " $mg - $off $bd Squid           $off            : $ssquid "
echo -e " $mg - $off $bd Cron            $off            : $scron "
echo -e " $mg - $off $bd Fail2Ban        $off            : $sfail2ban "
echo -e " $mg - $off $bd VnStats         $off            : $svnstat "
echo -e " $mg - $off $bd SSLH /SSH       $off            : $sksslh "
echo -e " $mg - $off $bd WSS Tunnel      $off            : $swsstunnel "
echo -e ""
echo -e "${cyan}♤♤♤♤♤♤♤♤♤♤-[ STATUS LAYANAN ]-♤♤♤♤♤♤♤♤♤♤${off}"
echo -e ""
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
                systemctl restart ws-nontls
                systemctl restart ws-ovpn
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
fi
echo ""
echo -e "${cyan}♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤♤${off}"
echo -e ""
echo -e "${purple}Luxury Repacked by @zerossl${off}"
echo -e ""
echo -e "${red}Silahkan ketik menu untuk menampilkan daftar layanan${off}"
echo -e "${green}Silahkan ketik menu2 untuk tampilan klasik${off}"
echo -e ""
