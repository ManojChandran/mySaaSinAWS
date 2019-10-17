#----root/outputs.tf-----

#----Netweok outputs------
output "VPC ID" {
  value = "${module.vpc_igw.vpc_id}"
}
output "VPC IGW" {
  value = "${module.vpc_igw.igw_id}"
}
