# Step 2: Install Necessary Dependencies

To ensure all dependencies are installed, use the following commands:

```bash
sudo apt install -y curl gnupg2 ca-certificates lsb-release ubuntu-keyring && \
curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
| sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null && \
echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" \
| sudo tee /etc/apt/sources.list.d/nginx.list
