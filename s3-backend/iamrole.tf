# Create the IAM role
resource "aws_iam_role" "ec2_dynamodb_s3_role" {
  name = "ec2_dynamodb_s3_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# Attach the AmazonS3FullAccess and AmazonDynamoDBFullAccess policies to the role
resource "aws_iam_policy_attachment" "s3_access" {
  name       = "s3_access"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  roles      = [aws_iam_role.ec2_dynamodb_s3_role.name]
}

resource "aws_iam_policy_attachment" "dynamodb_access" {
  name       = "dynamodb_access"
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  roles      = [aws_iam_role.ec2_dynamodb_s3_role.name]
}
