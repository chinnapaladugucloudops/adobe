#AWS details
provider "aws" {
  region = "ap-south-1"
}

#Create multiple users
variable "user_names" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = ["aditi", "abhaas", "hari", "adam"]
}

resource "aws_iam_user" "example" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}

output "adam_uniqueid" {
  value       = aws_iam_user.example[0].unique_id
  description = "The unique_id for user aditi"
}

