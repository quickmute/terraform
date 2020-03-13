## hello
variable "ATLAS_CONFIGURATION_SLUG"{
  default = ""
}
output "hello_from_module"{
  value = var.ATLAS_CONFIGURATION_SLUG
}
