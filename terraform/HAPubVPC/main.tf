provider "aws" {
  region = "${var.aws_region}"
}

module "key_pair" {
  source          = "github.com/opstree-terraform/key_pair"
  public_key_path = "${var.pub_key_path}"
  name            = "${var.vpc_name}-key"
}

module "vpc" {
  source            = "github.com/opstree-terraform/vpc"
  cidr              = "${var.vpc_cidr}"
  name              = "${var.vpc_name}"
  route53_zone_name = "${var.route53_zone_name}"
}

module "public_subnet_aza" {
  source                  = "github.com/opstree-terraform/subnet"
  vpc_id                  = "${module.vpc.id}"
  cidr                    = "${var.public_subnet_aza_cidr}"
  az                      = "${var.aws_region}a"
  map_public_ip_on_launch = "true"
  name                    = "${var.vpc_name}-public_subnet_aza"
}

module "public_subnet_azb" {
  source                  = "github.com/opstree-terraform/subnet"
  vpc_id                  = "${module.vpc.id}"
  cidr                    = "${var.public_subnet_azb_cidr}"
  az                      = "${var.aws_region}b"
  map_public_ip_on_launch = "true"
  name                    = "${var.vpc_name}-public_subnet_azb"
}
