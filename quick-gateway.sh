sleep 10
apt-get install iptables iptables-persistent -y
sleep 2
iptables -t nat -A POSTROUTING -j MASQUERADE
sleep 2
iptables-save
rm quick-gateyway.sh
