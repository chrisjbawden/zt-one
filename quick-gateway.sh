ping 8.8.8.8 -c 10
sleep 10
apt-get install iptables -y
sleep 2
iptables -F
sleep 2
iptables -I INPUT -i zt+ -j ACCEPT
iptables -I INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables-save
sleep 1
ping 8.8.8.8 -c 10
