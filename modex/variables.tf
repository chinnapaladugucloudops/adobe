variable "myvariable" {
  description = "Image for container."
  default     = "nginx:latest"
}

variable "mycontainer" {
  description = "Name of the container."
  default     = "testme"
}

variable "myint" {
  description = "Internal port for container."
  default     = "80"
}
variable "myext" {
  description = "External port for container."
  default     = "80"
}

