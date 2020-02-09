#!/bin/sh
curl -O https://bootstrap.pypa.io/get-pip.py
sudo apt-get install python3
python3 get-pip.py --user
pip3 --version
apt install awscli
pip3 install awscli --upgrade --user
aws --version
aws configure
curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version
curl -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.8/2019-08-14/bin/linux/amd64/kubectl
curl -o kubectl.sha256 https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.8/2019-08-14/bin/linux/amd64/kubectl.sha256
openssl sha1 -sha256 kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
kubectl version --short --client
eksctl create cluster \
--name CLUSTERNAME \
--version 1.13 \
--region REGIONHERE \
--nodegroup-name NODEGROUPNAME \
--node-type MACHINETYPE \
--nodes 2 \
--nodes-min 0 \
--nodes-max 4 \
--ssh-access \
--ssh-public-key /home/ubuntu/.ssh/id_rsa.pub
