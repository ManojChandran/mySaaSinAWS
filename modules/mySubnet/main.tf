#----mySubnet/main.tf----

# get availability zone from specified AWS region
data "aws_availability_zones" "available" {}

# Public Route table
resource "aws_route_table" "tf_public_rt" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${var.vpc_igw_id}"
  }

  tags {
    Name = "tf_public"
  }
}

# Private Route table
#resource "aws_default_route_table" "tf_private_rt" {
#  default_route_table_id  = "${var.vpc_route_table_id}"
#
#  tags {
#    Name = "tf_private"
#  }
#}

# creating public subnet
resource "aws_subnet" "tf_public_subnet" {
  count                   = 2
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.vpc_public_cidrs[count.index]}"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"

  tags {
    Name = "tf_public_${count.index + 1}"
  }
}

# Associating public subnet route table
resource "aws_route_table_association" "tf_public_assoc" {
  count          = "${aws_subnet.tf_public_subnet.count}"
  subnet_id      = "${aws_subnet.tf_public_subnet.*.id[count.index]}"
  route_table_id = "${aws_route_table.tf_public_rt.id}"
}

# Private Route table
resource "aws_route_table" "tf_private_rt" {
  vpc_id = "${var.vpc_id}"

  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = "${var.vpc_igw_id}"
  }

  tags {
    Name = "tf_private"
  }
}

# creating private subnet
resource "aws_subnet" "tf_private_subnet" {
  count                   = 2
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.vpc_private_cidrs[count.index]}"
#  map_private_ip_on_launch = true
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"

  tags {
    Name = "tf_private_${count.index + 1}"
  }
}

# Associating public subnet route table
resource "aws_route_table_association" "tf_private_assoc" {
  count          = "${aws_subnet.tf_private_subnet.count}"
  subnet_id      = "${aws_subnet.tf_private_subnet.*.id[count.index]}"
  route_table_id = "${aws_route_table.tf_private_rt.id}"
}
