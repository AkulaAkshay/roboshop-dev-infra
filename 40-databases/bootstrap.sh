#!/bin/bash

component=$1
dnf install ansible -y
# ansible-pull is not giving respect to inventory.ini, even though by default it is connecting lo localhost, we are getting warning sign . so, lets use another approach
#ansible-pull -U https://github.com/AkulaAkshay/ansible-roboshop-roles-tf.git -e component=$component main.yaml

REPO_URL=https://github.com/AkulaAkshay/ansible-roboshop-roles-tf.git
REPO_DIR=opt/roboshop/ansible
ANSIBLE_DIR=ansible-roboshop-roles-tf


mkdir -p $REPO_DIR
mkdir -p /var/log/roboshop
touch ansible.log

cd $REPO_DIR

#check if ansible repo is already cloned or not
if [ -d $REPO_URL ]; then

    cd $REPO_DIR
    git pull
else
    
    git clone $REPO_URL
    cd $ANSIBLE_DIR
fi

ansile playbook -e component=$component main.yaml
