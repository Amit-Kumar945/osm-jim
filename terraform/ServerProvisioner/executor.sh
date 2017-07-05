#!/bin/bash

function logStatement() {
  LOG_MESSAGE=$1
  echo $LOG_MESSAGE
  #echo $LOG_MESSAGE > /var/log/SimplePubVPCExecutor.log
}

function validateInputs() {
  logStatement "Validating Inputs"
}

function createSetup() {
  logStatement "Creating setup"

  echo "aws_region=${REGION}" > data.tfvars
  echo "subnet_id=${SUBNET_ID}" >> data.tfvars
  echo "server_name=${SERVER_NAME}" >> data.tfvars
  echo "key_name=${KEY_NAME}" >> data.tfvars
  echo "sg_id=${SG_ID}" >> data.tfvars
  echo "instance_type=${INSTANCE_TYPE}" >> data.tfvars
  echo "vpc_zone_id=${VPC_ZONE_ID}" >> data.tfvars

  pushd ..
  make create-server AWS_ACCESS_KEY_ID=$1 AWS_SECRET_ACCESS_KEY=$2
  popd
}
