# Install Docker
sudo dnf install docker -y

# Start and enable Docker
sudo systemctl enable --now docker

# Create Docker CLI plugin directory
sudo mkdir -p /usr/libexec/docker/cli-plugins

# Download Docker Compose
sudo curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 \
-o /usr/libexec/docker/cli-plugins/docker-compose

# Make executable
sudo chmod +x /usr/libexec/docker/cli-plugins/docker-compose

# Verify
docker compose version
