#----root/outputs.tf-----

#----Netweok outputs------
output "VPC ID" {
  value = "${module.vpc_igw.vpc_out.id}"
}
