provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Download the latest Centos image
resource "docker_image" "myimg" {
  name = "nginx:stable"
}
