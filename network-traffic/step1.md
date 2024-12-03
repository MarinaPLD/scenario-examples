sudo apt update -y && sudo apt upgrade -y
```{{exec}}

---

## Create the Configuration File

To ensure BunkerWeb runs correctly, create a configuration file named `bunkerweb.yml` with the following default settings:

```bash
cat <<EOF > bunkerweb.yml
server:
  default-security: true
  port: 8080
  ssl-port: 8443

security:
  headers:
    x-frame-options: "DENY"
    x-content-type-options: "nosniff"
    strict-transport-security: "max-age=31536000; includeSubDomains"

logs:
  level: "info"
  output: "stdout"
EOF
```{{exec}}

Verify the file content:

```bash
cat bunkerweb.yml
```{{exec}}

---

## Run BunkerWeb in a Docker Container

Now, start the BunkerWeb container using the `docker run` command. This command maps HTTP traffic to port **8080** and HTTPS traffic to port **8443**, and mounts the configuration file:

```bash
docker run -d \
  -p 8080:8080 \
  -p 8443:8443 \
  --name bunkerweb \
  -v $(pwd)/bunkerweb.yml:/etc/bunkerweb/bunkerweb.yml \
  bunkerity/bunkerweb:1.6.0-beta
```{{exec}}

---

## Verify the Container is Running

Check if the container is running using:

```bash
docker ps
```{{exec}}

The output should show a container with the name **bunkerweb** and the ports **8080** and **8443** mapped.

Example output:
