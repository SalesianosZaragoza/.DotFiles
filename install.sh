#!/usr/bin/env bash
sudo apt update
sudo apt install curl
curl https://bootstrap.pypa.io/get-pip.py -o $HOME/get-pip.py  
sudo python3 $HOME/get-pip.py 
pip3 install ansible
pip3 install ansible-base
ansible-playbook ./Student/localhost-deploy.yml --ask-become-pass
