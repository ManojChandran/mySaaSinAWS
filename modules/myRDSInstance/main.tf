#----myRDSInstance/main.tf----

# creating RDS instance
resource "aws_db_instance" "tf_db" {
  allocated_storage = 10
  engine = "mysql"
  engine_version = "5.6.27"
  instance_class = "${var.db_instance_class}"
  name = "${var.dbname}"
  username = "${var.dbuser}"
  password = "${var.db_password}"
  db_subnet_group_name = "${var.vpc_RDS_subnetsgroup}"
#  vpc_security_group_ids = []
  skip_final_snapshot = true
}
