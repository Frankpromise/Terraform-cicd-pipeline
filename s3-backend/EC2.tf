resource "aws_key_pair" "prom-auth" {
  key_name   = "mtckey"
  public_key = file("~/.ssh/mtckey.pub")
}


data "aws_ami" "server_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.server_ami.id
  instance_type = var.instance_type

  root_block_device {
    volume_size = var.volume_size
  }


  vpc_security_group_ids = [
    module.ec2_sg.security_group_id,
    module.dev_ssh_sg.security_group_id
  ]
 iam_instance_profile = aws_iam_role.ec2_dynamodb_s3_role.arn

  tags = {
    project = "hello-world"
  }

  key_name                = aws_key_pair.prom-auth.id
  monitoring              = true
  disable_api_termination = false
  ebs_optimized           = true

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/mtckey")
    host        = self.public_ip
  }


  provisioner "file" {
    source      = "install.sh"
    destination = "/tmp/install.sh"

  }


}
