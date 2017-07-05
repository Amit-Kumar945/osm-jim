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

  echo "aws_region = \"${aws_region}\"" > data.tfvars
  echo "vpc_cidr = \"${vpc_cidr}\"" >> data.tfvars
  echo "vpc_name = \"${vpc_name}\"" >> data.tfvars
  echo "route53_zone_name = \"${zone_name}\"" >> data.tfvars
  echo "public_subnet_aza_cidr = \"${public_subnet_aza_cidr}\"" >> data.tfvars
  echo "public_subnet_azb_cidr = \"${public_subnet_azb_cidr}\"" >> data.tfvars
  echo "private_subnet_aza_cidr = \"${private_subnet_aza_cidr}\"" >> data.tfvars
  echo "private_subnet_azb_cidr = \"${private_subnet_azb_cidr}\"" >> data.tfvars

  pushd ..
  make setup-HAStandardVPC AWS_ACCESS_KEY_ID=$1 AWS_SECRET_ACCESS_KEY=$2
  popd
}

function destroySetup() {
  logStatement "Destroying Setup"

  echo "aws_region = \"${aws_region}\"" > data.tfvars
  echo "vpc_cidr = \"${vpc_cidr}\"" >> data.tfvars
  echo "vpc_name = \"${vpc_name}\"" >> data.tfvars
  echo "route53_zone_name = \"${zone_name}\"" >> data.tfvars
  echo "public_subnet_aza_cidr = \"${public_subnet_aza_cidr}\"" >> data.tfvars
  echo "public_subnet_azb_cidr = \"${public_subnet_azb_cidr}\"" >> data.tfvars
  echo "private_subnet_aza_cidr = \"${private_subnet_aza_cidr}\"" >> data.tfvars
  echo "private_subnet_azb_cidr = \"${private_subnet_azb_cidr}\"" >> data.tfvars

  pushd ..
  make destroy-HAStandardVPC AWS_ACCESS_KEY_ID=$1 AWS_SECRET_ACCESS_KEY=$2
  popd
}
