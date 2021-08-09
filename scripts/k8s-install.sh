#!/usr/bin/env bash
export APTARGS="-qq -o=Dpkg::Use-Pty=0"
export DEBIAN_FRONTEND=noninteractive
cp /vagrant/configs/daemon.json /etc/docker
sudo apt-get update ${APTARGS}
sudo apt-get install -y apt-transport-https ca-certificates curl ${APTARGS}

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"

sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update ${APTARGS}

sudo apt-get install -y docker-ce kubelet kubeadm kubectl ${APTARGS}
sudo apt-mark hold docker-ce kubelet kubeadm kubectl ${APTARGS}

echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf
modprobe br_netfilter
sysctl -p
