#!/bin/bash
set -e

echo 'HISTTIMEFORMAT="%d/%m/%y %T "' >> /etc/environment

# installing packages in non interactive mode
export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get dist-upgrade -o Dpkg::Options::=--force-confold -yq

apt-get install -y \
        -o Dpkg::Options::=--force-confold \
        jq  \
        git \
        dnsmasq \
        unzip \
        gcc \
        ncdu \
        htop \
        iotop \
        ca-certificates \
        curl \
        gnupg \
        lsb-release \
        net-tools

# Adding repo for docker
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
apt-get install -y \
        -o Dpkg::Options::=--force-confold \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-buildx-plugin \
        docker-compose-plugin
