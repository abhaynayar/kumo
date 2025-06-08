provider "aws" {
  region = "ap-south-1"
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "ssh_access" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_ec2" {
  ami                         = "ami-02521d90e7410d9f0"  # Ubuntu 24.04 LTS
  instance_type               = "t2.micro"
  key_name                    = "ang-ap"

  vpc_security_group_ids      = [aws_security_group.web_access.id]
  associate_public_ip_address = true

  tags = {
    Name = "NodeAppServer"
  }
}

output "public_ip" {
  value = aws_instance.my_ec2.public_ip
  description = "Public IP of the EC2 instance"
}

