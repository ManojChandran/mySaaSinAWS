#----mySubnet/main.tf----

# get availability zone from specified AWS region
data "aws_availability_zones" "available" {}

# creating private subnet
resource "aws_subnet" "tf_private_subnet" {
  count                   = 2
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.vpc_private_cidrs[count.index]}"
  map_private_ip_on_launch = false
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"

  tags {
    Name = "tf_private_${count.index + 1}"
  }
}
