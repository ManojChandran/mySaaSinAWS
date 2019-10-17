#----root/variables.tf-----
variable "aws_region" {}

#-------VPC variables
variable "vpc_cidr" {}
variable "vpc_public_cidrs" {
  type = "list"
}

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
