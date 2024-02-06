provider "aws" {
   region = "ap-south-1"
}

terraform {
backend "s3" {
        bucket = "s3-backend-terraform-new-bucket"
        key    = "atlantis/terraform.tfstate"
        region = "ap-south-1"
        profile = "default"
        }
}
        
resource "aws_instance" "ec2_mumbai" {
  ami           = "ami-0d63de463e6604d0a"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-atlantis"
  }
}
