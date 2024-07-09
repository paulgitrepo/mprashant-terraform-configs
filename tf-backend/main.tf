terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
  backend "s3" {
    bucket = "demo-bucket-9419a72476f569ef"
    key    = "backend.tfstate"
    region = "eu-north-1"
  }
}

provider "aws" {
  region = "eu-north-1"
}


resource "aws_instance" "myserver" {
  ami           = "ami-0c0e147c706360bd7"
  instance_type = "t3.nano"

  tags = {
    Name = "SampleServer"
  }
}


