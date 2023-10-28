#!/bin/bash

# Disable swap and zram
sudo swapoff -a
sudo zramctl --reset /dev/zram0

# Add kubernetes repository
if ! test -f /etc/yum.repos.d/kubernetes.repo ; then
    sudo sh -c 'cat > /etc/yum.repos.d/kubernetes.repo <<EOL
[kubernetes]
baseurl = https://pkgs.k8s.io/core:/stable:/v1.26/rpm/
exclude = kubelet kubeadm kubectl cri-tools kubernetes-cni
gpgkey = https://pkgs.k8s.io/core:/stable:/v1.26/rpm/repodata/repomd.xml.key
name = kubernetes yum repo
repo_gpgcheck = 1
EOL'
fi
#
# Install required packages
sudo yum -y install docker kubelet kubeadm kubectl --disableexcludes=kubernetes

# Enable and start services
sudo systemctl enable docker
sudo systemctl restart docker
sudo systemctl enable kubelet
sudo systemctl restart kubelet

# Join the cluster if not intialized
if ! test -f /etc/kubernetes/kubelet.conf ; then
    sudo sh ./join-command.sh
fi
