provider "aws" {
  region = "ap-south-1"
}

# Specify the EC2 details
resource "aws_instance" "example" {
  ami           = "ami-02d55cb47e83a99a0"
  instance_type = "t2.micro"
  count = 3
}
