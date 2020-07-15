provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0b99c7725b9484f9e"
  instance_type = "t2.micro"
  key_name      = "wezva"

  provisioner "file" {
    source      = "test.conf"
    destination = "/tmp/myapp.conf"
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("wezva.pem")
    host     = self.public_ip
  }
}

