#----root/main.tf-----
provider "aws" {
  region = "${var.aws_region}"
}

# Deploy s3 hosting bucket
module "mys3hosting" {
  source       = "./modules/mys3hosting"
  website_bucket_name  = "${var.website_bucket_name}"
}

## Deploy cloudformation distribution
module "mycldfrntdistro" {
  source       = "./modules/mycldfrntdistro"
  domain_name  = "${var.domain_name}"
  hosted_website_bucket_name  = "${module.mys3hosting.tf_s3_hosted_bucket}"
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
  vpc_public_subnet_count = "${var.vpc_public_subnet_count}"
  vpc_route_table_id   = "${module.vpc_igw.route_table_id}"
  vpc_public_cidrs     = "${var.vpc_public_cidrs}"
#  vpc_private_cidrs    = "${var.vpc_private_cidrs}"
}

# Deploy Private Subnet and Route tables
module "myPrivateSubnet" {
  source       = "./modules/myPrivateSubnet"
  vpc_id       = "${module.vpc_igw.vpc_id}"
#  vpc_igw_id   = "${module.vpc_igw.igw_id}"
  vpc_private_subnet_count = "${var.vpc_private_subnet_count}"
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

# Deploy an RDS Instance
# module "myRDSInstance" {
#   source       = "./modules/myRDSInstance"
#   vpc_id       = "${module.vpc_igw.vpc_id}"
#   dbname       = "${var.dbname}"
#   dbuser       = "${var.dbuser}"
#   db_password  = "${var.db_password}"
#   db_instance_class = "${var.db_instance_class}""
#   vpc_RDS_subnetsgroup  = "${module.myRDSSubnet.vpc_RDS_subnetsgroup}"
# }
