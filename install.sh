#!/usr/bin/env bash
sudo apt update
# esto seguro que funciona
sudo apt install curl
curl https://bootstrap.pypa.io/get-pip.py -o $HOME/get-pip.py  
sudo python3 $HOME/get-pip.py 
pip3 install ansible
pip3 install ansible-base
sudo apt install ansible
if [ -z "${CODESPACE_NAME}" ] then 
  ansible-playbook ./Vagrant/localhost-deploy.yml --ask-become-pass
else
  ansible-playbook ./Vagrant/minimal-deploy.yml --ask-become-pass
fi
