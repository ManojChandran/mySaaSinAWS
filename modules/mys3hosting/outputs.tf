#----mys3hosting/outputs.tf----

output "tf_s3_hosted_bucket" {
  value = "${aws_subnet.tf_s3_host_bucket.bucket}"
}
