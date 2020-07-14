provider "aws" {
  region = "ap-south-1"
}

data "aws_instances" "test" {
  filter {
    name = "instance.group-id"
    values = ["sg-9e42dffc"]
  }
  filter {
    name = "instance-type"
    values = ["t2.micro","t2.small"]
  }

  instance_state_names = ["running", "stopped"]
}
