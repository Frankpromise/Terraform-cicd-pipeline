terraform {
  backend "s3" {
    bucket = "tf-state-bucket-10"
    key = "main"
    region = "us-west-1"
    dynamodb_table = "my-dynamodb-table"
  }
}

