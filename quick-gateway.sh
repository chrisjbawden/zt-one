ping 8.8.8.8 -c 10
sleep 10
apt-get install iptables -y
sleep 2
iptables -F
sleep 2
iptables -P FORWARD ACCEPT
iptables -P INPUT   ACCEPT
iptables -P OUTPUT  ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -s 127.0.0.0/8 -d 127.0.0.0/8 -i lo -j ACCEPT
iptables -t nat -A POSTROUTING -o eth+ -j MASQUERADE
/iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i zt+ -o eth+ -j ACCEPT
iptables-save
sleep 1
ping 8.8.8.8 -c 10
