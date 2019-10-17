#----VPC_IGW/outputs.tf----


output "vpc_id" {
  value = "${aws_vpc.tf_vpc.id}"
}

output "igw_id" {
  value = "${aws_internet_gateway.tf_internet_gateway.id}"
}
