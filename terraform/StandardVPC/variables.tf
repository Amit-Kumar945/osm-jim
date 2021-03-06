variable "aws_region" {}

variable "vpc_cidr" {}

variable "vpc_name" {}

variable "route53_zone_name" {}

variable "pub_subnet_cidr" {}

variable "pvt_subnet_cidr" {}

variable "pub_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

