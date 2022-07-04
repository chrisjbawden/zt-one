apt-get install iptables iptables-persistant
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables-save
