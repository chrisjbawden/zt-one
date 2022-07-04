apt-get install iptables iptables-persistent -y
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables-save
