#!/bin/bash

VPC_NAME=$1
AWS_REGION=$2
ROUTE_53_ZONE_NAME=$3
VPC_IP_COUNT=$4
SUBNET_IP_COUNT=$5

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
  echo "aws_region = \"${aws_region}\"" > data.tfvars
  echo "vpc_cidr = \"${vpc_cidr}\"" >> data.tfvars
  echo "vpc_name = \"${vpc_name}\"" >> data.tfvars
  echo "route53_zone_name = \"${zone_name}\"" >> data.tfvars
  echo "public_subnet_aza_cidr = \"${subnet_a_cidr}\"" >> data.tfvars
  echo "public_subnet_azb_cidr = \"${subnet_b_cidr}\"" >> data.tfvars

  pushd ..
  make setup-HAPubVPC AWS_ACCESS_KEY_ID=$1 AWS_SECRET_ACCESS_KEY=$2

  popd
}

function destroySetup() {
  logStatement "Destroying Setup"
  pushd ..
  make destroy-HAPubVPC AWS_ACCESS_KEY_ID=$1 AWS_SECRET_ACCESS_KEY=$2
  popd
}

function provisionInfraViaTerraform() {
  terraform get
  terraform plan -var-file="data.tfvars"
  terraform apply -var-file="data.tfvars"
}

function deProvisionInfraViaTerraform() {
  terraform destroy -force -var-file="data.tfvars"
}
