provider "aws" {
  region = "${var.aws_region}"
}

module "vpc" {
  source            = "github.com/opstree-terraform/vpc"
  cidr              = "${var.vpc_cidr}"
  name              = "${var.vpc_name}"
  route53_zone_name = "${var.route53_zone_name}"
}
