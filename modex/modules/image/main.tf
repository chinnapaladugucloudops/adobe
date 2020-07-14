resource "docker_image" "myimage" {
  name = "${var.image_name}"
}

