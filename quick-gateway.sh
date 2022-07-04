sleep 10
rm quick-gateway.*
sleep 2
apt-get install iptables iptables-persistent -y
sleep 2
iptables -t nat -A POSTROUTING -j MASQUERADE
sleep 2
iptables-save &
ping 8.8.8.8 -c 10
sleep 10; rm quick-gateway.sh &
