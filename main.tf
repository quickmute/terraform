variable "ATLAS_WORKSPACE_NAME"{
}

locals{
  version = "1.1"
}

resource "null_resource" "example" {
  triggers = {
      key   = "hello"
      value = formatdate("YYYY-MM-DD hh:mm:ssZZZZZ", timestamp())
  }
}

output "version"{
  value = local.version
}

output "workspace"{
  value = var.ATLAS_WORKSPACE_NAME  
}
