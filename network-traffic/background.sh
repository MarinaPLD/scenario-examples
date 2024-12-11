# We need to redirect all traffic from port 3-65535 to port 2 so the user can create as many services as they want
iptables -t nat -A PREROUTING -p tcp --dport 3:65535 -j REDIRECT --to-port 2

# We need to change the WEB_UI_HOST variable in the docker-compose.yml file to a valid generated host
sed -i 's|${WEB_UI_HOST}|'"$(sed 's/PORT/1/g' /etc/killercoda/host | cut -d '/' -f 3)"'|g' docker-compose.yml

DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
COMPOSE_VERSION="$(curl -i https://github.com/docker/compose/releases/latest | grep -Po 'v[0-9]+\.[0-9]+\.[0-9]+')"
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
