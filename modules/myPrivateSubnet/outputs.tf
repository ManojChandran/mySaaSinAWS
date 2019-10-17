#----myPrivateSubnet/outputs.tf----

output "vpc_private_subnets" {
  value = "${aws_subnet.tf_private_subnet.*.id}"
}
