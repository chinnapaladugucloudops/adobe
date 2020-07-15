provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0b99c7725b9484f9e"
  instance_type = "t2.micro"
  key_name      = "wezva"

  provisioner "local-exec" {
    command    = "echo 'while true; do echo hi-students; sleep 5; done' > myscript.sh"
  }
  
  provisioner "file" {
    source      = "myscript.sh"
    destination = "/tmp/myscript.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/myscript.sh",
      "/tmp/myscript.sh",
    ]
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("wezva.pem")
    host     = self.public_ip
  }
}
