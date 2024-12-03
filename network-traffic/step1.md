
# Step 1: Run BunkerWeb on Docker

In this step, you will launch the BunkerWeb container on port 80 (HTTP) and port 443 (HTTPS) using Docker.

## Run BunkerWeb on Ports 80 and 443

To start, we will update docker:

```bash
rm -f /usr/bin/docker && curl -fsSL https://get.docker.com/ | sh
```{{exec}}

To run your BunkerWeb stack, firstly, let's download a simple compose file:

```bash
wget https://github.com/bunkerity/bunkerweb/raw/refs/heads/master/examples/web-ui/docker-compose.wizard.yml -O docker-compose.yml
```{{exec}}

Let's verify the downloaded file:

```bash
cat docker-compose.yml
```{{exec}}

And now we can start the stack:

```bash
docker compose up -d
```{{exec}}

## Verify the Containers are running

Check if the containers are running by using the following command:

```bash
docker compose ps
```{{exec}}

The output should display the running containers with the ports **80** and **443** mapped.

## Access BunkerWeb UI

Once the container is running, you can access the BunkerWeb interface via this link:

[ACCESS BUNKERWEB UI (HTTP)]({{TRAFFIC_HOST1_8080}})
