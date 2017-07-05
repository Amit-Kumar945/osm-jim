#!/bin/bash
server_ip=`terraform output server_ip`
ssh -t -o StrictHostKeyChecking=no centos@${server_ip} "sudo cp ~/.ssh/authorized_keys /root/.ssh/authorized_keys"
