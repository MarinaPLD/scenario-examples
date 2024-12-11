# We need to redirect all traffic from port 3-65535 to port 2 so the user can create as many services as they want
iptables -t nat -A PREROUTING -p tcp --dport 3:65535 -j REDIRECT --to-port 2

# We upgrade docker to the latest version
rm -f /usr/bin/docker && curl -fsSL https://get.docker.com/ | sh
dockerd &>/dev/null &

# We need to change the WEB_UI_HOST variable in the docker-compose.yml file to a valid generated host
sed -i 's|${WEB_UI_HOST}|'"$(sed 's/PORT/1/g' /etc/killercoda/host | cut -d '/' -f 3)"'|g' docker-compose.yml
