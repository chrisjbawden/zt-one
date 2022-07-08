update(){
apt-get install iptables -y
}
routing() {
iptables -F
iptables -P FORWARD ACCEPT
iptables -P INPUT   ACCEPT
iptables -P OUTPUT  ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -s 127.0.0.0/8 -d 127.0.0.0/8 -i lo -j ACCEPT
iptables -t nat -A POSTROUTING -o eth+ -j MASQUERADE
iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i zt+ -o eth+ -j ACCEPT
iptables -A OUTPUT -o zt+ -j ACCEPT
iptables -I INPUT -i zt+ -j ACCEPT
iptables -I INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables-save
}
clean() {
rm quick-gateway.sh
}

update
routing
clean
