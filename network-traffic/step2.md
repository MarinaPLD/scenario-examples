# Step 2: Configure BunkerWeb

BunkerWeb uses a configuration file called `bunkerweb.yml` to define its behavior. In this scenario, a custom configuration file is already provided.

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
