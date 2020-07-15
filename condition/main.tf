#AWS details
provider "aws" {
  region = "ap-south-1"
}

variable "enable" {
  description = "enable or disable user creation"
}


#Create single user
resource "aws_iam_user" "example" {
  name = "adam"
  count = var.enable
}

