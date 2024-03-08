terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "ap-south-1"
}

resource "aws_instance" "ubuntu" {
  ami           = "ami-0ba259e664698cbfc"
  instance_type = "t2.micro"
  key_name      = "harshkey"
  vpc_security_group_ids  = [aws_security_group.ubuntu.id]
  user_data     = file("apache.sh")

  tags = {
    Name = "Ubuntu"
  }
}





resource "aws_security_group" "ubuntu" {
  name        = "allow-all-traffic"
  description = "Security group allowing all traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

