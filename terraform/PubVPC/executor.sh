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
  pushd ..
  make setup-simplePubVPC REGION=ap-south-1 ROUTE_53_ZONE_NAME=internal.sandy.com VPC_CIDR=10.0.0.0/16 VPC_NAME=sandy
  popd
}

function destroySetup() {
  logStatement "Destroying Setup"
  pushd ..
  make destroy-simplePubVPC REGION=ap-south-1 ROUTE_53_ZONE_NAME=internal.sandy.com VPC_CIDR=10.0.0.0/16 VPC_NAME=sandy
  popd
}

validateInputs
createSetup
#destroySetup
