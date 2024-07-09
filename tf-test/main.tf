terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_security_group" "main" {
  name = "my-sg"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"
}

resource "aws_instance" "myserver" {
  ami           = "ami-07c8c1b18ca66bb07"
  instance_type = "t3.micro"
  #vpc_security_group_ids = [aws_security_group.main.id]
  subnet_id                   = aws_subnet.private.id
  associate_public_ip_address = false
  depends_on                  = [aws_security_group.main]

  lifecycle {
    #create_before_destroy = true
    #prevent_destroy = true
    #replace_triggered_by = [aws_security_group.main, aws_security_group.main.ingress]

    precondition {
      condition     = aws_security_group.main.id != ""
      error_message = "Security Group ID must not be blank"
    }

    postcondition {
      condition     = self.public_ip != ""
      error_message = "Public IP is not present."
    }
  }
}
