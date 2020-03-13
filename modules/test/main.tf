## hello
variable "ATLAS_CONFIGURATION_SLUG"{
  default = ""
  type = string
}

variable "ATLAS_WORKSPACE_NAME"{
  type = string
}

output "hello_from_module"{
  value = var.ATLAS_CONFIGURATION_SLUG
}

output "workspace"{
  value = var.ATLAS_WORKSPACE_NAME
}
