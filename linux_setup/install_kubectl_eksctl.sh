#!/bin/bash

#check aws version(must be v2.x.x)
aws --version

#kubectl
echo "Installing Kubectl"

#install
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.27.4/2023-08-16/bin/linux/amd64/kubectl
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.27.4/2023-08-16/bin/linux/amd64/kubectl.sha256
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH
echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
kubectl version --short --client

#eksctl
echo "Installing eksctl"

#install
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/bin
eksctl version

# command to create EKs cluster
# eksctl create cluster 
#     --name dev 
#     --region us-east-1 
#     --nodegroup-name standard-workers 
#     --node-type t3.medium 
#     --nodes 3 
#     --nodes-min 1 
#     --nodes-max 4 
#     --managed

# command to connect to EKS cluster
# aws eks update-kubeconfig --name dev --region us-east-1
