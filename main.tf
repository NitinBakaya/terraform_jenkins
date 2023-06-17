#.terraform.tfstate.lock.hcl will be created only when we use apply
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "my_instance" {
  ami = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"
  tags = {
    Name = "MyServer"
  }   
}
output "public_ip" {
  value = aws_instance.my_instance.public_ip
}
