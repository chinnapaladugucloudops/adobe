variable "namesofpeople" {
  description = "map"
  type        = map(string)
  default     = {
    adam      = "mentor"
    superman = "hero"
  }
}
output "bios" {
  value = [for name, role in var.namesofpeople : "${name} is the ${role}"]
}

