# Configuration Management Automation with Ansible

This repository contains the starter code intended for the coursework in ACS730
Cloud Automation & Control Systems course at Seneca College.

In the DevOps and SRE field, you will be asked to deploy, configure and manage
software unfamiliar to you. In this assignment, you will automate the
deployment of a Kubernetes cluster running on AWS using Ansible.

## Objective

Your goal is to deploy a Kubernetes cluster on AWS using Ansible. Given the
installation scripts, you will migrate the installation procedure to Ansible.

## Requirements

The final state of the automation should allow the following:

- Deploy a Kubernetes cluster onto the provided infrastructure by running a single Ansible playbook.
- Discover nodes in the cluster using dynamic inventory.
- Proxy SSH connections to the cluster nodes using the bastion host without code changes.
- Run a simple static web service on the cluster nodes.

## Getting Started

Infrastructure for the Kubernetes cluster is provided in the `terraform`
directory. See the README.md file in that directory for instructions on how to
deploy the infrastructure.

Scripts to install Kubernetes is provided in the `scripts` directory. See the
README.md file in that directory for instructions on how to configure
Kubernetes.
