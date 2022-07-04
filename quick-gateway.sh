sleep 10
apt-get install iptables -y
sleep 2
iptables -F
sleep 2
/sbin/iptables -P FORWARD ACCEPT
/sbin/iptables -P INPUT   ACCEPT
/sbin/iptables -P OUTPUT  ACCEPT
sleep 2
/sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
sleep 2
/sbin/iptables -A INPUT -s 127.0.0.0/8 -d 127.0.0.0/8 -i lo -j ACCEPT
sleep 2
iptables -t nat -A POSTROUTING -j MASQUERADE
sleep 1
ping 8.8.8.8 -c 10
