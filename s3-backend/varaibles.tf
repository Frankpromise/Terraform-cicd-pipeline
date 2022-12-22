variable "aws_region" {
  description = "Aws region to create instance"
  default = "us-west-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "security_group" {
  description = "Name of security group"
  default = "myjenkins"
}

variable "tag_name" {
  description = "tag name for my ec2 instance"
  default = "my-ec2-instance"
}

variable "versioning" {
  type = bool
  description = "a state of versioning"
  default = false
}

variable "bucket_prefix" {
  description = "creates a unique bucket name beginning with specified prefix"
  default = "my-s3-bucket"
}


variable "acl" {
  default = "private"
}