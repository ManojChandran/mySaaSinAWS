#----myRDSInstance/main.tf----

resource "aws_db_instance" "tf_db" {
  allocated_storage = 10
  engine = "mysql"
  engine_version = "5.6.27"
  name = "${var.dbname}"
  username = "${var.dbuser}"
  password = "${var.db_password}"
  db_subnet_group_name = {}
  vpc_security_group_ids = []
  skip_final_snapshot = true
}
