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
  make setup-PubVPC REGION=$1 ROUTE_53_ZONE_NAME=$2 VPC_CIDR=$3 VPC_NAME=$4 AWS_ACCESS_KEY_ID=$5 AWS_SECRET_ACCESS_KEY=$6 
  popd
}

function destroySetup() {
  logStatement "Destroying Setup"
  pushd ..
  make destroy-simplePubVPC REGION=$1 ROUTE_53_ZONE_NAME=$2 VPC_CIDR=$3 VPC_NAME=$4
  popd
}
