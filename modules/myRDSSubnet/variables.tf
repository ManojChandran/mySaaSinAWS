#----myRDSSubnet/variables.tf----

variable "vpc_id" {}
#variable "vpc_igw_id" {}
#variable "vpc_route_table_id" {}
variable "vpc_rds_cidrs" {
  type = "list"
}
