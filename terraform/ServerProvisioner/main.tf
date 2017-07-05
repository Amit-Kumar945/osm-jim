provider "aws" {
  region = "${var.aws_region}"
}

module "server" {
  source             = "github.com/opstree-terraform/ec2"
  subnet_id          = "${var.subnet_id}"
  name               = "${var.server_name}"
  key_pair_id        = "${var.key_name}"
  aws_region_os      = "${var.aws_region}-centos"
  aws_region         = "${var.aws_region}"
  security_group_ids = ["${module.vpc.default_sg_id}"]
  type               = "${var.instance_type}"
  zone_id            = "${module.vpc.zone_id}"
}
