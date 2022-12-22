resource "aws_dynamodb_table" "my-dynamodb-table" {
  name           = "my-dynamodb-table"
  hash_key       = "LOCKID"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "LOCKID"
    type = "S"
  }

  tags = {
    Name = "Example Table"
  }
}
