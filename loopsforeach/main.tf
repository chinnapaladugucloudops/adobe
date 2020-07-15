provider "aws" {
  region = "ap-south-1"
}

#Create multiple users
variable "user_names" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = ["aditi", "abhaas", "hari"]
}

resource "aws_iam_user" "example" {
  for_each = toset(var.user_names) 
  name     = each.value
}

output "all_users" {
  value = aws_iam_user.example
}
output "all_arns" {
  value = values(aws_iam_user.example)[*].arn
}

