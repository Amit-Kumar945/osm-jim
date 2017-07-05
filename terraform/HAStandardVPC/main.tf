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

module "pub_subnet_aza" {
  source            = "github.com/opstree-terraform/subnet"
  vpc_id            = "${module.vpc.id}"
  cidr              = "${var.pub_subnet_aza_cidr}"
  az 		            = "${var.aws_region}a"
  name		          = "${var.vpc_name}-public_subnet_aza"
  map_public_ip_on_launch = "true"
}

module "pvt_route_table_aza" {
  source    = "github.com/opstree-terraform/pvt_route_table"
  pub_sn_id = "${module.pub_subnet_aza.id}"
  vpc_name  = "${var.vpc_name}"
  vpc_id    = "${module.vpc.id}"
}

module "pub_subnet_azb" {
  source            = "github.com/opstree-terraform/subnet"
  vpc_id            = "${module.vpc.id}"
  cidr              = "${var.pub_subnet_azb_cidr}"
  az 		            = "${var.aws_region}b"
  name		          = "${var.vpc_name}-public_subnet_azb"
  map_public_ip_on_launch = "true"
}

module "pvt_route_table_azb" {
  source    = "github.com/opstree-terraform/pvt_route_table"
  pub_sn_id = "${module.pub_subnet_azb.id}"
  vpc_name  = "${var.vpc_name}"
  vpc_id    = "${module.vpc.id}"
}

module "pvt_subnet_aza" {
  source             = "github.com/opstree-terraform/private_subnet"
  vpc_id             = "${module.vpc.id}"
  cidr               = "${var.pvt_subnet_aza_cidr}"
  az                 = "${var.aws_region}a"
  name               = "${var.vpc_name}-pvt_subnet_aza"
  pvt_route_table_id = "${module.pvt_route_table_aza.route_table_id}"
}

module "pvt_subnet_azb" {
  source             = "github.com/opstree-terraform/private_subnet"
  vpc_id             = "${module.vpc.id}"
  cidr               = "${var.pvt_subnet_azb_cidr}"
  az                 = "${var.aws_region}b"
  name               = "${var.vpc_name}-pvt_subnet_azb"
  pvt_route_table_id = "${module.pvt_route_table_azb.route_table_id}"
}

