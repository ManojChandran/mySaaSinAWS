#----root/main.tf-----
provider "aws" {
  region = "${var.aws_region}"
}

# Deploy VPC Resource
module "vpc_igw" {
  source       = "./modules/VPC_IGW"
  vpc_cidr     = "${var.vpc_cidr}"
}

# Deploy Public Subnet and Route tables
module "myPublicSubnet" {
  source       = "./modules/myPublicSubnet"
  vpc_id       = "${module.vpc_igw.vpc_id}"
  vpc_igw_id   = "${module.vpc_igw.igw_id}"
  vpc_route_table_id   = "${module.vpc_igw.route_table_id}"
  vpc_public_cidrs     = "${var.vpc_public_cidrs}"
#  vpc_private_cidrs    = "${var.vpc_private_cidrs}"
}

# Deploy Private Subnet and Route tables
module "myPrivateSubnet" {
  source       = "./modules/myPrivateSubnet"
  vpc_id       = "${module.vpc_igw.vpc_id}"
#  vpc_igw_id   = "${module.vpc_igw.igw_id}"
  vpc_route_table_id   = "${module.vpc_igw.route_table_id}"
  vpc_private_cidrs    = "${var.vpc_private_cidrs}"
}

# Deploy Private Subnet and Route tables
module "myRDSSubnet" {
  source       = "./modules/myRDSSubnet"
  vpc_id       = "${module.vpc_igw.vpc_id}"
#  vpc_igw_id   = "${module.vpc_igw.igw_id}"
#  vpc_route_table_id   = "${module.vpc_igw.route_table_id}"
  vpc_rds_cidrs        = "${var.vpc_rds_cidrs}"
}
