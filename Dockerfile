FROM ubuntu:22.04

# Install dependencies
RUN apt-get update \
    && apt-get install -y \
        software-properties-common \
        curl \
        nano \
    && apt-add-repository -y ppa:ansible/ansible \
    && apt-get update \
    && apt-get install -y ansible  \
    && apt-get update \
    && apt-get install -y ansible openssh-client \
    && rm -rf /var/lib/apt/lists/*
