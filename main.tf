#----root/main.tf-----
provider "aws" {
  region = "${var.aws_region}"
}

# Deploy VPC Resource
module "vpc_igw" {
  source       = "./modules/VPC_IGW"
  vpc_cidr     = "${var.vpc_cidr}"
}

# Deploy Subnet and Route tables
module "mySubnet" {
  source       = "./modules/mySubnet"
  vpc_id     = "${var.vpc_igw.vpc_id}"
}
