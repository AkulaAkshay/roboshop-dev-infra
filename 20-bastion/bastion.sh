#!/bin/bash

# growing the /home volume for terraform purpose
growpart /dev/nvme0n1 4
lvextend -L +30G /dev/mapper/RootVG-homeVol
xfs_growfs /home
# command to check logs for the user data command (user data command logs) - cd /var/log ; less cloud-init-output.log

#installing teraform in bastion
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform

#configuring databases from bastion
cd /home/ec2-user
git clone https://github.com/AkulaAkshay/roboshop-dev-infra.git
chown ec2-user:ec2-user -R roboshop-dev-infra
cd /roboshop-dev-infra/40-databases
terraform init
terraform plan
terraform apply -auto-approve
