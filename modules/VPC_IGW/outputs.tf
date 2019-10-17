#----VPC_IGW/outputs.tf----


output "vpc_out" {
  value = "${aws_vpc.tf_vpc}"
}

output "igw" {
  value = "${aws_internet_gateway.tf_internet_gateway.id}"
}
