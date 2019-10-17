#----mySubnet/main.tf----

# get availability zone from specified AWS region
data "aws_availability_zones" "available" {}

# Public Route table
resource "aws_route_table" "tf_public_rt" {
  vpc_id = "${var.vpc_out.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.tf_internet_gateway.id}"
  }

  tags {
    Name = "tf_public"
  }
}

# Private Route table
resource "aws_default_route_table" "tf_private_rt" {
  default_route_table_id  = "${vpc_out.default_route_table_id}"

  tags {
    Name = "tf_private"
  }
}
