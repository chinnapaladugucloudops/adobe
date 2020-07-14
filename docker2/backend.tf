terraform{
  backend "s3" {
     bucket = "wezva-adam-demo-s3"
	 key = "default/terraform.tfstate" # path & file which will hold the state #
	 region = "ap-south-1"
  }
}

