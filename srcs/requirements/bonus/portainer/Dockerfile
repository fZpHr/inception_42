# Dockerfile
FROM debian:bullseye

# Install dependencies
RUN apt-get update && apt-get install -y && rm -rf /var/lib/apt/lists/*

COPY /conf/portainer-2.19.5-linux-amd64.tar.gz /tmp/
# Extract Portainer
RUN tar -xvf /tmp/portainer-2.19.5-linux-amd64.tar.gz -C /usr/local/bin/ && chmod +x /usr/local/bin/portainer/portainer

# Start Portainer
CMD ["/usr/local/bin/portainer/portainer"]