## hello
variable "ATLAS_CONFIGURATION_SLUG"{
  type = string
}
output "hello_from_module"{
  value = var.ATLAS_CONFIGURATION_SLUG
}
