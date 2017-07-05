#!/bin/bash
rm -rf .terraform
rm -f terraform.tfstate*
terraform get
terraform plan -var-file="data.tfvars"
terraform apply -var-file="data.tfvars"
server_ip=`terraform output server_ip`
#server_ip=34.205.45.215
ssh -t -o StrictHostKeyChecking=no centos@${server_ip} "sudo cp ~/.ssh/authorized_keys /root/.ssh/authorized_keys"
