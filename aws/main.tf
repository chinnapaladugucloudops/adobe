provider "aws" {
  region = "ap-south-1"
}

# Create S3 bucket
resource "aws_s3_bucket" "example" {
  # NOTE: S3 bucket names must be unique across _all_ AWS accounts
  bucket = "wezva-adam-demo-s3"
}

