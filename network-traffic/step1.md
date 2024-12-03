# Step 1: Run BunkerWeb on Docker

In this step, you will start the BunkerWeb container using Docker.

## Start BunkerWeb Container

Run the following command to pull and start the **BunkerWeb** container:

```bash
docker run -d \
  -p 8080:8080 \
  -p 8443:8443 \
  --name bunkerweb \
  -v $(pwd)/bunkerweb.yml:/etc/bunkerweb/bunkerweb.yml \
  bunkerity/bunkerweb:1.6.0-beta
```{{exec}}

### Explanation
- **`-d`**: Runs the container in the background.
- **`-p 8080:8080`**: Maps HTTP traffic from the host to the container.
- **`-p 8443:8443`**: Maps HTTPS traffic from the host to the container.
- **`--name bunkerweb`**: Assigns the name "bunkerweb" to the container.
- **`-v $(pwd)/bunkerweb.yml:/etc/bunkerweb/bunkerweb.yml`**: Mounts the custom configuration file.

### Verify the Container is Running

Check the status of the container:

```bash
docker ps
```{{exec}}

If the container is running, proceed to the next step.
