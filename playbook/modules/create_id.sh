#!/bin/bash

source .env

# Read the USERNAME environment variable
USERNAME=${USERNAME:-root}

# Generate an SSH key
ssh-keygen -b 2048 -t rsa -f ~/.ssh/mykey -q -N ""

# Copy the public key to the remote server
ssh-copy-id -i ~/.ssh/mykey.pub ${USERNAME}@host.docker.internal

# Connect to the remote server
ssh ${USERNAME}@host.docker.internal