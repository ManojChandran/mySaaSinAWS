#----root/variables.tf-----
#  We assume current tenant fall in three categories as mentioned below.
#
#  -Tenant1 - Open Source (Single Region, Multi AZ, No data isolation)
#  -Tenant2 - Standrad Tier (Single region, Single AZ, Isolated database )
#  -Tenant3 - Professional Tier (Single region, Multi AZ, Isolated Multi AZ database)
#  -Tenant4 - Premium Tier (Multi region)
variable "tenantTier" {
  description = "tenantTier: Tenant1 or Tenant2 or Tenant3 or Tenant4"
}

variable "aws_region" {}

#-------VPC variables
variable "vpc_cidr" {}
variable "vpc_public_subnet_count" {
  type = "map"
  description = "count for subnets in availability zone"
  default = { # please provide corresponding subnet cidr's matching to count
    Tenant1 = 1
    Tenant2 = 2
    Tenant3 = 3
    Tenant4 = 3
  }
}
variable "vpc_private_subnet_count" {
  type = "map"
  description = "count for subnets in availability zone"
  default = { # please provide corresponding subnet cidr's matching to count
    Tenant1 = 1
    Tenant2 = 2
    Tenant3 = 3
    Tenant4 = 3
  }
}

variable "vpc_public_cidrs" {
  type = "list"
}
variable "vpc_private_cidrs" {
  type = "list"
}
variable "vpc_rds_cidrs" {
  type = "list"
}
variable "db_instance_class" {}
variable "dbname" {}
variable "dbuser" {}
variable "db_password" {}

#-------VPC initial values set
variable "vpc_id" {
  default = ""
}
variable "vpc_igw_id" {
  default = ""
}
variable "vpc_route_table_id" {
  default = ""
}
