provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0927ed83617754711"
  instance_type = "t2.micro"
  key_name      = "wezva"

# Install Ansible & Call Ansible
  provisioner "remote-exec" {
    inline = [
     "sudo apt -y update",
     "sudo apt install -y ansible",
     "sudo ansible --version"
    ]
  }

  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("wezva.pem")
    host     = self.public_ip
  }
}
