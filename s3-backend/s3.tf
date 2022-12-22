resource "aws_s3_bucket" "tf-state-bucket-10" {
  bucket_prefix = var.bucket_prefix
  acl = var.acl

  versioning {
    enabled = var.versioning
  }

  tags = {
    Name = "bucket"
  }
}