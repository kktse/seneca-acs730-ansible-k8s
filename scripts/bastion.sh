#!/bin/bash

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

# Install required packages
sudo yum -y install kubectl --disableexcludes=kubernetes

# Copy the kubeconfig file
mkdir -p ~/.kube
scp -i ~/.ssh/k8s_key ec2-user@$CONTROL_PLANE_IP:/etc/kubernetes/admin.conf ~/.kube/config

# Copy the join command to local file
scp -i ~/.ssh/k8s_key ec2-user@$CONTROL_PLANE_IP:~/join-command.sh ~/.kube/join-command.sh

# Copy the join command to the worker
scp -i ~/.ssh/k8s_key ~/.kube/join-command.sh ec2-user@$WORKER_IP:~/join-command.sh