# Download the image
module "image" {
  source = "./modules/image"
  image_name  = "${var.myvariable}"
}

# Start the container
module "container" {
  source             = "./modules/container"
  image              = "${module.image.image_out}"
  container_name     = "${var.mycontainer}"
  int_port           = "${var.myint}"
  ext_port           = "${var.myext}"
}

