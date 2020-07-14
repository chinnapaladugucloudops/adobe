#AWS details
provider "aws" {
  region = "ap-south-1"
}

#Create single user
resource "aws_iam_user" "example" {
  name = "adam.${count.index}"
  count = 3
}

