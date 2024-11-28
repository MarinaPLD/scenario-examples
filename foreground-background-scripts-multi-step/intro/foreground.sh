echo waiting for init-background-script to finish
while [ ! -f /tmp/background0 ]; do sleep 1; done
echo Welcome to the BunkerWeb Installation Tutorial!