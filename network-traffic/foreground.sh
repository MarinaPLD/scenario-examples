echo "waiting for init-background-script to finish"
while [ ! -f /tmp/background ]; do sleep 1; done
echo "Here we go! 🚀"
