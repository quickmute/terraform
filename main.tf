variable "ATLAS_WORKSPACE_NAME"{
}


locals{
  version = "1.1"
}

resource "null_resource" "trigger" {
  triggers = {
      key   = "hello"
      value = formatdate("YYYY-MM-DD hh:mm:ssZZZZZ", timestamp())
  }
}

resource "null_resource" "envs" {
  provisioner "local-exec" {
      command = "printenv"
  }
}


output "version"{
  value = local.version
}

output "workspace"{
  value = var.ATLAS_WORKSPACE_NAME  
}


variable "TFE_RUN_ID"{
}
output "TFE_RUN_ID"{
  value = var.TFE_RUN_ID 
}

variable "ATLAS_ADDRESS"{
}
output "ATLAS_ADDRESS"{
  value = var.ATLAS_ADDRESS
}

variable "ATLAS_CONFIGURATION_SLUG"{
}
output "ATLAS_CONFIGURATION_SLUG"{
  value = var.ATLAS_CONFIGURATION_SLUG
}

module "test" {
  source = "./modules/test/"
}


