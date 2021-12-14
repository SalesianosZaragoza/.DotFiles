#!/usr/bin/env bash
curl https://bootstrap.pypa.io/get-pip.py -o $HOME/get-pip.py  
sudo python3 $HOME/get-pip.py 
pip3 install ansible
pip3 install ansible-base
ansible-playbook ./Student/localhost-deploy.yml --ask-become-pass
