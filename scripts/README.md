# Kubernetes installation scripts

These scripts install and configure the a simple Kubernetes cluster.

## Prerequisites

Follow the instructions in the Terraform project to provision the necessary
infrastructure.

The bastion host must have SSH connectivity to the control plane and worker
nodes. You will need to copy the k8s private key to the bastion host. From your
development machine, run the following command to copy the private key to the
bastion host:

```bash
export BASTION_IP="<Public IP address of the bastion host>"
scp -i ../terraform/bastion_host_key ../terraform/k8s_key ec2-user@$BASTION_IP:~/.ssh/k8s_key
```

## Instructions

From your development machine, copy all the files in this folder to the bastion host.

```bash
export BASTION_IP="<Public IP address of the bastion host>"
scp -i ../terraform/bastion_host_key -r "${PWD}" ec2-user@$BASTION_IP:~/scripts
```

SSH into the bastion host

```bash
export BASTION_IP="<Public IP address of the bastion host>"
ssh -i ../terraform/bastion_host_key ec2-user@$BASTION_IP
```

### Control plane

From the bastion host, run the following commands to copy the installation script to the control plane.

```bash
export CONTROL_PLANE_IP="<Private IP address of the control plane>"
scp -i ~/.ssh/k8s_key ~/scripts/controlplane.sh ec2-user@$CONTROL_PLANE_IP:~/controlplane.sh
```

From the bastion host, SSH into the control plane instance.

```bash
export CONTROL_PLANE_IP="<Private IP address of the control plane>"
ssh -i ~/.ssh/k8s_key ec2-user@$CONTROL_PLANE_IP
```

Run the installation script

```bash
sh controlplane.sh
```

Check that the installation is successful.

```bash
kubectl get nodes
```

Exit the control plane instance.

```bash
exit
```

### Bastion host

From the bastion host, run the installation script.

```bash
export CONTROL_PLANE_IP="<Private IP address of the control plane>"
export WORKER_IP="<Private IP address of the control plane>"
sh scripts/bastion.sh
```

Check that the installation is successful.

```bash
kubectl get nodes
```

### Worker

From the bastion host, copy the install script and join command script to the
worker node.

```bash
export WORKER_IP="<Private IP address of the control plane>"
scp -i ~/.ssh/k8s_key ~/.kube/join-command.sh ec2-user@$WORKER_IP:~/join-command.sh
scp -i ~/.ssh/k8s_key ~/scripts/worker.sh ec2-user@$WORKER_IP:~/worker.sh
```

SSH into the worker node.

```bash
ssh -i ~/.ssh/k8s_key ec2-user@$WORKER_IP
```

Run the installation script.

```bash
sh worker.sh
```

Exit the worker instance.

```bash
exit
```

## Verifying the installation

From the bastion host, run the following command to verify the installation.

```bash
$ kubectl get nodes
NAME                         STATUS   ROLES           AGE   VERSION
ip-10-0-10-36.ec2.internal   Ready    control-plane   26m   v1.26.10
ip-10-0-10-98.ec2.internal   Ready    <none>          55s   v1.26.10
```
