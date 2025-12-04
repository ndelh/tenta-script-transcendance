#!/bin/bash
set -e
echo "must be runned with root activated, please reboot after"
echo "installing vim" > logs
usermod -aG sudo $@
apt upgrade
apt install vim
apt install tree
echo "removing eventual docker system" >> logs
apt remove $(dpkg --get-selections docker.io docker-compose docker-doc podman-docker containerd runc | cut -f1) 
# Add Docker's official GPG key:
apt install ca-certificates curl -y
install -m 0755 -d /etc/apt/keyrings -y >> instal_logs
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc  
chmod a+r /etc/apt/keyrings/docker.asc >> instal_logs

# Add the repository to Apt sources:
tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

apt update
echo "installing docker engine, version released the 28/11" >> logs
VERSION_STRING=5:29.1.1-1~debian.13~trixie
apt install docker-ce=$VERSION_STRING docker-ce-cli=$VERSION_STRING containerd.io docker-buildx-plugin -y 
DOCKER_COMPOSE_VERSION=2.40.3
curl -SL https://github.com/docker/compose/releases/download/v$DOCKER_COMPOSE_VERSION/docker-compose-linux-x86_64 -o /usr/local/bin/docker-composeusermod -aG docker $@
chmod +x /usr/local/bin/docker-compose
systemctl status docker
