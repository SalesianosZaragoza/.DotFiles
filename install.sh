#!/usr/bin/env bash
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py  
sudo python3 get-pip.py 
sudo pip3 install ansible 
ansible-playbook -f ./Student/localhost-deploy.yml --ask-become-pass
