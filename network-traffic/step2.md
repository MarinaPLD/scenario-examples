
# Step 2: Access BunkerWeb User Interface

In this step, you will verify that BunkerWeb is running and accessible via HTTP and HTTPS.

## Verify Access to BunkerWeb

Once the BunkerWeb container is running, you can access its user interface:

### Access via HTTP (Port 80)

Click the link below to access BunkerWeb using HTTP:

[ACCESS BUNKERWEB HTTP]({{TRAFFIC_HOST1_80}})

### Access via HTTPS (Port 443)

Click the link below to access BunkerWeb using HTTPS:

[ACCESS BUNKERWEB HTTPS]({{TRAFFIC_HOST1_443}})

---

## Verify Network Connectivity

You can also test connectivity to the server directly from the terminal:

1. **Test HTTP Access**:
   ```bash
   curl http://{{TRAFFIC_HOST1_80}}
   ```{{exec}}

2. **Test HTTPS Access**:
   ```bash
   curl -k https://{{TRAFFIC_HOST1_443}}
   ```{{exec}}

These commands will display the response headers or content served by BunkerWeb.

---

## Troubleshooting

If you cannot access BunkerWeb:
1. Verify that the container is running:
   ```bash
   docker ps
   ```{{exec}}

2. Check the container logs for errors:
   ```bash
   docker logs $(docker ps -q --filter "ancestor=bunkerity/bunkerweb")
   ```{{exec}}

3. Ensure the ports (80 and 443) are properly mapped and not blocked.


