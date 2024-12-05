sed +x
sleep 3

iptables -t nat -A PREROUTING -p tcp --dport 3:65535 -j REDIRECT --to-port 2

sed -i 's|${WEB_UI_HOST}|'"$(sed 's/PORT/1/g' /etc/killercoda/host | cut -d '/' -f 3)"'|g' docker-compose.yml
