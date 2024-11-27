# Step 6: Prevent Upgrading NGINX and BunkerWeb

To prevent upgrading the NGINX and/or BunkerWeb packages when executing `apt upgrade`, use the following command:

```bash
sudo apt-mark hold nginx bunkerweb
