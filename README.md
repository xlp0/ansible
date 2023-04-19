# Ansible Project for installing PKC

## Build the Ansible image
docker buildx build --platform linux/amd64,linux/arm/v7,linux/arm64 -t ansible:latest . --push


# Save the image to a local file
docker save ansible:latest | gzip > dockerizedansible.tar.gz

# Load the ansible image to docker registry
gzip -dc dockerizedansible.tar.gz | docker load
