
# Step 1: Run BunkerWeb on Docker

In this step, you will launch the BunkerWeb container on port 80 (HTTP) and port 443 (HTTPS) using Docker.

## Run BunkerWeb on Ports 80 and 443

To start BunkerWeb as a Docker container in the foreground, execute:

```bash
docker run -p 80:8080 -p 443:8443 bunkerity/bunkerweb:1.6.0-beta
```{{exec}}

Or, to run it in the background:

```bash
docker run -d -p 80:8080 -p 443:8443 bunkerity/bunkerweb:1.6.0-beta
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
