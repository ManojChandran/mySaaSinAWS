#----root/outputs.tf-----

#----Netweok outputs------
output "VPC ID" {
  value = "${module.vpc_igw.vpc_id}"
}
output "VPC IGW" {
  value = "${module.vpc_igw.igw_id}"
}

output "VPC Default Routetable" {
  value = "${module.vpc_igw.route_table_id}"
}

output "S3 bucket name" {
  value = "${module.mys3hosting.tf_s3_hosted_bucket}"
}
