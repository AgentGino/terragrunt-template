resource "aws_s3_bucket" "example" {
  bucket = "${var.bucket_name}-${random_string.random.result}"
}

resource "random_string" "random" {
  length  = 6
  special = false
  upper   = false
}

