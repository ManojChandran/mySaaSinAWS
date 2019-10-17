#----root/variables.tf-----
variable "aws_region" {}

#-------VPC variables
variable "vpc_cidr" {}

#-------VPC initial values set
variable "vpc_id" {
  default = ""
}
variable "vpc_igw_id" {
  default = ""
}
