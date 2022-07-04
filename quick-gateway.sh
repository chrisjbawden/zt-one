apt-get install iptables iptables-persistant -y
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables-save
