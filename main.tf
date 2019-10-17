#----root/main.tf-----
provider "aws" {
  region = "${var.aws_region}"
}

# Deploy VPC Resource
module "networking" {
  source       = "./modules/VPC_IGW"
  vpc_cidr     = "${var.vpc_cidr}"
}
