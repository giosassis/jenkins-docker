provider "aws" {
  version = "~> 3.0"
  region  = "us-east-1"
}

resource "aws_instance" "dev" {
  count         = 3
  ami           = "ami-0b0af3577fe5e3532"
  instance_type = "t2.micro"
  key_name      = "terraform-aws"
  tags = {
    Name = "dev${count.index}"
  }

  vpc_security_group_ids = ["sg-06a9b9c6272f25bff"]
}

resource "aws_security_group" "allow_tls_ssh" {
  name        = "allow_tls_ssh"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["201.50.93.17/32"]
  }

  tags = {
    Name = "allow_tls"
  }
}
