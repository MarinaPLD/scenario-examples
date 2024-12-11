# We upgrade docker to the latest version
rm -f /usr/bin/docker && curl -fsSL https://get.docker.com/ | sh
dockerd &>/dev/null &
