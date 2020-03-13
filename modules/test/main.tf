## hello
variable "ATLAS_CONFIGURATION_SLUG"{
  default = ""
  type = string
}

variable "ATLAS_WORKSPACE_NAME"{
  default = ""
}

output "workspace"{
  value = var.ATLAS_WORKSPACE_NAME
}
