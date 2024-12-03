# Step 2: Configure BunkerWeb

BunkerWeb uses a configuration file called `bunkerweb.yml` to define its behavior. In this scenario, a custom configuration file is already provided.

```bash
cat <<EOF > bunkerweb.yml
version: "3.5"

services:
  bunkerweb:
    image: bunkerity/bunkerweb:1.5.12
    ports:
      - 80:8080
      - 443:8443
    labels:
      - "bunkerweb.INSTANCE=yes"
    environment:
      - SERVER_NAME=
      - DATABASE_URI=mariadb+pymysql://bunkerweb:changeme@bw-db:3306/db
      - AUTOCONF_MODE=yes
      - MULTISITE=yes
      - API_WHITELIST_IP=127.0.0.0/8 10.20.30.0/24
    networks:
      - bw-universe
      - bw-services

  bw-autoconf:
    image: bunkerity/bunkerweb-autoconf:1.5.12
    depends_on:
      - bunkerweb
      - bw-docker
    environment:
      - DATABASE_URI=mariadb+pymysql://bunkerweb:changeme@bw-db:3306/db
      - AUTOCONF_MODE=yes
      - DOCKER_HOST=tcp://bw-docker:2375
    networks:
      - bw-universe
      - bw-docker

  bw-scheduler:
    image: bunkerity/bunkerweb-scheduler:1.5.12
    depends_on:
      - bunkerweb
      - bw-docker
    environment:
      - DATABASE_URI=mariadb+pymysql://bunkerweb:changeme@bw-db:3306/db
      - DOCKER_HOST=tcp://bw-docker:2375
      - AUTOCONF_MODE=yes
    networks:
      - bw-universe
      - bw-docker

  bw-docker:
    image: tecnativa/docker-socket-proxy:nightly
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro
    environment:
      - CONTAINERS=1
      - LOG_LEVEL=warning
    networks:
      - bw-docker

  bw-db:
    image: mariadb:10.10
    environment:
      - MYSQL_RANDOM_ROOT_PASSWORD=yes
      - MYSQL_DATABASE=db
      - MYSQL_USER=bunkerweb
      - MYSQL_PASSWORD=changeme
    volumes:
      - bw-data:/var/lib/mysql
    networks:
      - bw-docker

volumes:
  bw-data:

networks:
  bw-universe:
    name: bw-universe
    ipam:
      driver: default
      config:
        - subnet: 10.20.30.0/24
  bw-services:
    name: bw-services
  bw-docker:
    name: bw-docker"
EOF
```{{exec}}

### View the Configuration File

Use the following command to inspect the `bunkerweb.yml` file:

```bash
nano bunkerweb.yml
```{{exec}}

---

This file enables default security policies for the web server. You can customize it further if needed.

Once verified, proceed to the next step to access the BunkerWeb UI.


# Step 3: Access BunkerWeb

With the container running, you can access the BunkerWeb user interface.

## Open the BunkerWeb Dashboard

Click the following links to access the dashboard:
- **HTTP**: [Access BunkerWeb HTTP]({{TRAFFIC_HOST1_8080}})
- **HTTPS**: [Access BunkerWeb HTTPS]({{TRAFFIC_HOST1_8443}})

### Verify BunkerWeb is Running
If you encounter any issues:
1. Check the container logs:
   ```bash
   docker logs bunkerweb
   ```{{exec}}
2. Restart the container if necessary:
   ```bash
   docker restart bunkerweb
   ```{{exec}}
