
# Step 1: Run BunkerWeb on Docker

In this step, you will launch the BunkerWeb container on port 80 (HTTP) and port 443 (HTTPS) using Docker.

## Run BunkerWeb on Ports 80 and 443

To start update and upgrade your system:

```bash
sudo apt update -y && sudo apt upgrade -y
```{{exec}}

To run your BunkerWeb stack, firstly, let's download a simple compose file:

```bash
wget https://github.com/bunkerity/bunkerweb/raw/refs/heads/master/examples/reverse-proxy-multisite/docker-compose.yml
```{{exec}}

Let's verify the downloaded file:

```bash
cat docker-compose.yml
```{{exec}}

## Verify the Container is Running

Check if the container is running by using the following command:

```bash
docker ps
```{{exec}}

The output should display a container with the name **bunkerity/bunkerweb** and the ports **8080** and **8443** mapped.

## Access BunkerWeb UI

Once the container is running, you can access the BunkerWeb interface via this link:

[ACCESS BUNKERWEB UI (HTTP)]({{TRAFFIC_HOST1_8080}})
