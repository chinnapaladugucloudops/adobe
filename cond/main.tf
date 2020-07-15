provider "aws" {
  region = "ap-south-1"
}

data "aws_iam_policy_document" "cloudwatch_full_access" {
  statement {
    effect    = "Allow"
    actions   = ["cloudwatch:*"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "cloudwatch_read_only" {
  statement {
    effect    = "Allow"
    actions   = [
      "cloudwatch:Describe*",
      "cloudwatch:Get*",
      "cloudwatch:List*"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "cloudwatch_read_only" {
  name   = "cloudwatch-read-only"
  policy = data.aws_iam_policy_document.cloudwatch_read_only.json
}

resource "aws_iam_policy" "cloudwatch_full_access" {
  name   = "cloudwatch-full-access"
  policy = data.aws_iam_policy_document.cloudwatch_full_access.json
}

resource "aws_iam_user_policy_attachment" "adam_cloudwatch_full" {
  count         = var.give_adam_cloudwatch_full_access ? 1 : 0  
  user            = "adam"  
  policy_arn = aws_iam_policy.cloudwatch_full_access.arn
}

resource "aws_iam_user_policy_attachment" "adam_cloudwatch_read" {
  count         = var.give_adam_cloudwatch_full_access ? 0 : 1 
  user            = "adam"
  policy_arn = aws_iam_policy.cloudwatch_read_only.arn
}

variable "give_adam_cloudwatch_full_access" {
  description = "If true, adam gets full access to CloudWatch"
}

