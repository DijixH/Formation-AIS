#!/bin/sh
sudo apt-get -y update
sudo apt-get -y install epel-release
sudo apt-get -y install libvirt qemu-kvm virt-install virt-top libguestfs-tools bridge-utils
sudo apt-get -y install apt-transport-https ca-certificates curl
sudo apt-get install socat -y
sudo apt-get install -y conntrack
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker vagrant
systemctl start docker
sudo apt-get -y install wget
sudo wget https://github.com/kubernetes/minikube/releases/download/v1.25.1/minikube-linux-arm64
sudo chmod +x minikube-linux-arm64
sudo mv minikube-linux-arm64 /usr/bin/minikube
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
sudo echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables
sudo systemctl enable docker.service
echo "For this Stack, you will use $(ip -f inet addr show enp0s8 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p') IP Address"
echo "Connect through ssh on the VM and then run 'minikube start --driver=none' please don't run the command as root user or using any sudo command, use vagrant user"