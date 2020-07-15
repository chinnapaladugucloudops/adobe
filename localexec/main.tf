provider "aws" {
  region = "ap-south-1"
}

# Specify the EC2 details
resource "aws_instance" "example" {
  ami           = "ami-0b99c7725b9484f9e"
  instance_type = "t2.micro"
  
  # local-exec provisioner
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.private_ip} >> private_ips.txt"
  }
 
  provisioner "local-exec" {
    command    = "exit 1"
    on_failure = continue
  }

  provisioner "local-exec" {
    command = "echo $MYNAME $MYLOC $MYTOPIC >> env_vars.txt"

    environment = {
      MYNAME = "ADAM"
      MYLOC = "Bangalore"
      MYTOPIC = "TERRAFORM"
    }
  }

   # local-exec provisioner to invoke while machine is destroyed
 provisioner "local-exec" {
    when    = destroy
    command = "rm private_ips.txt"
 }

}

