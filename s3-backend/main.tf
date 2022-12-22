provider "aws" {
  region = var.aws_region
} 

# create security group with firewall rules
resource "aws_security_group" "test_sg" {
  name = var.security_group
  description = "Security group for EC2 instance"

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound for jenkins server
  egress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group
  }
}

# create an elastic ip address
resource "aws_eip" "my-eip" {
  vpc = true
  instance = aws_instance.myfirstInstance.id

  tags = {
    Name = "my_elastic_ip"
  }
}